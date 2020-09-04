package com.sbs.sbl.mp.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sbs.sbl.mp.dao.ArticleDao;
import com.sbs.sbl.mp.dto.Article;
import com.sbs.sbl.mp.util.Util;

@Service
public class ArticleService {
	@Autowired
	private ArticleDao articleDao;
	//게시판 관련
	/* 시작 */
//	public Board getBoardByCode(String code) {
//		return articleDao.getBoardByCode(code);
//	}
//	
//	public List<Board> getBoards() {
//		List<Board> boards = articleDao.getBoards();
//		return boards;
//	}
	/* 끝 */
	
	//게시물 리스트, 상세보기
	/* 시작 */
	public List<Article> getArticlesForList() {
		List<Article> articles = articleDao.getArticlesForList();
		return articles;
	}
	
	public Article getArticleByIdForDetail(int id) {
		Article article = articleDao.getArticleByIdForDetail(id);
		return article;
	}
	/* 끝 */
	
	//게시물 CRUD
	/* 시작 */
	public void modify(Map<String, Object> param) {
		articleDao.modify(param);
	}

	public void delete(int id) {
		articleDao.delete(id);
	}

	public int write(Map<String, Object> param) {
		articleDao.write(param);
		int id = Util.getAsInt(param.get("id"));
		return id;
	}
}
