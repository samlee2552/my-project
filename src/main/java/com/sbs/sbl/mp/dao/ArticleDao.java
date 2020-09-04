package com.sbs.sbl.mp.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.sbs.sbl.mp.dto.Article;

@Mapper
public interface ArticleDao {

	List<Article> getForPrintArticles();

//	Board getBoardByCode(String code);
//	List<Board> getBoards();

	Article getForPrintArticleById(@Param("id") int id);

	void modify(Map<String, Object> param);

	void delete(int id);


	int write(Map<String, Object> param);

}
