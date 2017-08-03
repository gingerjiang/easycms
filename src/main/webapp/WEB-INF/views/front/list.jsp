<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
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
						<img src="assets/images/add-banner2.jpg" alt="add banner"> </div>
					</div>
					<div class="weight">
						<div class="title">
							<h2>BEST PRODUCTS</h2>
						</div>
						<div class="toprating-box">
							<ul>
								<li>
									<div class="e-product">
										<div class="pro-img"> <img src="assets/images/products/digital/5.jpg" alt="2"> </div>
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
										<div class="pro-img"> <img src="assets/images/products/digital/9.jpg" alt="2"> </div>
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
										<div class="pro-img"> <img src="assets/images/products/digital/12.jpg" alt="2"> </div>
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
					<div class="grid-spr">
						<div class="col-sm-6 col-md-6"> <a href="#" class="grid-view-icon"><i class="fa fa-th-large" aria-hidden="true"></i></a> <a href="#" class="list-view-icon"><i class="fa fa-list" aria-hidden="true"></i></a>
							<div class="select-option">
								<a class="btn btn-default btn-select options2">
									<input type="hidden" class="btn-select-input" id="1" name="1" value="" />
									<span class="btn-select-value">Select an Item</span>
									<span class="btn-select-arrow fa fa-angle-down"></span>
									<ul>
										<li class="selected">Default Sorting</li>
										<li>Option 1</li>
										<li>Option 2</li>
										<li>Option 3</li>
										<li>Option 4</li>
									</ul>
								</a>
							</div>
						</div>
						<div class="col-sm-6 col-md-6 text-right"> <strong>Showing 1-12 <span>of 30 relults</span></strong> </div>
					</div>
					<!-- 产品循环输出 -->
					<c:forEach var="item" items="${list}" varStatus="status">
					<div class="col-xs-12 col-sm-12 col-md-12">
						<!-- .pro-text -->
						<div class="pro-text">
							<div class="col-xs-12 col-sm-5 col-md-5">
								<!-- .pro-img -->
								<div class="pro-img"> <img src="${ctx }/${item.c5 }" alt="2">
									<sup class="sale-tag">sale!</sup>
									<!-- .hover-icon -->
									<div class="hover-icon"> <a href="#"><span class="icon icon-Heart"></span></a> <a href="#"><span class="icon icon-Search"></span></a> <a href="#"><span class="icon icon-Restart"></span></a> </div>
									<!-- /.hover-icon -->
								</div>
								<!-- /.pro-img -->
							</div>
							<div class="col-xs-12 col-sm-7 col-md-7">
								<div class="pro-text-outer list-pro-text">
									<span>${item.c2 }</span>
									<a href="#">
										<h4> ${item.c1 } </h4>
									</a>
									<div class="star2">
										<ul>
											<li class="yellow-color"><i class="fa fa-star" aria-hidden="true"></i></li>
											<li class="yellow-color"><i class="fa fa-star" aria-hidden="true"></i></li>
											<li class="yellow-color"><i class="fa fa-star" aria-hidden="true"></i></li>
											<li class="yellow-color"><i class="fa fa-star" aria-hidden="true"></i></li>
											<li><i class="fa fa-star" aria-hidden="true"></i></li>
											<li><a href="#">10 review(s)</a></li>
											<li><a href="#"> Add your review</a></li>
										</ul>
									</div>
									<p class="wk-price">¥${item.c3 } </p>
									<p>${item.c9 }</p>
									<a href="#" class="add-btn">购买</a>
									<a href="#" class="add-btn2"><span class="icon icon-Heart"></span></a>
									<a href="#" class="add-btn2"><span class="icon icon-Restart"></span></a>
								</div>
							</div>
						</div>
						<!-- /.pro-text -->
					</div>
					</c:forEach>
					
					<div class="col-xs-12">
						<div class="grid-spr pag">
							<!-- .pagetions -->
							<div class="col-xs-12 col-sm-6 col-md-6 text-left">
								<ul class="pagination">
									<li class="active"><a href="#">1</a></li>
									<li><a href="#">2</a></li>
									<li><a href="#">3</a></li>
									<li><a href="#">&raquo;</a></li>
								</ul>
							</div>
							<!-- /.pagetions -->
							<!-- .Showing -->
							<div class="col-xs-12 col-sm-6 col-md-6 text-right">
								<strong>Showing 1-12 <span>of 30 relults</span></strong>
							</div>
							<!-- /.Showing -->
						</div>
					</div>

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
						<div class="text-right col-xs-12 col-sm-6 col-md-6"> <img src="assets/images/payment-img.jpg" alt="payment-img" /> </div>
					</div>
				</div>
				<!-- /copayright -->
			</div>
		</div>
	</footer>
	<!-- sticky-socia -->
	<aside id="sticky-social">
		<ul>
			<li><a href="#" class="fa fa-facebook" target="_blank"><span><i class="fa fa-facebook" aria-hidden="true"></i> Facebook</span></a></li>
			<li><a href="#" class="fa fa-twitter" target="_blank"><span><i class="fa fa-twitter" aria-hidden="true"></i> Twitter</span></a></li>
			<li><a href="#" class="fa fa-rss" target="_blank"><span><i class="fa fa-rss" aria-hidden="true"></i> RSS</span></a></li>
			<li><a href="#" class="fa fa-pinterest-p" target="_blank"><span><i class="fa fa-pinterest-p" aria-hidden="true"></i> Pinterest</span></a></li>
			<li><a href="#" class="fa fa-share-alt" target="_blank"><span><i class="fa fa-share-alt" aria-hidden="true"></i> Flickr</span></a></li>
		</ul>
	</aside>
	<!-- /sticky-socia -->
	<p id="back-top"> <a href="#top"><i class="fa fa-chevron-up" aria-hidden="true"></i></a> </p>
	<%@include file="/WEB-INF/views/front/js.jsp" %>
</body>
</html>