<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/bootstrap5.jsp"%>
<%@ include file="./../common/common.jsp"%>
   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
   
<!DOCTYPE html>
<html> 
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style type="text/css">
		body{margin: 10px;}
	</style>	
</head>
<body>
	<!-- 1+3+5+...+99 = 2500 -->
	<c:set var="total" value="0" />
	<c:forEach var="i" begin="1" end="100" step="2">	
		<c:set var="total" value="${total + i}"/>		
	</c:forEach>
	홀수의 총합 : <c:out value="${total}"/><br/> 
	
	<!-- 시험 점수(jumsu)가 82점일때, 학점을 구해 보세요. -->
	<c:set var="jumsu" value="82" />
	
	시험 점수 : <c:out value="${jumsu}" /><br/>
		
	If 구문을 사용한 방식 ==>
	<c:if test="${jumsu >= 90}">
		학점 : A<br/>
	</c:if>
	<c:if test="${jumsu >= 80 and jumsu < 90}">
		학점 : B<br/>
	</c:if>	
	<c:if test="${jumsu >= 70 and jumsu < 80}">
		학점 : C<br/>
	</c:if>
	<c:if test="${jumsu >= 60 and jumsu < 70}">
		학점 : D<br/>
	</c:if>	
	<c:if test="${jumsu < 60}">
		학점 : F<br/>
	</c:if>		
	
	Choose 구문을 사용한 방식 ==>
		
	<c:choose>
		<c:when test="${jumsu ge 90}">
			학점 : A<br/>
		</c:when>
		<c:when test="${jumsu ge 80 and jumsu lt 90}">
			학점 : B<br/>
		</c:when>
		<c:when test="${jumsu ge 70 and jumsu lt 80}">
			학점 : C<br/>
		</c:when>
		<c:when test="${jumsu ge 60 and jumsu lt 70}">
			학점 : D<br/>
		</c:when>
		<c:otherwise>
			학점 : F<br/>
		</c:otherwise>	
	</c:choose>		
</body>
</html>