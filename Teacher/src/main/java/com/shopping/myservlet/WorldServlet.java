package com.shopping.myservlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shopping.model.bean.Hello;
import com.shopping.model.bean.World;

/**
 * Servlet implementation class HelloServlet
 */
@WebServlet(
		urlPatterns = { "/world" }, 
		initParams = { 
				@WebInitParam(name = "tel", value = "0212345678"), 
				@WebInitParam(name = "fax", value = "0211112222")
		})
public class WorldServlet extends HttpServlet {
	private String tel ;
	private String fax ;		
	
	private static final long serialVersionUID = 1L;    
	public WorldServlet() { }
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(this.getClass() + " doPost");
		Integer pnum = Integer.parseInt(request.getParameter("pnum"));		
		String company = request.getParameter("company");
		String name = request.getParameter("name");

		Integer price = Integer.parseInt(request.getParameter("price"));		

//		System.out.println("pnum : " + pnum);
//		System.out.println("name : " + name);
//		System.out.println("company : " + company);
//		System.out.println("price : " + price);
		
		request.setAttribute("pnum", pnum);
		request.setAttribute("name", name);
		request.setAttribute("company", company);
		request.setAttribute("price", price);
		
		World bean = new World();
		bean.setPnum(pnum);
		bean.setName(name);
		bean.setCompany(company);
		bean.setPrice(price);
		
		request.setAttribute("bean", bean);
		
		HttpSession session =  request.getSession();
		session.setAttribute("tel", this.tel);
		session.setAttribute("fax", this.fax);
		
		String gotopage = "example/servletTo02.jsp";
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(gotopage) ;
		dispatcher.forward(request, response); 
	}	

	public void init(ServletConfig config) throws ServletException {
		System.out.println("서블릿이 초기화 됩니다.");
		this.tel = config.getInitParameter("tel");
		this.fax = config.getInitParameter("fax");
		
		System.out.println("tel : " + tel);
		System.out.println("fax : " + fax);
		
		ServletContext application = config.getServletContext();
		String world = "온난화로 인하여 전세계가 더워요.";
		application.setAttribute("world", world); 		
	}

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String method = request.getMethod() ;
		if(method.equalsIgnoreCase("post")) {
			this.doPost(request, response);
		}else {
			this.doGet(request, response);
		}
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(this.getClass() + " doGet");
	}
}
