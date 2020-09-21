package com.sbs.sbl.mp.dto;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.sbs.sbl.mp.service.ArticleService;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Article {
	
	private int id;
	private int boardId;
	private int memberId;
	private String regDate;
	private String updateDate;
	private String delDate;
	private boolean delStatus;
	private boolean authStatus;
	private String body;
	private Map<String, Object> extra;
	
	public String getDetailLink(int id) {
			return "/usr/article/detail?id=" + id;	
	}
	
	public String getListLinkByMemberId() {
		return "/usr/member/profile?memberId=" + memberId;
	}
}
