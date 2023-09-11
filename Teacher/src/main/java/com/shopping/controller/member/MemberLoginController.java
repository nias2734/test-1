package com.shopping.controller.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.controller.HomeController;
import com.shopping.controller.SuperClass;
import com.shopping.model.bean.Member;
import com.shopping.model.dao.MemberDao;

public class MemberLoginController extends SuperClass{
	private final String PREFIX = "member/" ;

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {		
		super.doGet(request, response);
		super.gotoPage(PREFIX + "meLoginForm.jsp");
	}
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doPost(request, response);
		
		String id = request.getParameter("id") ;
		String password = request.getParameter("password") ;
		System.out.println(id + "/" + password);
		
		MemberDao dao = new MemberDao() ;
		Member bean = null ; 
		
		try {
			bean = dao.getDataByPk(id, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(bean == null) { // 로그인 실패
			String message = "로그인 정보가 잘못 되었습니다.";
			super.setAlertMessage(message) ;
			
			super.gotoPage(PREFIX + "meLoginForm.jsp");
			
		}else { // 로그인 성공
			// session 영역에 나의 로그인 정보를 저장합니다.
			super.session.setAttribute("loginfo", bean);
			
			// 홈 화면으로 이동합니다. 차후 상품 목록 페이지로 갈 예정
			new HomeController().doGet(request, response) ;
		}
	}
}











