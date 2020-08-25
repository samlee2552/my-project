package com.sbs.sbl.mp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sbs.sbl.mp.dao.ArticleDao;
import com.sbs.sbl.mp.dto.Article;
import com.sbs.sbl.mp.dto.Board;

@Service
public class ArticleService {
	@Autowired
	private ArticleDao articleDao;
	
	public List<Article> getArticlesForList() {
		
		return articleDao.getArticlesForList();
	}

	public Board getBoardByCode(String code) {
		return articleDao.getBoardByCode(code);
	}

	public Article getArticleByIdForDetail(int id) {
		return getArticleByIdForDetail(id);
	}

}
