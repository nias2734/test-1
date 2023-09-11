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

/**
 * Servlet implementation class HelloServlet
 */
@WebServlet(
		urlPatterns = { "/hello" }, 
		initParams = { 
				@WebInitParam(name = "company", value = "IT 교육 센터", description = "강남에 있어요^^"), 
				@WebInitParam(name = "address", value = "강남구 역삼동")
		})
public class HelloServlet extends HttpServlet {
	private String company ;
	private String address ;	
	
	private static final long serialVersionUID = 1L;    
	public HelloServlet() { }
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(this.getClass() + " doPost");
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		Integer age = Integer.parseInt(request.getParameter("age"));
		String[] hobbies = request.getParameterValues("hobby");
		
		String hobby = "" ;
		if(hobbies == null) {
			hobby = "" ;
		}else {
			for (int i = 0; i < hobbies.length; i++) {
				hobby += hobbies[i] + "," ;
			}
		}

		System.out.println("id : " + id);
		System.out.println("name : " + name);
		System.out.println("age : " + age);
		System.out.println("hobby : " + hobby);
		
		// 개별 변수를 바인딩
		request.setAttribute("id", id);
		request.setAttribute("name", name);
		request.setAttribute("age", age);
		request.setAttribute("hobby", hobby);
		
		// bean 객체를 이용한 바인딩
		Hello bean = new Hello();
		bean.setAge(age);
		bean.setHobby(hobby);
		bean.setId(id);
		bean.setName(name);
		
		request.setAttribute("bean", bean);
		
		HttpSession session =  request.getSession();
		session.setAttribute("company", company);
		session.setAttribute("address", address);
		
		String gotopage = "example/servletTo01.jsp";
		
		// 리다이렉션 방식
		// 이 방식은 request 객체를 다시 만들기 때문에 이전 바인딩 정보가 휘발이 됩니다.
		//response.sendRedirect(gotopage); ;
		
		// 포워딩 방식
		RequestDispatcher dispatcher = request.getRequestDispatcher(gotopage) ;
		dispatcher.forward(request, response); 
		
	}	
	public void init(ServletConfig config) throws ServletException {
		System.out.println("서블릿이 초기화 됩니다.");
		this.company = config.getInitParameter("company");
		this.address = config.getInitParameter("address");
		
		System.out.println("company : " + this.company);
		System.out.println("address : " + this.address);		
		
		ServletContext application = config.getServletContext();
		String hello = "여러분 안녕하세요.";
		application.setAttribute("hello", hello); 
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
