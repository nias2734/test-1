<%@page import="com.shopping.utility.Paging"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/bootstrap5.jsp" %>
<%@ include file="./../common/common.jsp" %>      
<%
	String _pageNumber = "12" ;
	String _pageSize = "10" ;
	int totalCount = 283 ;
	String url = "boList" ;
	String mode = "" ;
	String keyword = "" ;
	boolean isGrid = false ;
	
	Paging pageInfo = new Paging(_pageNumber, _pageSize, totalCount, url, mode, keyword, isGrid);	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%=pageInfo.toString()%>
</body>
</html>