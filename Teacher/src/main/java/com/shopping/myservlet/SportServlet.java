package com.shopping.myservlet;

import java.io.IOException;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.sport.SportController;
import com.shopping.utility.MyUtility;

@WebServlet(urlPatterns = {"/Sport"}, initParams = {
	@WebInitParam(name = "sport", value = "/WEB-INF/sport.txt"),
	@WebInitParam(name = "txtSetting", value = "/WEB-INF/setting2.txt")
})
public class SportServlet extends HttpServlet {
	private String sport = null ; // 컨트롤러 모음
	private String txtSetting = null ; // 정적 문자열 데이터 모음
	
	private ServletContext application = null ;
	
	// map for "transportation.txt"
	private Map<String, SportController> sprotMap = null ;
	
	// map for "setting.txt"
	private Map<String, String> settingMap = null ;
	
	private static final long serialVersionUID = 1L;
    public SportServlet() {}
    
    @Override
    public void init(ServletConfig config) throws ServletException {
    	System.out.println(this.getClass() + " init() called"); 
    	this.sport = config.getInitParameter("sport") ;
    	System.out.println("sport is [" + sport + "]"); 
    	
       	this.txtSetting = config.getInitParameter("txtSetting") ;
    	System.out.println("txtSetting is [" + txtSetting + "]"); 
    	
    	
    	this.application = config.getServletContext() ;
    	
    	String webFullPathName = application.getRealPath(sport) ;
    	System.out.println("webFullPathName is [" + webFullPathName + "]");
    	
    	String webSettingName = application.getRealPath(txtSetting) ;
    	System.out.println("webSettingName is [" + webSettingName + "]");
    	    	
    	
    	sprotMap = MyUtility.getSportMap(webFullPathName);
    	System.out.println("맵 사이즈 : " + sprotMap.size());
    	
    	settingMap = MyUtility.getSettingMap(webSettingName);
    	
    	// map : 모든 이가 공유할 데이터 객체 이름
    	application.setAttribute("map", settingMap);
    }
   
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String command = request.getParameter("command") ;
		System.out.println("command is [" + command + "]"); 
		
		SportController controller = sprotMap.get(command) ;
		if(controller != null) {
			controller.play();
		}else {
			System.out.println("request command is not found");
		}
		
		String gotopage = "example/sportTo.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(gotopage) ;
		dispatcher.forward(request, response); 
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doProcess(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doProcess(request, response);
	}
}
