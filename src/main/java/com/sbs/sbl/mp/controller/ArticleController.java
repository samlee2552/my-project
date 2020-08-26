package com.sbs.sbl.mp.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sbs.sbl.mp.dto.Article;
import com.sbs.sbl.mp.dto.Board;
import com.sbs.sbl.mp.service.ArticleService;
import com.sbs.sbl.mp.util.Util;


@Controller
public class ArticleController {
	@Autowired
	private ArticleService articleService;
	
	//게시물 리스트
	@RequestMapping("/article/{boardCode}-list")
	public String showList(Model model, @PathVariable("boardCode") String boardCode) {
		List<Article> articles = articleService.getArticlesForList();
		Board board = articleService.getBoardByCode(boardCode);
		
		model.addAttribute("board", board);
		model.addAttribute("articles", articles);
		
		return "article/list";
	}
	
	//상세보기
	@RequestMapping("article/{boardCode}-detail")
	public String showDetail(Model model, @RequestParam Map<String, Object> param, @PathVariable("boardCode") String boardCode, String listUrl) {
		if ( listUrl == null ) {
			listUrl = "./" + boardCode + "-list";
		}
		
		int id = Integer.parseInt((String) param.get("id"));
		
		Board board = articleService.getBoardByCode(boardCode);
		Article article = articleService.getArticleByIdForDetail(id);
		
		model.addAttribute("article", article);
		model.addAttribute("board", board);
		model.addAttribute("listUrl", listUrl);

		return "article/detail";
	}
	
	//수정
	@RequestMapping("article/{boardCode}-modify")
	public String showModify(Model model, @RequestParam Map<String, Object> param, @PathVariable("boardCode") String boardCode, String listUrl) {
		if ( listUrl == null ) {
			listUrl = "./" + boardCode + "-list";
		}
		int id = Integer.parseInt((String) param.get("id"));

		Board board = articleService.getBoardByCode(boardCode);
		Article article = articleService.getArticleByIdForDetail(id);
		
		model.addAttribute("board", board);
		model.addAttribute("article", article);
		model.addAttribute("listUrl", listUrl);

		return "article/modify";
	}
	
	@RequestMapping("article/{boardCode}-doModify")
	public String doModify(Model model, @RequestParam Map<String, Object> param, @PathVariable("boardCode") String boardCode, int id) {
		Board board = articleService.getBoardByCode(boardCode);
		model.addAttribute("board", board);
		Map<String, Object> newParam = Util.getNewMapOf(param, "id", "title", "body");
		
		articleService.modify(newParam);
		String redirectUri = (String) param.get("redirectUri");
		model.addAttribute("redirectUri", redirectUri);
		return "common/redirect";
	}
	
	//삭제
	@RequestMapping("article/{boardCode}-delete")
	public String delete(Model model, @PathVariable("boardCode") String boardCode, int id) {
		Board board = articleService.getBoardByCode(boardCode);
		model.addAttribute("board", board);
		
		articleService.delete(id);
		String redirectUri = "./" + boardCode + "-list";
		return "redirect:" + redirectUri;
	}
	
	
}
