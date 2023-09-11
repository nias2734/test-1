package com.shopping.controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

// 하위 컨트롤러 들이 공통적으로 사용하는 기능들을 여기에 명시합니다.
public class SuperClass implements SuperController{
	private HttpServletRequest request ; 
	private HttpServletResponse response ; 
	protected HttpSession session ;
	
	public String getUrlInfomation(String todoCommmand) {
		// todoCommmand : todolist.txt 파일에 명시에 커맨드 이름
		// command 이름을 사용하여 FullName 웹 주소 형식으로 반환해 줍니다.
		String appName = this.request.getContextPath() ;
		String mappingName = "/Shopping" ;
		
		String text = appName + mappingName + "?command=" + todoCommmand ;
		return text ;
	}	
	
	public Integer getNumberData(String parameter) {
		// 숫자형 파라미터에 대한 처리를 해주는 메소드
		// 잘못된 숫자 형식이면 0을 반환해 줍니다.
		boolean flag = false ;
		
		flag = parameter==null || parameter.equals("") || parameter.equals("null") ;
		
		return flag ? 0 : Integer.parseInt(parameter); 
	}	
	
	public void setAlertMessage(String message) {
		// session 영역에서 "alertMessage"라는 이름으로 사용자에게 주의/오류/경고 문구 등을 띄워 줍니다.
		// in common.jsp 파일 하단 참조
		session.setAttribute("alertMessage", message);
	}	 
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		this.request = request ;
		this.response = response ;
		this.session = request.getSession() ;
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		this.request = request ;
		this.response = response ;
		this.session = request.getSession() ;
	}

	public void gotoPage(String gotoPage) {
		if(this.request == null) {
			System.out.println("doGet/doPost() 메소드 호출 누락");
			return ;
		}
		
		// 요청한 페이지로 포워딩 합니다.
		RequestDispatcher dispatcher = null ;
		try {
			dispatcher = request.getRequestDispatcher(gotoPage) ;
			dispatcher.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
