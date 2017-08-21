<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title></title>
	<%@include file="/WEB-INF/views/front/css.jsp" %>
</head>
<body>
<!--  Preloader  -->
<div id="preloader">
	<div id="loading">
	</div>
</div>
<header>
	<!--  top-header  -->
		<%@include file="/WEB-INF/views/front/top-header.jsp" %>
	<!--  /top-header  -->
	<section class="top-md-menu">
		<div class="container">
		<%@include file="/WEB-INF/views/front/top-md-menu.jsp" %>
		<%@include file="/WEB-INF/views/front/main-menu.jsp" %>
		</div>
	</section>
	<!-- header-outer -->
	<section class="header-outer">
		<!-- header-slider -->
			<div class="header-slider">					
					<div id="home-slider" class="carousel slide carousel-fade" data-ride="carousel">
						<!-- .home-slider -->
						<div class="carousel-inner">
							<c:forEach var="item" items="${sliders}" varStatus="status">
							<div class="item <c:if test="${status.first }">active</c:if>" style="background-image: url(${ctx}/${item.c2 });  background-repeat: no-repeat; background-position: top;">
								<div class="container">		
									<div class="caption">
										<div class="caption-outer">
											<div class="col-xs-12 col-sm-12 col-md-4">												
											</div>
											<div class="col-xs-12 col-sm-6 col-md-6">
												<h3>${item.c1 }</h3>
												<h2 class="animated slideInUp" data-wow-delay="10ms" data-wow-duration="1500ms">${item.c5 }</h2>
												<h4>${item.c6 } </h4>
												<p class="animated fadeInRight">${item.c7 }</p>
												<a data-scroll class="btn get-start animated fadeInUp" data-wow-delay="10ms" data-wow-duration="1500ms" href="${item.c9 }">购买</a>
											</div>
											<div class="col-xs-12 col-sm-6 col-md-2">												
												<div class="save-price animated slideInUp" data-wow-delay="10ms" data-wow-duration="1500ms">
													<span class="save-text">价格</span>
													<span class="saveprice-no"><sup>¥</sup>${item.c3}</span>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							</c:forEach>
							
						</div>
						<!-- indicators -->
						<ol class="carousel-indicators">
							<c:forEach var="item" items="${sliders}" varStatus="status">
								<li data-target="#home-slider" data-slide-to="${status.index }"<c:if test="${status.first }">class="active"</c:if> ></li>
							</c:forEach>
						</ol>
						<!-- /indicators -->
						<!-- /.home-slider -->
					</div>					
			</div>
			<!-- /header-slider end -->			
	</section>
	<!-- /header-outer -->
</header>
<!-- banner -->
<section class="banner">
	<div class="container">
		<div class="row">
			<c:forEach var="item" items="${mids}" varStatus="status">
			<div class="col-xs-12 col-sm-4 col-md-4">
				<!-- banner-img -->
				<a href="#" class="${item.c4 }">
					<!-- banner-text -->
					<div class="banner-text">
						<h3>${item.c2 }</h3>
						<h2>${item.c1 }</h2>
						<span class="price">价格: ¥${item.c3 }</span>
					</div>
					<!-- /banner-text -->
				</a>
				<!-- /banner-img -->
			</div>
			</c:forEach>
		</div>
	</div>
