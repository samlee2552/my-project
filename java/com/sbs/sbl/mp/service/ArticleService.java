package com.sbs.sbl.mp.service;

import com.sbs.sbl.mp.dto.Article;

public class ArticleService {

	public Article getArticlesForList() {
		
		return articleDao.getArticles();
	}

}
