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


@Controller
public class ArticleController {
	@Autowired
	private ArticleService articleService;
	@RequestMapping("/article/{boardCode}-list")
	public String showList(Model model, @PathVariable("boardCode") String boardCode) {
		List<Article> articles = articleService.getArticlesForList();
		Board board = articleService.getBoardByCode(boardCode);
		
		model.addAttribute("board", board);
		model.addAttribute("articles", articles);
		
		return "article/list";
	}
	
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
	
	@RequestMapping("article/{boardCode}-modify")
	public String showModify(Model model, @RequestParam Map<String, Object> param, @PathVariable("boardCode") String boardCode, String listUrl) {
		if ( listUrl == null ) {
			listUrl = "./" + boardCode + "-list";
		}
		model.addAttribute("listUrl", listUrl);
		Board board = articleService.getBoardByCode(boardCode);
		model.addAttribute("board", board);
		
		int id = Integer.parseInt((String) param.get("id"));
		Article article = articleService.getArticleByIdForDetail(id);
		model.addAttribute("article", article);

		return "article/modify";
	}
	

	
	
}
