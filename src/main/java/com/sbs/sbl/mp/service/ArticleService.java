package com.sbs.sbl.mp.service;

import java.util.List;
import java.util.Map;

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
		List<Article> articles = articleDao.getArticlesForList();
		return articles;
	}

	public Board getBoardByCode(String code) {
		return articleDao.getBoardByCode(code);
	}

	public Article getArticleByIdForDetail(int id) {
		Article article = articleDao.getArticleByIdForDetail(id);
		return article;
	}

	public void modify(Map<String, Object> param) {
		articleDao.modify(param);
	}

	public void delete(int id) {
		articleDao.delete(id);
	}

}
