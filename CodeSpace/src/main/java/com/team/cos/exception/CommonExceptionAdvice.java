package com.team.cos.exception;

import org.springframework.http.HttpStatus;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.NoHandlerFoundException;

//예외 처리 목적
@ControllerAdvice
public class CommonExceptionAdvice {
	
/*	@ExceptionHandler(Exception.class)
	public String exception(Exception ex, Model model) {
		
		model.addAttribute("excepion", ex);
		return "/error/error_page";
	}*/
	
/*	@ExceptionHandler(NoHandlerFoundException.class)
	@ResponseStatus(HttpStatus.NOT_FOUND)
	public String handle404(NoHandlerFoundException ex, Model model) {
		ex.getStackTrace();
		
		model.addAttribute("excepion", ex);
		return "/error/custom404";
	}*/
	

}
