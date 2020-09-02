package com.sbs.sbl.mp.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.sbs.sbl.mp.dto.Article;
import com.sbs.sbl.mp.dto.ArticleReply;
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
	
	//댓글 ==================
	
	//댓글 작성
	void writeReply(Map<String, Object> param);
	//댓글 리스트
	List<ArticleReply> getForPrintArticleReplies(Map<String, Object> param);
	//댓글 삭제
	void deleteReply(@Param("id") int id);
	
	ArticleReply getForPrintArticleReplyById(@Param("id") int id);

	void modifyReply(Map<String, Object> param);
	
}
