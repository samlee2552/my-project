package com.sbs.sbl.mp.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.sbs.sbl.mp.dto.Article;
import com.sbs.sbl.mp.dto.Board;

@Mapper
public interface ArticleDao {

	List<Article> getArticlesForList(@Param("boardId") int boardId);

	Board getBoardByCode(String code);

	Article getArticleByIdForDetail(@Param("id") int id);

	void modify(Map<String, Object> param);

	void delete(int id);

	List<Board> getBoards();

	int write(Map<String, Object> param);

	Board getBoardById(@Param("id") int id);

	int write(String title, String body, String boardId, int memberId);

	void writeReply(Map<String, Object> param);
	
}
