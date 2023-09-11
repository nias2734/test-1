<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/bootstrap5.jsp" %>
<%@ include file="./../common/common.jsp" %>
<!DOCTYPE html>
	<html>
	<head>
	<style type="text/css">
		body{margin: 10px;}
	</style>
</head>
<body>
	<!-- 1부터 10까지의 총합 구하기 -->
	<c:set var="total" value="0" />
	
	<c:forEach var="i" begin="1" end="10" step="1">
		<c:set var="total" value="${total+i }" /> 
	</c:forEach>
	<c:out value="${total}" />
	<br/>
	
	<!-- 1부터 10까지의 짝수와 홀수의 총합 각각 구하기 -->
	<c:set var="odd" value="0" />
	<c:set var="even" value="0" />
	
	<c:forEach var="i" begin="1" end="10" step="1">
		<c:if test="${i%2==1}">
			<c:set var="odd" value="${odd+i }" /> 
		</c:if>
		<c:if test="${i%2==0}">
			<c:set var="even" value="${even+i }" /> 
		</c:if>		
	</c:forEach>
	
	홀수의 총합 : <c:out value="${odd}" /><br/>
	짝수의 총합 : <c:out value="${even}" /><br/>
	
	<!-- 1부터 10까지의 3의 배수 총합/4의 배수 총합/나머지 총합 구하기 -->
	<c:set var="result01" value="0" />
	<c:set var="result02" value="0" />
	<c:set var="result03" value="0" />
	
	<c:forEach var="i" begin="1" end="10" step="1">
		<c:choose>
			<c:when test="${i mod 3==0}">
				<c:set var="result01" value="${result01+i }" /> 
			</c:when>
			<c:when test="${i mod 4==0}">
				<c:set var="result02" value="${result02+i }" /> 
			</c:when>
			<c:otherwise>
				<c:set var="result03" value="${result03+i }" />
			</c:otherwise>	
		</c:choose>
	</c:forEach>
	
	결과01 : <c:out value="${result01}" /><br/>
	결과02 : <c:out value="${result02}" /><br/>
	결과03 : <c:out value="${result03}" /><br/>
	
	<c:set var="id" value="hong" />
	
	<c:if test="${empty id}">
		비어 있음<br/>
	</c:if>
	
	<c:if test="${not empty id}">
		데이터 ${id}가 들어 있음<br/>
	</c:if>
	
	<c:remove var="id"/>
	<c:if test="${empty id}">
		내용이 없습니다.<br/>
	</c:if>
</body>
</html>