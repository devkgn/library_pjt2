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
								<h3 class="title">Book Add</h3>
							</div>
							<form id="bookAddFrm" name="add_book_form">
								<div class="form-group">
									<input class="input" type="text" name="b_name" placeholder="Book Name">
								</div>
								<div class="form-group">
									<input class="input" type="text" name="b_writer" placeholder="Book Writer">
								</div>
								<div class="form-group">
									<input id="b_thumbnail" type="file" name="file">
								</div>
								<button type="submit" class="primary-btn order-submit">Add</button>
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
	<script>
		const form = document.getElementById("bookAddFrm");
		form.addEventListener('submit', (e) => {
			e.preventDefault();
			// validation check
			let vali_check = false;
			let vali_text = "";
			if(form.b_name.value == ""){
				vali_text += "도서 이름을 입력하세요.";
				form.b_name.focus();
			} else if(form.b_writer.value == ""){
				vali_text += "저자를 입력하세요";
				form.b_writer.focus();
			} else if(form.file.value == ''){
				vali_text += "이미지 파일을 선택하세요.";
				form.file.focus();
			} else{
				vali_check = true;
			}
			
			if(vali_check == false){
				Swal.fire({
				  icon: 'error',
				  title: 'Error' ,
				  text: vali_text,
				});
				
				
			}else{
				const payload = new FormData(form);
				let object = {};
				payload.forEach(function(value, key){
				    object[key] = value;
				});
				const json = JSON.stringify(object); 
				console.log(json);
				fetch('/book',{
					method: 'post',
					body:payload
				})
				.then(response => response.json())
				.then(data =>{
					if(data.res_code == '200'){
						Swal.fire({
						  icon: 'success',
						  title: '성공' ,
						  text: data.res_msg
						}).then((result)=>{
							location.href='/book';
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