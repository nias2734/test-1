<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="./../common/bootstrap5.jsp" %>
<%@ include file="./../common/common.jsp" %>
<%@ page import="com.shopping.model.dao.ProductDao" %>
<%@ page import="com.shopping.model.bean.Product"%>
<%
	int pnum = 1;
	ProductDao dao = new ProductDao();
	Product bean = dao.getDataByPk(pnum);
	
%>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
  	<style type="text/css">
  		/* box model에 대한 공부가 필요합니다. */
  		.container{margin-top: 10px;}
  		.input-group{margin: 7px;}
  		.input-group-text{
  			display: block;
  			margin-left: auto;
  			margin-right: auto;
  		}
  		#buttonset{margin-top: 15px;}
  		.radio_gender, .checkbox_hobby{font-size: 1.1rem;} /* 주위 글꼴의 1.1배 */
  	</style>
	<script type="text/javascript">
  		$(document).ready(function(){
  			/* value 속성의 값이 일치하는 항목에 대하여 체크 on 시킵니다. */
  			$('option[value="<%=bean.getCategory()%>"]').attr('selected', true);
  		});
  	</script>  	
  	
  	
</head>
<body>
	<div class="container">
		<h2>상품 수정</h2>
		<p>관리자가 이전에 등록한 상품을 수정하는 페이지입니다.</p>
		<form action="">
			<div class="input-group">
				<span class="input-group-text">상품 번호</span>
				<input disabled="disabled" class="form-control" type="number" id="fakepnum" name="fakepnum" value="<%=bean.getPnum()%>">				
				<input type="number" id="pnum" name="pnum" value="<%=bean.getPnum()%>">
			</div>
			<div class="input-group">
				<span class="input-group-text">상품 이름</span>
				<input class="form-control" type="text" id="name" name="name" value="<%=bean.getName()%>">				
			</div>
			<div class="input-group">
				<span class="input-group-text">제조 회사</span>
				<input class="form-control" type="text" id="company" name="company" value="<%=bean.getCompany()%>">				
			</div>
			<div class="input-group">
				<span class="input-group-text">이미지</span>
				<input class="form-control" type="file" id="image01" name="image01">				
			</div>
			<div class="input-group">
				<span class="input-group-text">재고 수량</span>
				<input class="form-control" type="number" id="stock" name="stock" value="<%=bean.getStock()%>">				
			</div>
			<div class="input-group">
				<span class="input-group-text">단가</span>
				<input class="form-control" type="number" id="price" name="price" value="<%=bean.getPrice()%>">				
			</div>
			<div class="input-group">
				<span class="input-group-text">카테고리</span>
				<select id="category" name="category" class="form-select">
					<option value="-">-- 항목을 선택해 주세요</option>
					<option value="bread">빵</option>
					<option value="beverage">음료수</option>
					<option value="cake">케일</option>
				</select>				
			</div>
			<div class="input-group">
				<span class="input-group-text">상품 상세 설명</span>
				<input class="form-control" type="text" id="contents" name="contents" value="<%=bean.getContents()%>">				
			</div>			
			<div class="input-group">
				<span class="input-group-text">적립 포인트</span>
				<input class="form-control" type="number" id="point" name="point" value="<%=bean.getPoint()%>">				
			</div>			
			<div class="input-group">
				<span class="input-group-text">입고 일자</span>
				<input class="form-control" type="datetime" id="inputDate" name="inputDate" value="<%=bean.getInputdate()%>">				
			</div>
			<div class="input-group">
				<button type="submit" class="btn btn-primary">수정</button>
				&nbsp;&nbsp;&nbsp;
				<button type="reset" class="btn btn-primary">초기화</button>				
			</div>
		</form>
	</div>
</body>
</html>