</section>
<!-- /banner -->
<!-- deal-outer -->
<section class="deal-section">
	<div class="container">
		<div class="row">
			<div class="col-sm-4">
				<div class="deal-week">
					<div class="title">
						<h2>本月热卖</h2>
					</div>
					<div class="owl-demo-outer">
						<!-- #owl-demo -->
						<div id="owl-demo" class="deals-wk">
							<c:forEach var="hot" items="${hots}" varStatus="status">
							<div class="item">
								<div class="col-md-12">
									<!-- .pro-text -->
									<div class="pro-text text-center">
										<!-- .pro-img -->
										<div class="pro-img">
											<img src="${ctx }/${hot.c7 }" alt="2" />
										</div>
										<!-- /.pro-img -->
										<div class="text-text">
											<span>${hot.c1 }</span>
											<h4> ${hot.c5 } </h4>
											<p>${hot.c6 }</p>
											<p class="wk-price">¥${hot.c2 } <span>¥${hot.c3 }</span> </p>
											<p class="availalbe">库存: <span>${hot.c4 }</span></p>
											<a href="${hot.c7 }" class="add-btn">购买</a>
										</div>
										<!-- clockdiv -->
										<div id="clockdiv">
											<h4>赶快下单! 活动马上结束:</h4>
											<div>
												<span class="days">14</span>
												<div class="smalltext">天</div>
											</div>
											<div>
												<span class="hours">23</span>
												<div class="smalltext">小时</div>
											</div>
											<div>
												<span class="minutes">59</span>
												<div class="smalltext">分钟</div>
											</div>
											<div>
												<span class="seconds">47</span>
												<div class="smalltext">秒</div>
											</div>
										</div>
										<!-- /clockdiv -->
									</div>
									<!-- /.pro-text -->
								</div>
							</div>
							</c:forEach>
							
							<!-- /#owl-demo -->
						</div>
					</div>

				</div>
			</div>


			<div class="col-sm-8">
				<!-- new-arrivals -->
				<div class="new-arrivals">
					<ul class="nav nav-tabs">
						<li class="active"><a data-toggle="tab" href="#home">新上架</a></li>
						<li><a data-toggle="tab" href="#menu1">特色</a></li>
						<li><a data-toggle="tab" href="#menu2">经典</a></li>
					</ul>

					<div class="tab-content">
						<div id="home" class="tab-pane fade in active">							
							<div class="owl-demo-outer">
								<!-- #owl-demo -->
								<div id="owl-demo8" class="deals-wk2">
									<div class="item">
										<c:forEach var="hot" items="${hots1}" varStatus="status">
										<div class="col-xs-12 col-sm-6 col-md-4">
											<!-- .pro-text -->
											<div class="pro-text text-center">
												<!-- .pro-img -->
												<div class="pro-img">
													<img src="${ctx }/${hot.c5 }" alt="2" />
												</div>
												<!-- /.pro-img -->
												<div class="pro-text-outer">
													<span>${hot.c1 }</span>
													<a href="${hot.c6 }">
														<h4> ${hot.c2 } </h4>
													</a>
													<p class="wk-price">¥${hot.c3 } </p>
													<a href="${hot.c6 }" class="add-btn">购买</a>
												</div>
											</div>
											<!-- /.pro-text -->
										</div>
										</c:forEach>																	
									</div>
									<!-- /#owl-demo -->
								</div>
							</div>
						</div>
						<div id="menu1" class="tab-pane fade">							
							<div class="owl-demo-outer">
								<!-- #owl-demo -->
								<div id="owl-demo7" class="deals-wk2">
									<div class="item">
										<c:forEach var="hot" items="${hots2}" varStatus="status">
										<div class="col-xs-12 col-sm-6 col-md-4">
											<!-- .pro-text -->
											<div class="pro-text text-center">
												<!-- .pro-img -->
												<div class="pro-img">
													<img src="${ctx }/${hot.c5 }" alt="2" />
												</div>
												<!-- /.pro-img -->
												<div class="pro-text-outer">
													<span>${hot.c1 }</span>
													<a href="${hot.c6 }">
														<h4> ${hot.c2 } </h4>
													</a>
													<p class="wk-price">¥${hot.c3 } </p>
													<a href="${hot.c6 }" class="add-btn">购买</a>
												</div>
											</div>
											<!-- /.pro-text -->
										</div>
										</c:forEach>	
									</div>
									<!-- /#owl-demo -->
								</div>
							</div>
						</div>
						<div id="menu2" class="tab-pane fade">								
							<div class="owl-demo-outer">
								<!-- #owl-demo -->
								<div id="owl-demo6" class="deals-wk2">
									<div class="item">
										<c:forEach var="hot" items="${hots3}" varStatus="status">
										<div class="col-xs-12 col-sm-6 col-md-4">
											<!-- .pro-text -->
											<div class="pro-text text-center">
												<!-- .pro-img -->
												<div class="pro-img">
													<img src="${ctx }/${hot.c5 }" alt="2" />
												</div>
												<!-- /.pro-img -->
												<div class="pro-text-outer">
													<span>${hot.c1 }</span>
													<a href="${hot.c6 }">
														<h4> ${hot.c2 } </h4>
													</a>
													<p class="wk-price">¥${hot.c3 } </p>
													<a href="${hot.c6 }" class="add-btn">购买</a>
												</div>
											</div>
											<!-- /.pro-text -->
										</div>
										</c:forEach>	
									</div>
									<!-- /#owl-demo -->
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- /new-arrivals -->

			</div>
		</div>
	</div>
