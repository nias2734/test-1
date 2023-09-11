package com.shopping.controller.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.controller.SuperClass;
import com.shopping.model.bean.Board;
import com.shopping.model.dao.BoardDao;

public class BoardUpdateController extends SuperClass {
	private final String PREFIX = "board/" ;
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		
		// 수정할 게시물 번호를 우선 챙깁니다. 
		Integer no = Integer.parseInt(request.getParameter("no")) ;
		
		BoardDao dao = new BoardDao() ;
		Board bean = dao.GetDataByPk(no) ;
		request.setAttribute("bean", bean); 
		
		super.gotoPage(PREFIX + "boUpdateForm.jsp");	
	}
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doPost(request, response);
		
		Board bean = new Board() ;
		bean.setNo(Integer.parseInt(request.getParameter("no")));
		bean.setId(request.getParameter("id"));
		bean.setPassword(request.getParameter("password"));
		bean.setSubject(request.getParameter("subject"));
		bean.setContent(request.getParameter("content"));
		bean.setRegdate(request.getParameter("regdate"));
		
		BoardDao dao = new BoardDao() ;
		int cnt = -1 ;
		try {
			cnt = dao.UpdateData(bean);	
			
			if(cnt == -1) { // 등록 실패
				new BoardUpdateController().doGet(request, response);
				
			}else { // 성공
				// 게시물 목록 보기 페이지로 이동합니다.
				// 현재 진행 중인 페이지로 이동하기 위하여 페이징 관련 파라미터도 넘겨 주어야 합니다.
				String gotopage = super.getUrlInfomation("boList") ;
				gotopage += "&pageNumber=" + request.getParameter("pageNumber");
				gotopage += "&pageSize=" + request.getParameter("pageSize");
				gotopage += "&mode=" + request.getParameter("mode");
				gotopage += "&keyword=" + request.getParameter("keyword");
				response.sendRedirect(gotopage); 
				
				// 이전 코딩 방식
				//new BoardListController().doGet(request, response);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			new BoardUpdateController().doGet(request, response);
		}		
	}
}
