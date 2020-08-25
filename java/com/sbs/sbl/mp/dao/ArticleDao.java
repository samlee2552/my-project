package com.sbs.sbl.mp.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.sbs.sbl.mp.dto.Article;
import com.sbs.sbl.mp.dto.Board;

@Mapper
public interface ArticleDao {

	List<Article> getArticlesForList();

	Board getBoardByCode(String code);

	Article getArticleByIdForDetail(int id);
	
}
