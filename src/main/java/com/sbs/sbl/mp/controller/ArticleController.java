package com.sbs.sbl.mp.controller;

import java.util.List;
import java.util.Map;

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
@RequestMapping("article/*")
public class ArticleController {
	@Autowired
	private ArticleService articleService;
	
	//게시물 리스트
	/* 게시판 별 리스트 */
	@RequestMapping("{boardCode}-list")
	public String showList(Model model, @PathVariable("boardCode") String boardCode) {
		Board board = articleService.getBoardByCode(boardCode);
		List<Article> articles = articleService.getArticlesForList(board.getId());
		
		model.addAttribute("boardName", board.getName());
		model.addAttribute("boardCode", board.getCode());
		model.addAttribute("articles", articles);
		
		return "article/list";
	}
	
	/* 전체 리스트 */
	@RequestMapping("list")
	public String showEntireList(Model model, String boardCode, @RequestParam Map<String, Object> param) {
		int boardId = 0;
		List<Article> articles = articleService.getArticlesForList(boardId);
		
		model.addAttribute("boardName", "전체");
		model.addAttribute("boardCode", "entire");
		model.addAttribute("articles", articles);
		
		return "article/list";
	}
	
	//상세보기
	@RequestMapping("{boardCode}-detail")
	public String showDetail(Model model, @RequestParam Map<String, Object> param, @PathVariable("boardCode") String boardCode, String listUrl) {
		if ( listUrl == null ) {
			listUrl = "./" + boardCode + "-list";
		}
		
		int id = Integer.parseInt((String) param.get("id"));
		
		Article article = articleService.getArticleByIdForDetail(id);
		
		System.out.println(article);
		System.out.println(article);
		System.out.println(article);
		System.out.println(article);
		System.out.println(article);
		Board board = articleService.getBoardById(article.getBoardId());
		
		System.out.println(param);
		System.out.println(param);
		System.out.println(param);
		System.out.println(param);
		
		model.addAttribute("article", article);
		model.addAttribute("board", board);
		model.addAttribute("listUrl", listUrl);

		return "article/detail";
	}
	
	//수정
	@RequestMapping("{boardCode}-modify")
	public String showModify(Model model, @RequestParam Map<String, Object> param, @PathVariable("boardCode") String boardCode, String listUrl) {
		if ( listUrl == null ) {
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
	public String doModify(Model model, @RequestParam Map<String, Object> param, @PathVariable("boardCode") String boardCode, int id, int boardId) {

		Map<String, Object> newParam = Util.getNewMapOf(param, "id", "boardId", "title", "body");
		articleService.modify(newParam);
		String redirectUri = (String) param.get("redirectUri");
		model.addAttribute("redirectUri", redirectUri);
		return "common/redirect";
	}
	
	//삭제
	@RequestMapping("{boardCode}-delete")
	public String delete(Model model, @PathVariable("boardCode") String boardCode, int id) {
		Board board = articleService.getBoardByCode(boardCode);
		model.addAttribute("board", board);
		
		articleService.delete(id);
		String redirectUri = "./" + boardCode + "-list";
		return "redirect:" + redirectUri;
	}
	
	//글쓰기
	@RequestMapping("write")
	public String showWrite(Model model, @RequestParam Map<String, Object> param) {
		List<Board> boards = articleService.getBoards();
		model.addAttribute("boards", boards);
		
		return "article/write";
	}
	
	@RequestMapping("doWrite")
	public String doWrite(Model model, @RequestParam Map<String, Object> param, int boardId, HttpSession session, String redirectUri) {
		String memberId = (String) session.getAttribute("loginedMemberId");
		Map<String, Object> newParam = Util.getNewMapOf(param, "title", "body", "boardId", "memberId");
		int id = articleService.write(newParam);
		model.addAttribute(redirectUri);
		
		return "common/redirect";
	}

}
