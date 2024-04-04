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
					<div class="col-md-3"></div>
					<div class="col-md-6 text-center">
						<!-- SignUp Form -->
						<div class="billing-details">
							<div class="section-title">
								<h3 class="title">Login</h3>
							</div>
							<table class="table table-bordered">
								<thead>
									<tr>
										<th class="text-center">번호</th>
										<th class="text-center">아이디</th>
										<th class="text-center">이름</th>
										<th class="text-center">메일</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="item" items="${resultList}" varStatus="status">
										<tr>
											<td>${status.count}</td>
											<td>${item.m_id}</td>
											<td>${item.m_name}</td>
											<td>${item.m_mail}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>							
						</div>
						<!-- /SignUp Form -->
					</div>
					<div class="col-md-3"></div>
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /SECTION -->
		<script>
		</script>
	<jsp:include page="../include/footer.jsp"/>
</body>
</html>