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
	public String showArticleList(Model model, @PathVariable("boardCode") String boardCode) {
		List<Article> articles = articleService.getArticlesForList();
		Board board = articleService.getBoardByCode(boardCode);
		
		model.addAttribute("board", board);
		model.addAttribute("articles", articles);
		
		return "article/list";
	}
	
	@RequestMapping("article/{boardCode}-detai")
	public String showArticleDetail(Model model, @RequestParam Map<String, Object> param, @PathVariable("boardCode") String boardCode) {
		Board board = articleService.getBoardByCode(boardCode);
		model.addAttribute("board", board);
		
		int id = (int) param.get("id");
		Article article = articleService.getArticleByIdForDetail(id);
		return "article/list";
	}
	
	
}
