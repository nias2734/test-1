<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="./../common/bootstrap5.jsp" %>
<%@ include file="./../common/common.jsp" %>
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

			var optionList = $('#mode option');
			for(var i=0 ; i<optionList.length ; i++){
				if(optionList[i].value == '${requestScope.pageInfo.mode}'){
					optionList[i].selected = true ;
				}	
			}
			
			$('#keyword').val('${requestScope.pageInfo.keyword}');			
		});
	</script>	
	<style type="text/css">
		.container{margin-top: 10px;}
		/* table 셀의 수평 가운데 정렬 */
		.card{margin-left:auto;margin-right:auto;}
		.card-img-top{width:300px;height:300px;}
		.removeUnderLine{text-decoration-line: none;}
		#buttonList{margin-top:10px;}		
		#updateAnchor, #deleteAnchor{opacity:0.8;}
		.form-control-sm{border:1px solid Gainsboro;} 		
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
				<%-- from "product_column_size" in settings.txt file --%>
				<c:set var="colsu" value="${applicationScope.map['product_list_column_size']}"/>
				
				<tr>
					<td colspan="${colsu}" align="center">
						<div class="row">
							<div class="col-sm-1"></div>
							<div class="col-sm-10">					
								<form name="myform" action="<%=withFormTag%>" method="get">
									<input type="hidden" name="command" value="prList">
									<div class="row">
										<div class="col-sm-12">
											<select class="form-control-sm" id="mode" name="mode">
												<option value="all" selected="selected">--- 선택해 주세요 ---
												<option value="name">상품명
												<option value="company">제조 회사
												<option value="category">카테고리
												<option value="contents">상품 설명
											</select>
											<input class="form-control-sm" type="text" 
												name="keyword" id="keyword" placeholder="키워드 입력">
											<button type="submit" class="btn btn-warning form-control-sm" onclick="">검색</button>
											<button type="button" class="btn btn-warning form-control-sm" onclick="searchAll();">전체 검색</button>
											<button type="button" class="btn btn-info form-control-sm"  onclick="writeForm();">글 쓰기</button>
											<span class="label label-default">${requestScope.pageInfo.pagingStatus}</span>
										</div>
									</div>
								</form>							
							</div>
							<div class="col-sm-1"></div>
						</div>
					</td>
				</tr>
				
				
				<c:forEach var="bean" items="${requestScope.datalist}" varStatus="status">
					<c:if test="${status.index mod colsu == 0}">
						<tr>
					</c:if>				 
					<td> 
						<div class="card" style="width:19rem;">
							<a class="removeUnderLine"  href="<%=notWithFormTag%>prDetail&pnum=${bean.pnum}${requestScope.pageInfo.flowParameter}">
								<img class="card-img-top" alt="${bean.name}" src="upload/${bean.image01}">
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
	    							<c:if test="${whologin == 2}">	    							
	    								<div id="buttonList">
	    									<a id="updateAnchor" class="btn btn-info" 
	    										href="<%=notWithFormTag%>prUpdate&pnum=${bean.pnum}${requestScope.pageInfo.flowParameter}">
		    									수정
		    								</a>
		    								
	    									<a id="deleteAnchor" class="btn btn-info" href="#">
		    									삭제
		    								</a>		    								
	    								</div>		    							
	    							</c:if>
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
		${requestScope.pageInfo.pagingHtml}		
	</div>	 
</body>
</html>