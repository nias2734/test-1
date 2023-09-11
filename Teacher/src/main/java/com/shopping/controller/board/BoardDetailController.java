package com.shopping.controller.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.controller.SuperClass;
import com.shopping.model.bean.Board;
import com.shopping.model.dao.BoardDao;

public class BoardDetailController extends SuperClass {
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {	
		super.doGet(request, response);
		
		Integer no = Integer.parseInt(request.getParameter("no"));
		BoardDao dao = new BoardDao() ;
		Board bean = null ;
		
		try {
			bean = dao.getDataByPrimaryKey(no);
			
			if(bean == null) {
				super.setAlertMessage("잘못된 게시물 번호입니다.");
				super.gotoPage("common/home.jsp"); 
			}else {
				request.setAttribute("bean", bean) ;
				super.gotoPage("board/boDetail.jsp"); 
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
