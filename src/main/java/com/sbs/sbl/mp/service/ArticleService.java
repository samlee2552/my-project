package com.sbs.sbl.mp.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sbs.sbl.mp.dao.ArticleDao;
import com.sbs.sbl.mp.dto.Article;
import com.sbs.sbl.mp.dto.Board;
import com.sbs.sbl.mp.util.Util;

@Service
public class ArticleService {
	@Autowired
	private ArticleDao articleDao;
	//게시판 관련
	/* 시작 */
	public Board getBoardByCode(String code) {
		return articleDao.getBoardByCode(code);
	}
	
	public Board getBoardById(int id) {
		return articleDao.getBoardById(id);
	}
	
	public List<Board> getBoards() {
		List<Board> boards = articleDao.getBoards();
		return boards;
	}
	/* 끝 */
	
	//게시물 리스트, 상세보기
	/* 시작 */
	public List<Article> getArticlesForList(int boardId) {
		List<Article> articles = articleDao.getArticlesForList(boardId);
		return articles;
	}
	
	public Article getArticleByIdForDetail(int id) {
		Article article = articleDao.getArticleByIdForDetail(id);
		return article;
	}
	/* 끝 */
	
	//CRUD
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

	public int write(String title, String body, String boardId, int memberId) {
		return articleDao.write(title, body, boardId, memberId);
	}

	public int writeReply(Map<String, Object> param) {
		articleDao.writeReply(param);

		return Util.getAsInt(param.get("id"));
	}


}
