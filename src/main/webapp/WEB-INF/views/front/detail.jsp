<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title></title>
	<%@include file="/WEB-INF/views/front/css.jsp" %>
	<link rel="stylesheet" href="${ctx}/assets/css/slider.css" type="text/css">
</head>
<body>
	<!--  Preloader  -->
	<div id="preloader">
		<div id="loading"> </div>
	</div>
	<header class="header2">
		<!--  top-header  -->
		<%@include file="/WEB-INF/views/front/top-header.jsp" %>
		<!--  /top-header  -->
		<section class="top-md-menu">
			<div class="container">
				<%@include file="/WEB-INF/views/front/top-md-menu.jsp" %>
				<%@include file="/WEB-INF/views/front/main-menu.jsp" %>
			</div>
		</section>
	</header>
	<!-- newsletter -->
	<section class="grid-shop">
		<!-- .grid-shop -->
		<div class="container">
			<div class="row">
				<!-- <div class="col-md-12">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="#">Home</a></li>
						<li class="breadcrumb-item active">Library</li>
					</ol>
				</div> -->
				<div class="col-sm-3 col-md-3">
					<div class="weight">
						<div class="ads-lft">
						<img src="${ctx }/assets/images/add-banner2.jpg" alt="add banner"> </div>
					</div>
					<div class="weight">
						<div class="title">
							<h2>BEST PRODUCTS</h2>
						</div>
						<div class="toprating-box">
							<ul>
								<li>
									<div class="e-product">
										<div class="pro-img"> <img src="${ctx }/assets/images/products/digital/5.jpg" alt="2"> </div>
										<div class="pro-text-outer"> <span>Macbook, Laptop</span>
											<a href="#">
												<h4> Apple Macbook Retina 23’ </h4>
											</a>
											<p class="wk-price">$290.00 </p>
										</div>
									</div>
								</li>
								<li>
									<div class="e-product">
										<div class="pro-img"> <img src="${ctx }/assets/images/products/digital/9.jpg" alt="2"> </div>
										<div class="pro-text-outer"> <span>Macbook, Laptop</span>
											<a href="#">
												<h4> Apple Macbook Retina 23’ </h4>
											</a>
											<p class="wk-price">$290.00 </p>
										</div>
									</div>
								</li>
								<li>
									<div class="e-product">
										<div class="pro-img"> <img src="${ctx }/assets/images/products/digital/12.jpg" alt="2"> </div>
										<div class="pro-text-outer"> <span>Macbook, Laptop</span>
											<a href="#">
												<h4> Apple Macbook Retina 23’ </h4>
											</a>
											<p class="wk-price">$290.00 </p>
										</div>
									</div>
								</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-sm-9 col-md-9">
					<!-- 详情-->
					${data.c15 }
				</div>
			</div>
		</div>
		<!-- /.grid-shop -->
	</section>
	<footer>
		<div class="container">
			<div class="row">
				<!-- copayright -->
				<div class="copayright">
					<div class="row">
						<div class="col-xs-12 col-sm-6 col-md-6">Copyright &copy; 2017.Company name All rights reserved.<a target="_blank" href="http://sc.chinaz.com/moban/">&#x7F51;&#x9875;&#x6A21;&#x677F;</a></div>
						<div class="text-right col-xs-12 col-sm-6 col-md-6"> <img src="${ctx }/assets/images/payment-img.jpg" alt="payment-img" /> </div>
					</div>
				</div>
				<!-- /copayright -->
			</div>
		</div>
	</footer>
	<!-- /sticky-socia -->
	<p id="back-top"> <a href="#top"><i class="fa fa-chevron-up" aria-hidden="true"></i></a> </p>
	<%@include file="/WEB-INF/views/front/js.jsp" %>
</body>
</html>