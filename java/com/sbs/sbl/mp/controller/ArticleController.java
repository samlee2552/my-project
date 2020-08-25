package com.sbs.sbl.mp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sbs.sbl.mp.service.ArticleService;

@Controller
public class ArticleController {
	@Autowired
	private ArticleService articleService;
	@RequestMapping("/article/list")
	public String showArticleList() {
		Article article = articleService.getArticlesForList();
		
		return "article/list";
	}
	
	
}
