package com.sbs.sbl.mp.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.sbs.sbl.mp.dao.ArticleDao;
import com.sbs.sbl.mp.dto.Article;
import com.sbs.sbl.mp.dto.Reply;
import com.sbs.sbl.mp.dto.Board;
import com.sbs.sbl.mp.dto.Member;
import com.sbs.sbl.mp.dto.ResultData;
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

	public int write(String title, String body, String boardId, int memberId) {
		return articleDao.write(title, body, boardId, memberId);
	}
	/* 끝 */
	
	//댓글 =================================
	//댓글 작성
	public int writeReply(Map<String, Object> param) {
		articleDao.writeReply(param);

		return Util.getAsInt(param.get("id"));
	}
	//댓글 리스트
	public List<Reply> getForPrintReplies(@RequestParam Map<String, Object> param) {
		List<Reply> replies = articleDao.getForPrintReplies(param);

		Member actor = (Member)param.get("actor");

		for ( Reply reply : replies ) {
			// 출력용 부가데이터를 추가한다.
			updateForPrintInfo(actor, reply);
		}

		return replies;
	}

	private void updateForPrintInfo(Member actor, Reply reply) {
		reply.getExtra().put("actorCanDelete", actorCanDelete(actor, reply));
		reply.getExtra().put("actorCanModify", actorCanModify(actor, reply));
	}

	// 액터가 해당 댓글을 수정할 수 있는지 알려준다.
	public boolean actorCanModify(Member actor, Reply reply) {
		return actor != null && actor.getId() == reply.getMemberId() ? true : false;
		//삼항연산자. 조건이 맞으면 ? 뒤에 첫번째 선택, 아니면 뒤에. 
	}

	// 액터가 해당 댓글을 삭제할 수 있는지 알려준다.
	public boolean actorCanDelete(Member actor, Reply reply) {
		return actorCanModify(actor, reply);
	}
	//댓글 삭제
	public void deleteReply(int id) {
		articleDao.deleteReply(id);
	}
	
	public Reply getForPrintReplyById(int id) {
		return articleDao.getForPrintReplyById(id);
	}

	public ResultData modfiyReply(Map<String, Object> param) {
		articleDao.modifyReply(param);
		return new ResultData("S-1", String.format("%d번 댓글을 수정하였습니다.", Util.getAsInt(param.get("id"))), param);
	}


}
