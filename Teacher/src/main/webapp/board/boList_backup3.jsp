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
		/* 필드 검색시 입력 했던 콤보 박스(mode)의 내용과 키워드(keyword) 입력 상자에 있던 내용은 보존되어야 합니다. */
		$(document).ready(function(){ 
			var myoptions = $('#mode option');
			
			for(var i=0 ; i<myoptions.length ; i++){
				if(myoptions[i].value == '${requestScope.pageInfo.mode}'){
					myoptions[i].selected = true ; 
				}
			}
			
			$('#keyword').val('${requestScope.pageInfo.keyword}') ;
		});
		
		function searchAll(){ /* 전체 검색 */
			location.href = '<%=notWithFormTag%>boList' ;
		}
		
		function writeForm(){ /* 글쓰기 */
			location.href = '<%=notWithFormTag%>boInsert' ;
		}		
	</script>	
	<style type="text/css">
		.container{margin-top: 10px;}
		.rounded-pill{opacity: 0.7;}
		#noUnderLine{text-decoration-line: none;}
		.mode, .keyword{margin:auto;}
		.col{display: inline;}
		.col{margin-left: 5px;} 
	</style>
</head>
<body>
	<div class="container">
		<h2>게시물 목록</h2>
		<p>사용자들이 게시한 게시물 목록을 보여 주는 페이지입니다.</p>	
		<table class="table table-striped">
			<thead>
				<tr>
					<th>글번호</th>
					<th>작성자</th>
					<th>비밀 번호</th>
					<th>글제목</th>
					<th>글내용</th>					
					<th>조회수</th>
					<th>작성 일자</th>					
				</tr>
			</thead>
			<tbody>
				<tr>
					<td colspan="9" align="center">
					<div class="row">
						<div class="col-sm-1"></div>
						<div class="col-sm-10">					
							<form name="myform" action="<%=withFormTag%>" method="get">
								<input type="hidden" name="command" value="boList">
								<div class="row">
									<div class="col col-sm-3 mode">
										<select class="form-control form-control-sm" id="mode" name="mode">
											<option value="all" selected="selected">--- 선택해 주세요 ---
											<option value="writer">작성자
											<option value="subject">글제목
											<option value="content">글내용
										</select>
									</div>
									<div class="col col-sm-2 keyword">
										<input class="form-control form-control-sm" type="text" name="keyword" id="keyword"
											placeholder="키워드 입력">
									</div>
									<div class="col">							
										<button type="submit" class="btn btn-warning form-control-sm" onclick="">검색</button>
									</div>
									<div class="col">
										<button type="button" class="btn btn-warning form-control-sm" onclick="searchAll();">전체 검색</button>
									</div>
									<div class="col">							
										<button type="button" class="btn btn-info form-control-sm"  onclick="writeForm();">글 쓰기</button>
									</div>			
									<div class="col">				
										${requestScope.pageInfo.pagingStatus}
									</div>
								</div>
							</form>							
						</div>
						<div class="col-sm-1"></div>
					</div>					
					</td>					
				</tr>
				<c:forEach var="bean" items="${requestScope.datalist}"> 
				<tr>
					<td>${bean.no}</td>
					<td>${bean.id}</td>
					<td>${bean.password}</td>
					<td>
						<a href="<%=notWithFormTag%>boDetail&no=${bean.no}">
							<c:forEach var="i" begin="1" end="${bean.depth}" step="1">
								<span class="badge rounded-pill bg-secondary">re</span>
							</c:forEach>
							${bean.subject}
						</a>
					</td>
					<td>${bean.content}</td>
					<td>
						<c:if test="${bean.readhit >= 30}">
							<span class="badge rounded-pill bg-primary">
								${bean.readhit}
							</span>
						</c:if>
						<c:if test="${bean.readhit < 30}">
							<span class="badge rounded-pill bg-danger">
								${bean.readhit}
							</span>
						</c:if>						
					</td>
					<td>${bean.regdate}</td>							
				</tr>
				</c:forEach>				 
			</tbody>
		</table>
		${requestScope.pageInfo.pagingHtml} 
	</div>	 
</body>
</html>