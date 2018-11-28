package com.team.cos.bookmark.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team.cos.bookmark.service.BookmarkService;
import com.team.cos.bookmark.vo.BookmarkInfo;

@Controller
public class BookmarkController {
	
	@Autowired
	private BookmarkService service;
	
	@RequestMapping(value="/question/bookmark",method=RequestMethod.POST)
	@ResponseBody
	public String bookmark(BookmarkInfo bookmarkInfo) {
		
		String result= "";
		
		if(service.bookmarkSelectCnt(bookmarkInfo)==0) {
			service.insertBookmark(bookmarkInfo);
			result =  "{\"message\": \"" + "insert" + "\"}";
		}else {
			service.deleteBookmark(bookmarkInfo);
			result =  "{\"message\": \"" + "delete" + "\"}";
		}
		return result;
	}
}
