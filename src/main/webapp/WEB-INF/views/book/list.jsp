<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>구디 도서관</title>
</head>
<body>
	<jsp:include page="../include/header.jsp"/>
	<jsp:include page="../include/nav.jsp"/>
		<!-- SECTION -->
		<div class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">
					<!-- STORE -->
					<div id="store" class="col-md-12">
						<!-- store top filter -->
						<div class="store-filter clearfix">
							<div class="store-sort">
								<label>
									Sort By : Latest
								</label>

								<label>
									Show : 8
								</label>
							</div>
							<div class="store-grid">
								<a class="primary-btn order-submit" href="/book/add">Add</a>
							</div>
						</div>
						<!-- /store top filter -->

						<!-- store products -->
						<div class="row">
							<c:forEach var="item" items="${resultList}">
								<div class="col-md-3 col-xs-6">
									<div class="product">
										<div class="product-img">
											<img src="<c:url value="/libraryUploadImg/${item.b_thumbnail}"/>">
										</div>
										<div class="product-body">
											<p class="product-category">${item.b_writer}</p>
											<h3 class="product-name"><a href="#">${item.b_name}</a></h3>
										</div>
										<div class="add-to-cart">
											<button class="add-to-cart-btn"><i class="fa fa-file-text"></i>Details</button>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
						<!-- /store products -->

						<!-- store bottom filter -->
						<div class="store-filter clearfix">
							<ul class="store-pagination">
								<c:if test="${paging.prev}">
									<li><a href="/book?nowPage=${paging.pageBarStart-1}"><i class="fa fa-angle-left"></i></a></li>
								</c:if>
								<c:forEach begin="${paging.pageBarStart}" end="${paging.pageBarEnd}" var="idx">
									<li><a href="/book?nowPage=${idx}" <c:out value="${paging.nowPage == idx ? 'class=active' : '' }"/>>${idx}</a></li>
								</c:forEach>
								<c:if test="${paging.next}">
									<li><a href="/book?nowPage=${paging.pageBarEnd+1}"><i class="fa fa-angle-right"></i></a></li>
								</c:if>
								
							</ul>
						</div>
						<!-- /store bottom filter -->
					</div>
					<!-- /STORE -->
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /SECTION -->
	<jsp:include page="../include/footer.jsp"/>
</body>
</html>