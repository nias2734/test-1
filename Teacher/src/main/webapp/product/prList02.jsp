<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="./../common/bootstrap5.jsp" %>
<%@ include file="./../common/common.jsp" %>

<%@page import="com.shopping.model.dao.ProductDao"%>
<%@page import="com.shopping.model.bean.Product"%>

<%
	ProductDao dao = new ProductDao();
	List<Product> lists = dao.getDataList();
	//out.print("목록 개수 : " + lists.size()) ;
	
	// request라는 저장소(캐비넷)에 lists을 저장하는 데, 이름은 "datalist"입니다.
	// 속성(attribute)은 저장하고자 하는 어떠한 데이터 
	// 데이터가 저장되는 저장소를 영역(scope)이라고 합니다. 
	
	request.setAttribute("datalist", lists) ;
%>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script type="text/javascript">
		$(document).ready(function(){
			// Initialize popoveer
			var popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'))
			var popoverList = popoverTriggerList.map(function (popoverTriggerEl) {
  				return new bootstrap.Popover(popoverTriggerEl);
			});

		});
	</script>	
	<style type="text/css">
		.container{margin-top: 10px;}
		/* table 셀의 수평 가운데 정렬 */
		.card{margin-left:auto;margin-right:auto;}
		.card-img-top{width:300px;height:300px;}
		.removeUnderLine{text-decoration-line: none;}
	</style>
</head>
<body>
	<div class="container">
		<h2>상품 목록</h2>
		<p>고객들이 구매하고자 하는 상품 목록을 보여 주는 페이지입니다.</p>		
		<table class="table table-borderless">
			<thead>
			</thead>
			<tbody>
				<c:set var="colsu" value="3"/>
				<c:forEach var="bean" items="${requestScope.datalist}" varStatus="status">
					<c:if test="${status.index mod colsu == 0}">
						<tr>
					</c:if>				 
					<td> 
						<div class="card" style="width:19rem;">
							<a class="removeUnderLine"  href="prDetail02.jsp?pnum=${bean.pnum}">
								<img class="card-img-top" alt="${bean.name}" src="./../image/${bean.image01}">
								<div class="card-body"> 
									<h5 class="card-title">${bean.name}</h5> 
									<p class="card-text">
										<span data-bs-toggle="popover" 
											title="${bean.name}" 
											data-bs-trigger="hover"
											data-bs-content="${bean.contents}">
											<c:if test="${fn:length(bean.contents) >= 10}">
											 	${fn:substring(bean.contents, 0, 10)}...
											</c:if>
										</span>
										
										<c:if test="${fn:length(bean.contents) < 10}">
										 	${bean.contents}
										</c:if>
									</p>									
								</div>
							</a>
						</div>
					</td>
					<c:if test="${status.index mod colsu == (colsu-1)}">
						</tr>
					</c:if>
				</c:forEach>			
			</tbody>
		</table>			
	</div>	 
</body>
</html>