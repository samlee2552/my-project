package com.sbs.sbl.mp.service;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sbs.sbl.mp.dao.ArticleDao;
import com.sbs.sbl.mp.dto.Article;
import com.sbs.sbl.mp.dto.File;
import com.sbs.sbl.mp.util.Util;;

@Service
public class ArticleService {
	@Autowired
	private ArticleDao articleDao;
	@Autowired
	private FileService fileService;

	// 게시물 리스트, 상세보기
	/* 시작 */
	public List<Article> getForPrintArticles(int count) {
		List<Article> articles = articleDao.getForPrintArticles(count);
		return articles;
	}

	// 프로필 화면용 게시물 불러오기
	public List<Article> getForPrintArticlesByMemberId(int memberId) {
		List<Article> articles = articleDao.getForPrintArticlesByMemberId(memberId);
		for(Article article: articles) {
			List<File> files = fileService.getFiles("article", article.getId(), "common", "attachment");
			Map<String, File> filesMap = new HashMap<>();
			
			for (File file : files) {
				filesMap.put(file.getFileNo() + "", file);
			}
			
			if (article.getExtra() == null) {
				article.setExtra(new HashMap<>());
			}
			
			article.getExtra().put("file__common__attachment", filesMap);
		
		}

		return articles;
	}

	public Article getForPrintArticleById(int id) {
		Article article = articleDao.getForPrintArticleById(id);
		List<File> files = fileService.getFiles("article", article.getId(), "common", "attachment");

		Map<String, File> filesMap = new HashMap<>();

		for (File file : files) {
			filesMap.put(file.getFileNo() + "", file);
		}

		if (article.getExtra() == null) {
			article.setExtra(new HashMap<>());
		}

		article.getExtra().put("file__common__attachment", filesMap);

		return article;
	}
	/* 끝 */

	// 게시물 CRUD
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

		String fileIdsStr = (String) param.get("fileIdsStr");

		if (fileIdsStr != null && fileIdsStr.length() > 0) {
			fileIdsStr = fileIdsStr.trim();

			if (fileIdsStr.startsWith(",")) {
				fileIdsStr = fileIdsStr.substring(1);
			}
		}

		if (fileIdsStr != null && fileIdsStr.length() > 0) {
			fileIdsStr = fileIdsStr.trim();

			if (fileIdsStr.equals(",")) {
				fileIdsStr = "";
			}
		}

		if (fileIdsStr != null && fileIdsStr.length() > 0) {
			List<Integer> fileIds = Arrays.asList(fileIdsStr.split(",")).stream().map(s -> Integer.parseInt(s.trim()))
					.collect(Collectors.toList());

			// 파일이 먼저 생성된 후에, 관련 데이터가 생성되는 경우에는, file의 relId가 일단 0으로 저장된다.
			// 그것을 뒤늦게라도 이렇게 고처야 한다.
			for (int fileId : fileIds) {
				fileService.changeRelId(fileId, id);
			}
		}

		return id;
	}
}