</section>
<!-- /deal-outer -->
<!-- all-product -->
<section class="all-product">
	<div class="container">
		<div class="row">
			<!-- title -->
			<div class="title">
				<h2>
					热门商品					
				</h2>
				<ul class="nav nav-tabs etabs">
						<li class="active"><a data-toggle="tab" href="#phones">手机</a></li>
						<li><a data-toggle="tab" href="#laptop">笔记本</a></li>
						<li><a data-toggle="tab" href="#desktop">台式机</a></li>
					</ul>
			</div>
			<!-- /title -->
			<!-- electonics -->
			<div class="electonics">

				<div class="brd2 col-xs-12 col-sm-3 col-md-3">
					<div id="home-slider2" class="carousel slide carousel-fade" data-ride="carousel">
						<!-- .home-slider -->
						<div class="carousel-inner">
							<c:forEach var="item" items="${ads}" varStatus="status">
							<div class="item <c:if test="${status.first }">active</c:if>">
								<a class="ads" href="${item.c6 }">
									<img src="${ctx }/${item.c5 }" alt="add-banner" />
								</a>
							</div>
							</c:forEach>	
						</div>
						<!-- indicators -->
						<ol class="carousel-indicators">
							<c:forEach var="item" items="${ads}" varStatus="status">
								<li data-target="#home-slider2" data-slide-to="${status.index }" <c:if test="${status.first }">class="active"</c:if> ></li>
							</c:forEach>
						</ol>
						<!-- /indicators -->
						<!-- /.home-slider -->
					</div>
				</div>
				<div class="col-xs-12 col-sm-9 col-md-9">
					<div class="row">
						<!-- tab-content -->
						<div class="tab-content">
							<!-- tab-pane -->
							<div id="phones" class="tab-pane fade in active">									
								<div class="owl-demo-outer">
									<!-- #owl-demo -->
									<div id="owl-demo3" class="deals-wk2">
										<div class="item">
											<c:forEach var="item" items="${put1}" varStatus="status">
											<div class="bdr col-xs-12 col-sm-12 col-md-6">
												<!-- e-product -->
												<div class="e-product">
													<div class="pro-img">
														<img src="${ctx }/${item.c5 }" alt="2">
														<div class="hover-icon">
															<a href="${item.c6 }"><i class="fa fa-search" aria-hidden="true"></i></a>
														</div>
													</div>
													<div class="pro-text-outer">
														<span>${item.c1 }</span>
														<a href="#">
															<h4> ${item.c2 } </h4>
														</a>
														<p class="wk-price">${item.c3 } </p>
														<a href="${item.c6 }" class="add-btn">购买</a>
													</div>
												</div>
												<!-- /e-product -->
											</div>
											</c:forEach>
										</div>
									</div>
								</div>
							</div>
							<!-- /tab-pane -->
							<!-- tab-pane -->
							<div id="laptop" class="tab-pane fade in">
								<div id="owl-demo13" class="deals-wk2">
										<div class="item">
											<c:forEach var="item" items="${put2}" varStatus="status">
											<div class="bdr col-xs-12 col-sm-12 col-md-6">
												<!-- e-product -->
												<div class="e-product">
													<div class="pro-img">
														<img src="${ctx }/${item.c5 }" alt="2">
														<div class="hover-icon">
															<a href="${item.c6 }"><i class="fa fa-search" aria-hidden="true"></i></a>
														</div>
													</div>
													<div class="pro-text-outer">
														<span>${item.c1 }</span>
														<a href="#">
															<h4> ${item.c2 } </h4>
														</a>
														<p class="wk-price">${item.c3 } </p>
														<a href="${item.c6 }" class="add-btn">购买</a>
													</div>
												</div>
												<!-- /e-product -->
											</div>
											</c:forEach>
										</div>
									</div>
							</div>
							<!-- /tab-pane -->
							<!-- tab-pane -->
							<div id="desktop" class="tab-pane fade in">
								<div id="owl-demo14" class="deals-wk2">
										<div class="item">
											<c:forEach var="item" items="${put3}" varStatus="status">
											<div class="bdr col-xs-12 col-sm-12 col-md-6">
												<!-- e-product -->
												<div class="e-product">
													<div class="pro-img">
														<img src="${ctx }/${item.c5 }" alt="2">
														<div class="hover-icon">
															<a href="${item.c6 }"><i class="fa fa-search" aria-hidden="true"></i></a>
														</div>
													</div>
													<div class="pro-text-outer">
														<span>${item.c1 }</span>
														<a href="#">
															<h4> ${item.c2 } </h4>
														</a>
														<p class="wk-price">${item.c3 } </p>
														<a href="${item.c6 }" class="add-btn">购买</a>
													</div>
												</div>
												<!-- /e-product -->
											</div>
											</c:forEach>
										</div>
									</div>
							</div>
							<!-- /tab-pane -->
						</div>
						<!-- /tab-content -->

					</div>
				</div>
			</div>
			
		</div>
	</div>
</section>
<footer>
	<div class="container">
		<div class="row">
			<!-- copayright -->
			<div class="copayright">
				<div class="row">
					<div class="col-xs-12 col-sm-6 col-md-6">
						Copyright &copy; 2017.Company name All rights reserved. Java EasyCms
					</div>
					<div class="text-right col-xs-12 col-sm-6 col-md-6">
						<img src="${ctx }/assets/images/payment-img.jpg" alt="payment-img" />
					</div>
				</div>
			</div>
			<!-- /copayright -->

		</div>
	</div>
</footer>


<p id="back-top">
	<a href="#top"><i class="fa fa-chevron-up" aria-hidden="true"></i></a>
</p>
<%@include file="/WEB-INF/views/front/js.jsp" %>
</body>

</html>