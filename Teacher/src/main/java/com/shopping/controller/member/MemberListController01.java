package com.shopping.controller.member;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.controller.SuperClass;
import com.shopping.model.bean.Member;
import com.shopping.model.dao.MemberDao;

public class MemberListController01 extends SuperClass {
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		
		MemberDao dao = new MemberDao();
		try {
			List<Member> lists = dao.selectAll();
			
			request.setAttribute("datalist", lists);
			super.gotoPage("member/meList.jsp");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
