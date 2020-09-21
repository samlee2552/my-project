package com.sbs.sbl.mp.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sbs.sbl.mp.dto.Article;
import com.sbs.sbl.mp.service.ArticleService;
import com.sbs.sbl.mp.util.Util;

@Controller
@RequestMapping("usr/article/*")
public class ArticleController {
	@Autowired
	private ArticleService articleService;

	/* 전체 리스트 */
	@RequestMapping("list")
	public String showEntireList(Model model) {
		
		int articleCount = 10;
		List<Article> articles = articleService.getForPrintArticles(articleCount);
		model.addAttribute("articles", articles);

		return "article/list";
	}
	

	// 상세보기
	@RequestMapping("detail")
	public String showDetail(Model model, @RequestParam Map<String, Object> param) {

		int id = Integer.parseInt((String) param.get("id")); 

		Article article = articleService.getForPrintArticleById(id);

		model.addAttribute("article", article);

		return "article/detail";
	}

	// 수정
	@RequestMapping("modify")
	public String showModify(Model model, @RequestParam Map<String, Object> param, String listUrl) {
		
		int id = Integer.parseInt((String) param.get("id"));

		Article article = articleService.getForPrintArticleById(id);

		model.addAttribute("article", article);
		model.addAttribute("listUrl", listUrl);

		return "article/modify";
	}

	@RequestMapping("doModify")
	public String doModify(Model model, @RequestParam Map<String, Object> param, int id) {

		Map<String, Object> newParam = Util.getNewMapOf(param, "id", "body");
		articleService.modify(newParam);

		String redirectUri = (String) param.get("redirectUri");
		return "redirect:" + redirectUri;
	}

	// 글쓰기
	@RequestMapping("write")
	public String showWrite(Model model, @RequestParam Map<String, Object> param, String listUrl) {
		if ( listUrl == null ) {
			listUrl = "./list";
		}
		
		return "article/write";
	}

	@RequestMapping("doWrite")
	public String doWrite(@RequestParam Map<String, Object> param,	Model model, HttpSession session) {
		int loginedMemberId = (int) session.getAttribute("loginedMemberId");

		Map<String, Object> newParam = Util.getNewMapOf(param, "body", "fileIdsStr");
		newParam.put("memberId", loginedMemberId);

		int newArticldId = articleService.write(newParam);

		String redirectUri = (String) param.get("redirectUri");
		redirectUri = redirectUri.replace("#id", newArticldId + "");
		return "redirect:" + redirectUri;
	}
}
