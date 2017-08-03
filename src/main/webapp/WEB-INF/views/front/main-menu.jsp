<%@ page contentType="text/html;charset=UTF-8"%>

			<div class="main-menu">
				<!--  nav  -->
				<nav class="navbar navbar-inverse navbar-default">
					<!-- Brand and toggle get grouped for better mobile display -->
					<div class="navbar-header">
						<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
							<span class="sr-only">Toggle navigation</span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
					</div>
					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1" data-hover="dropdown" data-animations=" fadeInLeft fadeInUp fadeInRight">
						<ul class="nav navbar-nav">
							<li class="all-departments dropdown">
								<a href="index.html" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><span> easycms主题市场</span> <i class="fa fa-bars" aria-hidden="true"></i> </a>
								<ul class="dropdown-menu dropdownhover-bottom ${all_open}" role="menu">
									<c:forEach var="item" items="${models}" varStatus="status">
										<li class="dropdown">
											<a href="#"><img src="${ctx }/assets/images/menu-icon${status.count}.png" alt="menu-icon1" /> ${item.name} <i class="fa fa-angle-right" aria-hidden="true"></i></a>
											<ul class="dropdown-menu right">
												<c:forEach var="child" items="${item.childs}" varStatus="status">
													<li><a href="${ctx}/index?action=list&modelId=${child.id}">${child.name }</a></li>
												</c:forEach>
											</ul>
										</li>
									</c:forEach>
									<li>
										<a href="#"><img src="assets/images/menu-icon11.png" alt="menu-icon2" />All Categories</a>
									</li>
								</ul>
							</li>
							<li><a href="index">首页</a></li>
							<li><a href="#">特卖</a></li>
							<li><a href="#">广告</a></li>
							<li><a href="#">关于我们</a></li>
						</ul>
						<!-- /.navbar-collapse -->
					</div>
				</nav>
				<!-- /nav end -->
			</div>
	