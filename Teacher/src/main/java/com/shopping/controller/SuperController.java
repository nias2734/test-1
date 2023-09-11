package com.shopping.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface SuperController {
	// 각각의 컨트롤러들이 공통적으로 구현해야 할 메소드를 정의합니다.  
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception;	
}
