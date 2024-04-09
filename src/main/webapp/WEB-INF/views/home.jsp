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
   <jsp:include page="include/header.jsp"/>
   <jsp:include page="include/nav.jsp"/>
   <!-- SECTION -->
   <div class="section">
      <!-- container -->
      <div class="container">
         <!-- row -->
         <div class="row">
            <!-- section title -->
            <div class="col-md-12">
               <div class="section-title">
                  <h3 class="title">New Books</h3>
               </div>
            </div>
            <!-- /section title -->
            <!-- Products tab & slick -->
            <div class="col-md-12">
               <div class="row">
                  <c:choose>
                     <c:when test="${empty newBookList}">
                        <div class="hot-deal">
                           <p>No New Books Today</p>
                           <a class="primary-btn cta-btn" href="/book/add">Add</a>
                        </div>
                     </c:when>
                     <c:otherwise>
                        <div class="products-tabs">
                           <!-- tab -->
                           <div id="tab1" class="tab-pane active">
                              <div class="products-slick" data-nav="#slick-nav-1">   
                                 <c:forEach var="item" items="${newBookList}">
                                    <div class="product">
                                       <div class="product-img">
                                          <img style="width:100%;" src="<c:url value='/libraryUploadImg/${item.b_thumbnail}'/>" alt="">
                                          <div class="product-label">
                                             <span class="new">NEW</span>
                                          </div>
                                       </div>
                                       <div class="product-body">
                                          <p class="product-category">${item.b_writer}</p>
                                          <h3 class="product-name"><a href="#">${item.b_name}</a></h3>
            
                                       </div>
                                       <div class="add-to-cart">
                                          <button class="add-to-cart-btn" onclick="location.href='/book/${item.b_no}'"><i class="fa fa-file-text"></i>details</button>
                                       </div>
                                    </div>
                                 </c:forEach>                                                      
                              </div>      
                              <div id="slick-nav-1" class="products-slick-nav"></div>
                           </div>
                           <!-- /tab -->
                           <br>
                        </div>
                     </c:otherwise>
                  </c:choose>
               </div>
            </div>
            <!-- Products tab & slick -->
         </div>
         <!-- /row -->
      </div>
      <!-- /container -->
   </div>
   <!-- /SECTION -->   
   <jsp:include page="include/footer.jsp"/>
</body>
</html>