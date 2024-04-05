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
					<div class="col-md-7">
						<!-- SignUp Form -->
						<div class="billing-details">
							<div class="section-title">
								<h3 class="title">Sign Up</h3>
							</div>
							<form id="joinFrm" name="join_member_form" >
								<div class="form-group">
									<input class="input" type="text" name="m_id" placeholder="ID">
								</div>
								<div class="form-group">
									<input class="input" type="password" name="m_pw" placeholder="Password">
								</div>
								<div class="form-group">
									<input class="input" type="password" name="m_pw_check" placeholder="Password Check">
								</div>
								<div class="form-group">
									<input class="input" type="text" name="m_name" placeholder="Name">
								</div>
								<div class="form-group">
									<input class="input" type="text" name="m_mail" placeholder="E-mail">
								</div>
								<button type="submit" class="primary-btn order-submit">SignUp</button>
							</form>
						</div>
						<!-- /SignUp Form -->
					</div>

				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /SECTION -->
	<jsp:include page="../include/footer.jsp"/>
	<script src="<c:url value='/resources/js/validation.js'/>"></script>
	<script>
	const form = document.getElementById("joinFrm");
	form.addEventListener('submit', (e) => {
		e.preventDefault();
		const payload = new FormData(form);
		// new FormData를 단순 객체로 변경
		let object = {};
		payload.forEach(function(value, key){
		    object[key] = value;
		});
		// 단순 객체화된 form 정보를 JSON으로 변경
		const json = JSON.stringify(object);
		
		let vali_check = valiCheckJoin(form);
		
		if(vali_check == true){
			// fetch 비동기 통신으로 회원 정보 insert
			fetch('/join',{
				method: 'post',
				// 파일이 없을때만 적는다.
				headers : {
					"Content-Type": "application/json;charset=utf-8",
					"Accept": "application/json"
				},
				body:json
			})
			.then(response => response.json())
			.then(data =>{
				if(data.res_code == '200'){
					Swal.fire({
					  icon: 'success',
					  title: '성공' ,
					  text: '구디 도서관에 오신걸 환영합니다.'
					}).then((result)=>{
						location.href='/';
					});
				} else{
					Swal.fire({
					  icon: 'error',
					  title: '실패' ,
					  text: data.res_msg
					});
				}				
			})
		}
	});
</script>
</body>
</html>