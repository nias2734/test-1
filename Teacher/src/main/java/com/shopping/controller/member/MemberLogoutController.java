package com.shopping.controller.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.controller.SuperClass;

public class MemberLogoutController extends SuperClass {
	@Override // 회원이 로그 아웃을 시도합니다.
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		
		// 로그인시 저장했던 로그인 정보 등을 깨끗히 비웁니다.
		super.session.invalidate();
		
		super.gotoPage("member/meLoginForm.jsp"); // 로그인 페이지로 이동함
	}
}