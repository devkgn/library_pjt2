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
               <div class="col-md-3">
                  <div class="product">
                     <div class="product-img">
                        <img src="<c:url value="/libraryUploadImg/${bookDto.b_thumbnail}"/>">
                     </div>
                  </div>
               </div>
               <div class="col-md-7">
                  <!-- SignUp Form -->
                  <div class="billing-details">
                     <div class="section-title">
                        <h3 class="title">Book Edit</h3>
                     </div>
                     <form id="bookEditFrm" name="edit_book_form">
                        <input type="hidden" name="b_no" value="${bookDto.b_no}">
                        <input type="hidden" name="b_thumbnail" value="${bookDto.b_thumbnail}">
                        <div class="form-group">
                           <input class="input" type="text" name="b_name" value="${bookDto.b_name }">
                        </div>
                        <div class="form-group">
                           <input class="input" type="text" name="b_writer" value="${bookDto.b_writer }">
                        </div>
                        <div class="form-group">
                           <input id="b_thumbnail" type="file" name="file">
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
<jsp:include page="../include/footer.jsp"/>
<script>
	const form = document.getElementById("bookEditFrm");
	form.addEventListener('submit', (e)=>{
		e.preventDefault();
		let vali_check = false;
		if(form.b_name.value == ''){
			form.b_name.focus();
		} else if(form.b_writer.value == ''){
			form.b_writer.focus();
		} else{
			vali_check = true;
		}
		
		if(vali_check == true){
			const payload = new FormData(form);
			const bNo = form.b_no.value;
			fetch('/book/'+bNo,{
				method : 'post',
				body : payload
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
			;
			
			
		}
	});
</script>
</body>
</html>