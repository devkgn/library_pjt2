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
						<div class="products-tabs">
							<!-- tab -->
							<div id="tab1" class="tab-pane active">
								<div class="products-slick" data-nav="#slick-nav-1">
									<!-- product -->
									<div class="product">
										<div class="product-img">
											<img style="width:100%;" src="<c:url value='/resources/img/book01.jpg'/>" alt="">
											<div class="product-label">
												<span class="sale">HOT</span>
												<span class="new">NEW</span>
											</div>
										</div>
										<div class="product-body">
											<p class="product-category">History</p>
											<h3 class="product-name"><a href="#">The Wager</a></h3>
										</div>
										<div class="add-to-cart">
											<button class="add-to-cart-btn"><i class="fa fa-file-text"></i>details</button>
										</div>
									</div>
									<!-- /product -->
									<!-- product -->
									<div class="product">
										<div class="product-img">
											<img src="<c:url value='/resources/img/book02.jpg'/>" alt="">
										</div>
										<div class="product-body">
											<p class="product-category">Law</p>
											<h3 class="product-name"><a href="#">Strong Passions</a></h3>
										</div>
										<div class="add-to-cart">
											<button class="add-to-cart-btn"><i class="fa fa-file-text"></i>Details</button>
										</div>
									</div>
									<!-- /product -->

									<!-- product -->
									<div class="product">
										<div class="product-img">
											<img src="<c:url value='/resources/img/book03.jpg'/>" alt="">
										</div>
										<div class="product-body">
											<p class="product-category">Romance</p>
											<h3 class="product-name"><a href="#">Things We Left Behind</a></h3>
										</div>
										<div class="add-to-cart">
											<button class="add-to-cart-btn"><i class="fa fa-file-text"></i>Details</button>
										</div>
									</div>
									<!-- /product -->
									<!-- product -->
									<div class="product">
										<div class="product-img">
											<img src="<c:url value='/resources/img/book04.jpg'/>" alt="">
										</div>
										<div class="product-body">
											<p class="product-category">Travel</p>
											<h3 class="product-name"><a href="#">Stephen Fry in America</a></h3>
										</div>
										<div class="add-to-cart">
											<button class="add-to-cart-btn"><i class="fa fa-file-text"></i>Details</button>
										</div>
									</div>
									<!-- /product -->										
								</div>      
								<div id="slick-nav-1" class="products-slick-nav"></div>
							</div>
							<!-- /tab -->
						</div>
					</div>
				</div>
				<!-- Products tab & slick -->
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /SECTION -->
	<!-- SECTION -->
	<div class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
				
				<div class="col-md-3 col-xs-6">
					<div class="section-title">
						<h4 class="title">History</h4>
						<div class="section-nav">
							<div id="slick-nav-3" class="products-slick-nav"></div>
						</div>
					</div>

					<div class="products-widget-slick" data-nav="#slick-nav-3">
						<div>
							<!-- product widget -->
							<div class="product-widget">
								<div class="product-img">
									<img src="<c:url value='/resources/img/book01.jpg'/>" alt="">
								</div>
								<div class="product-body">
									<p class="product-category">A Tale of Shipwreck, Mutiny and Murder</p>
									<h3 class="product-name"><a href="#">The Wager</a></h3>
								</div>
							</div>
							<!-- /product widget -->
						</div>
					</div>
				</div>

				<div class="col-md-3 col-xs-6">
					<div class="section-title">
						<h4 class="title">Law</h4>
						<div class="section-nav">
							<div id="slick-nav-4" class="products-slick-nav"></div>
						</div>
					</div>

					<div class="products-widget-slick" data-nav="#slick-nav-4">
						<div>
							<!-- product widget -->
							<div class="product-widget">
								<div class="product-img">
									<img src="<c:url value='/resources/img/book02.jpg'/>" alt="">
								</div>
								<div class="product-body">
									<p class="product-category">A Scandalous Divorce in Old New York</p>
									<h3 class="product-name"><a href="#">Strong Passions</a></h3>
								</div>
							</div>
							<!-- /product widget -->
						</div>
					</div>
				</div>
				<div class="col-md-3 col-xs-6">
					<div class="section-title">
						<h4 class="title">Romance</h4>
						<div class="section-nav">
							<div id="slick-nav-4" class="products-slick-nav"></div>
						</div>
					</div>

					<div class="products-widget-slick" data-nav="#slick-nav-4">
						<div>
							<!-- product widget -->
							<div class="product-widget">
								<div class="product-img">
									<img src="<c:url value='/resources/img/book03.jpg'/>" alt="">
								</div>
								<div class="product-body">
									<p class="product-category">Knockemout Book3</p>
									<h3 class="product-name"><a href="#">Things We Left Behind</a></h3>
								</div>
							</div>
							<!-- /product widget -->
						</div>
					</div>
				</div>					
				<div class="col-md-3 col-xs-6">
					<div class="section-title">
						<h4 class="title">Travel</h4>
						<div class="section-nav">
							<div id="slick-nav-4" class="products-slick-nav"></div>
						</div>
					</div>

					<div class="products-widget-slick" data-nav="#slick-nav-4">
						<div>
							<!-- product widget -->
							<div class="product-widget">
								<div class="product-img">
									<img src="<c:url value='/resources/img/book04.jpg'/>" alt="">
								</div>
								<div class="product-body">
									<p class="product-category">Fifty States and the Man Who Set Out to See Then All</p>
									<h3 class="product-name"><a href="#">Stephen Fry in America</a></h3>
								</div>
							</div>
							<!-- /product widget -->
						</div>
					</div>
				</div>
				<div class="clearfix visible-sm visible-xs"></div>
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /SECTION -->
	<jsp:include page="include/footer.jsp"/>
</body>
</html>