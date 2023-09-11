package com.shopping.controller.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.controller.SuperClass;
import com.shopping.model.bean.Board;
import com.shopping.model.dao.BoardDao;

public class BoardListController01 extends SuperClass{
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		
		BoardDao dao = new BoardDao();
		try {
			List<Board> lists = dao.selectAll();
			
			request.setAttribute("datalist", lists);
			super.gotoPage("board/boList.jsp");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
