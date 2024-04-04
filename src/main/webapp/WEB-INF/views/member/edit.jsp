<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<style>
		input[name="m_id"]{background-color: gainsboro;}
	</style>
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
								<h3 class="title">Edit Info</h3>
							</div>
							<form id="editFrm" name="edit_member_form" >
								<input type="hidden" name="m_no" value="${loginedMember.m_no}">
								<div class="form-group">
									<input class="input" type="text" name="m_id" value="${loginedMember.m_id}" readonly disabled>
								</div>
								<div class="form-group">
									<input class="input" type="text" name="m_name" value="${loginedMember.m_name}">
								</div>
								<div class="form-group">
									<input class="input" type="text" name="m_mail" value="${loginedMember.m_mail}">
								</div>
								<button type="submit" class="primary-btn order-submit">Edit</button>
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
	<script src="<c:url value='/resources/js/validation.js'/>"></script>	
	<script>
		const form = document.getElementById("editFrm");
		form.addEventListener('submit', (e) => {
			e.preventDefault();
			// validation check
			let vali_check = valiCheckEdit(form);
			if(vali_check == true){
				const payload = new FormData(form);
				let object = {};
				payload.forEach(function(value, key){
				    object[key] = value;
				});
				const json = JSON.stringify(object);
				const mNo = form.m_no.value;
				console.log(mNo);
				fetch('/member/'+mNo,{
					method:'post',
					headers : {
						"Content-Type": "application/json;charset=utf-8",
						"Accept": "application/json"
					},
					body:json
				})
				.then(response => response.json())
				.then(data => {
					if(data.res_code == '200'){
						Swal.fire({
						  icon: 'success',
						  title: '성공' ,
						  text: data.res_msg
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
	<jsp:include page="../include/footer.jsp"/>
</body>
</html>