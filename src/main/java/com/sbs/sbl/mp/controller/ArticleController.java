package com.sbs.sbl.mp.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sbs.sbl.mp.dto.Article;
import com.sbs.sbl.mp.dto.Board;
import com.sbs.sbl.mp.service.ArticleService;
import com.sbs.sbl.mp.util.Util;

@Controller
@RequestMapping("usr/article/*")
public class ArticleController {
	@Autowired
	private ArticleService articleService;

	// 게시물 리스트
	/* 게시판 별 리스트 */
	@RequestMapping("{boardCode}-list")
	public String showList(Model model, @PathVariable("boardCode") String boardCode) {
		int boardId = 0;
		Board board = articleService.getBoardByCode(boardCode);
		List<Article> articles;

		if (boardCode.equals("entire") && board == null) {
			model.addAttribute("boardName", "전체");
			articles = articleService.getArticlesForList(boardId);
		} else {
			model.addAttribute("boardName", board.getName());
			model.addAttribute("boardCode", board.getCode());
			articles = articleService.getArticlesForList(board.getId());
		}

		model.addAttribute("articles", articles);
		return "article/list";
	}

	/* 전체 리스트 */
	@RequestMapping("list")
	public String showEntireList(Model model, String boardCode) {
		int boardId = 0;
		List<Article> articles = articleService.getArticlesForList(boardId);
		List<Board> boards = articleService.getBoards();

		model.addAttribute("boards", boards);
		model.addAttribute("boardName", "전체");
		model.addAttribute("boardCode", "entire");
		model.addAttribute("articles", articles);

		return "article/list";
	}

	// 상세보기
	@RequestMapping("{boardCode}-detail")
	public String showDetail(Model model, @RequestParam Map<String, Object> param,
			@PathVariable("boardCode") String boardCode, String listUrl) {
		if (listUrl == null) {
			listUrl = "./" + boardCode + "-list";
		}

		int id = Integer.parseInt((String) param.get("id"));

		Article article = articleService.getArticleByIdForDetail(id);

		Board board = articleService.getBoardById(article.getBoardId());

		model.addAttribute("article", article);
		model.addAttribute("board", board);
		model.addAttribute("listUrl", listUrl);

		return "article/detail";
	}

	// 수정
	@RequestMapping("{boardCode}-modify")
	public String showModify(Model model, @RequestParam Map<String, Object> param,
			@PathVariable("boardCode") String boardCode, String listUrl) {
		if (listUrl == null) {
			listUrl = "./" + boardCode + "-list";
		}
		int id = Integer.parseInt((String) param.get("id"));
		List<Board> boards = articleService.getBoards();

		Board board = articleService.getBoardByCode(boardCode);
		Article article = articleService.getArticleByIdForDetail(id);

		model.addAttribute("board", board);
		model.addAttribute("boards", boards);
		model.addAttribute("article", article);
		model.addAttribute("listUrl", listUrl);

		return "article/modify";
	}

	@RequestMapping("{boardCode}-doModify")
	public String doModify(Model model, @RequestParam Map<String, Object> param,
			@PathVariable("boardCode") String boardCode, int id, int boardId) {

		Map<String, Object> newParam = Util.getNewMapOf(param, "id", "boardId", "title", "body");
		articleService.modify(newParam);

		String redirectUri = (String) param.get("redirectUri");
		redirectUri = redirectUri.replace("#BoardCode", boardCode + "");
		return "redirect:" + redirectUri;
	}

	// 글쓰기
	@RequestMapping("{boardCode}-write")
	public String showWrite(Model model, @RequestParam Map<String, Object> param, @PathVariable("boardCode") String boardCode) {
		
		List<Board> boards = articleService.getBoards();

		model.addAttribute("boardCode", boardCode);
		model.addAttribute("boards", boards);

		return "article/write";
	}

	@RequestMapping("{boardCode}-doWrite")
	public String doWrite(@PathVariable("boardCode") String boardCode, @RequestParam Map<String, Object> param,
			Model model, HttpSession session, int boardId) {
		int loginedMemberId = (int) session.getAttribute("loginedMemberId");
		Board board = articleService.getBoardById(boardId);

		Map<String, Object> newParam = Util.getNewMapOf(param, "title", "body");
		newParam.put("boardId", boardId);
		newParam.put("memberId", loginedMemberId);

		int newArticldId = articleService.write(newParam);

		String redirectUri = (String) param.get("redirectUri");
		redirectUri = redirectUri.replace("#id", newArticldId + "");
		redirectUri = redirectUri.replace("#boardCode", board.getCode());
		return "redirect:" + redirectUri;
	}
}
