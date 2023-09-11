package com.shopping.controller.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.controller.SuperClass;
import com.shopping.model.bean.Board;
import com.shopping.model.dao.BoardDao;

public class BoardReplyController extends SuperClass {
	private final String PREFIX = "board/" ;
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		
		// 답글의 깊이 제한하기  
		Integer depth = Integer.parseInt(request.getParameter("depth")) ;
		
		final Integer MAX_DEPTH = 3 ;
		if(depth == MAX_DEPTH) {
			String message = "답글의 깊이는 최대 " + MAX_DEPTH + "까지 입니다.";
			super.setAlertMessage(message);
			new BoardListController().doGet(request, response); 
			return ;
		}
		
		Integer replyCount = 0 ; // 총답글의 개수
		final Integer MAX_GROUPNO_COUNT = 5 ; // 동일 그룹 최대 허용 row 개수
		
		int groupno = Integer.parseInt(request.getParameter("groupno")) ;
		BoardDao dao = new BoardDao() ; 
		
		try {
			replyCount = dao.GetReplyCount(groupno) ;
			if(replyCount >= MAX_GROUPNO_COUNT) {
				String message = "최대 답글 개수 " + MAX_GROUPNO_COUNT + "를 초과하였습니다." ;
				super.setAlertMessage(message); 
				new BoardListController().doGet(request, response);
				
			}else {
				super.gotoPage(PREFIX + "boReplyForm.jsp");		
			}
		} catch (Exception e) {
			e.printStackTrace();
		}	
	}
	
	
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doPost(request, response);
		
		Board bean = new Board() ;
		
		// 답글도 신규 작성 개념이므로, 글번호 컬럼은 신경 쓰지 않아도 됩니다.
		// 기타 조회수(readhit), 비고(remark) 컬럼도 신경 쓰지 않아도 됩니다. 		
		bean.setId(request.getParameter("id"));
		bean.setPassword(request.getParameter("password"));
		bean.setSubject(request.getParameter("subject"));
		bean.setContent(request.getParameter("content"));
		bean.setRegdate(request.getParameter("regdate"));
		
		// 답글을 위한 파라미터는 꼭 챙겨야 합니다.
		Integer groupno = Integer.parseInt(request.getParameter("groupno")) ;
		Integer orderno = Integer.parseInt(request.getParameter("orderno")) ;
		Integer depth = Integer.parseInt(request.getParameter("depth")) ;
		
		bean.setGroupno(groupno); // 그룹 번호를 그대로 사용
		bean.setOrderno(orderno + 1); // 순서 번호는 1 증가 시킴
		bean.setDepth(depth + 1);  // 글의 깊이는 1 증가 시킴
		
		BoardDao dao = new BoardDao() ;
		int cnt = -1 ;
		try {
			cnt = dao.ReplyData(bean, orderno);	
			
			if(cnt == -1) { // 등록 실패
				new BoardReplyController().doGet(request, response);
				
			}else { // 성공
				// 게시물 목록 보기 페이지로 이동
				new BoardListController().doGet(request, response); 
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			new BoardReplyController().doGet(request, response);
		}		
	}
}