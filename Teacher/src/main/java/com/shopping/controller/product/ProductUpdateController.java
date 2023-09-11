package com.shopping.controller.product;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.shopping.controller.SuperClass;
import com.shopping.model.bean.Category;
import com.shopping.model.bean.Product;
import com.shopping.model.dao.CategoryDao;
import com.shopping.model.dao.ProductDao;

public class ProductUpdateController extends SuperClass{
	private final String PREFIX = "product/" ;
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		
		// Categories 테이블에서 상품 카테고리 목록을 읽어서 request에 바인딩합니다.
		CategoryDao cdao = new CategoryDao() ;
		List<Category> lists = null ;
		
		// 상품 수정시 넘어 오는 상품 번호를 우선 챙깁니다. 
		Integer pnum = Integer.parseInt(request.getParameter("pnum")) ;
		
		ProductDao pdao = new ProductDao() ;
		Product bean = pdao.GetDataByPk(pnum) ;
		
		try {
			lists = cdao.GetCategoryList("product", "select") ;
			request.setAttribute("categories", lists);
			request.setAttribute("bean", bean); 
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		super.gotoPage(PREFIX + "prUpdateForm.jsp");
	}
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doPost(request, response);
		
		MultipartRequest mr = (MultipartRequest)request.getAttribute("mr") ;
		
		Product bean = new Product() ;
		 
		// 상품 등록과는 다르게 수정은 상품 번호를 반드시 챙겨야 합니다.
		bean.setPnum(super.getNumberData(mr.getParameter("pnum")));
				
		bean.setName(mr.getParameter("name"));
		bean.setCompany(mr.getParameter("company"));
		
		bean.setImage01(mr.getFilesystemName("image01"));
		bean.setImage02(mr.getFilesystemName("image02"));
		bean.setImage03(mr.getFilesystemName("image03"));
		
		bean.setStock(super.getNumberData(mr.getParameter("stock")));
		bean.setPrice(super.getNumberData(mr.getParameter("price")));
		
		bean.setCategory(mr.getParameter("category"));
		bean.setContents(mr.getParameter("contents"));
		
		bean.setPoint(super.getNumberData(mr.getParameter("point")));
		bean.setInputdate(mr.getParameter("inputdate"));	
		
		ProductDao dao = new ProductDao() ;
		int cnt = -1 ;
		try {
			cnt = dao.UpdateData(bean) ; 
			
			if(cnt == -1) {
				super.gotoPage(PREFIX + "prUpdateForm.jsp");
				
			}else {
				// 이전 방식
				//new ProductListController().doGet(request, response);
				
				String gotopage = super.getUrlInfomation("prList") ;
				gotopage += "&pageNumber=" + mr.getParameter("pageNumber");
				gotopage += "&pageSize=" + mr.getParameter("pageSize");
				gotopage += "&mode=" + mr.getParameter("mode");
				gotopage += "&keyword=" + mr.getParameter("keyword");
				response.sendRedirect(gotopage); 
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
