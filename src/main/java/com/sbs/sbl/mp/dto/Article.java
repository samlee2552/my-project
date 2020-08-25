package com.sbs.sbl.mp.dto;

import java.util.Map;

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
	private String title;
	private String body;
	private Map<String, Object> extra;
	
	public String getDetailLink(String boardCode) {
		return "/article/" + boardCode + "-detail?id=" + id;
	}
}
