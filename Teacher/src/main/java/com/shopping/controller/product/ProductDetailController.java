package com.shopping.controller.product;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.controller.SuperClass;
import com.shopping.model.bean.Product;
import com.shopping.model.dao.ProductDao;

public class ProductDetailController extends SuperClass {
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		
		Integer pnum = Integer.parseInt(request.getParameter("pnum")) ;
		ProductDao dao = new ProductDao() ;
		
		try {
			Product bean = dao.GetDataByPk(pnum) ;
			request.setAttribute("bean", bean); 
			
//			String gotopage = super.getUrlInfomation("boList") ;
//			gotopage += "&pageNumber=" + request.getParameter("pageNumber");
//			gotopage += "&pageSize=" + request.getParameter("pageSize");
//			gotopage += "&mode=" + request.getParameter("mode");
//			gotopage += "&keyword=" + request.getParameter("keyword");
//			response.sendRedirect(gotopage); 			
			
			super.gotoPage("product/prDetail.jsp"); 
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
