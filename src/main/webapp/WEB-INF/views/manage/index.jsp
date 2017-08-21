<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html>
<head>
	<title>Java EasyCMS内容管理系统</title>
	<script src="${ctxStatic}/jquery/jquery-1.9.1.min.js"></script>
	<!-- bootstrap & fontawesome -->
	<link rel="stylesheet" href="${ctxStatic}/ace/css/bootstrap.min.css" />
	<link rel="stylesheet" href="${ctxStatic}/ace/font-awesome/4.5.0/css/font-awesome.min.css" />
	<!-- page specific plugin styles -->
	<!-- text fonts -->
	<link rel="stylesheet" href="${ctxStatic}/ace/css/fonts.googleapis.com.css" />
	<!-- ace styles -->
	<link rel="stylesheet" href="${ctxStatic}/ace/css/ace.min.css" class="ace-main-stylesheet" id="main-ace-style" />
	<!--[if lte IE 9]>
		<link rel="stylesheet" href="${ctxStatic}/ace/css/ace-part2.min.css" class="ace-main-stylesheet" />
	<![endif]-->
	<link rel="stylesheet" href="${ctxStatic}/ace/css/ace-skins.min.css" />
	<link rel="stylesheet" href="${ctxStatic}/ace/css/ace-rtl.min.css" />
	<!--[if lte IE 9]>
	  <link rel="stylesheet" href="${ctxStatic}/ace/css/ace-ie.min.css" />
	<![endif]-->

	<!-- inline styles related to this page -->
	<!-- ace settings handler -->
	<script src="${ctxStatic}/ace/js/ace-extra.min.js"></script>
	<script src="${ctxStatic}/jerichotab/js/jquery.jerichotab.js" type="text/javascript"></script>
	<link href="${ctxStatic}/jerichotab/css/jquery.jerichotab.css" rel="stylesheet" />
		
	<script type="text/javascript">var ctx = '${ctx}', ctxStatic='${ctxStatic}';</script>
	<script src="${ctxStatic}/js/comm.js" language="javascript" type="text/javascript"></script>
	<script type="text/javascript">
	//alert($('.jerichoTab').height())
	//alert($('#main-container').height())

	    $(document).ready(function() {
	    	//alert($('.main-content-inner').height())
			var jericho = {
		        buildTabpanel: function() {
		            $.fn.initJerichoTab({
		                renderTo: '.jerichoTab',
		                uniqueId: 'myJerichoTab',
		                contentCss: { 'height': $(document).height() - 280 }
		            });
		        }
		    }
	    	size();
	        jericho.buildTabpanel();
	        $.fn.jerichoTab.addTab({
                title: '首页',
                closeable: false,
                data: { dataType: 'formtag', dataLink: '#tbNews' }
            }).loadData();
	        $('.nav-list .submenu a').click(function() {
	        	if ('1' == $(this).attr('nav')) {
					return;
				}
	        	$(this).parent().addClass('active').siblings().removeClass('active');
				 $.fn.jerichoTab.addTab({
					tabFirer: $(this),
                    title: $(this).attr('name'),
                    data: {
                    	dataType: 'iframe',
                        dataLink: '${ctx}/cms?action=toDataList&modelId='+$(this).attr('modelId')
                    }
                }).loadData();
	        })
	    })
	    $(window).resize(function() {
	    	size();
	    })
	    function size() {
			 var w = $(document).width();
		     var h = $(document).height();
			 var swidth = $("#sidebar").width()+20;
		 	$('.jerichoTab').css({ width: w - swidth, height: h - 78, 'display': 'block'});
		}
	    function cfg() {
	    	window.addTab('配置模型', '${ctx}/cms/table');
	    }
	    //请缓存的html
	    function clear() {
	    	 $.post("${ctx}/cms?action=clearCache",{},function(result){
    		    alert(result.msg);
    		  },'json');
	    }
	</script>
</head>
<body class="no-skin" style="overflow-x: hidden;">
	<div id="navbar" class="navbar navbar-default ace-save-state">
		<div class="navbar-container ace-save-state" id="navbar-container">
			<button type="button" class="navbar-toggle menu-toggler pull-left" id="menu-toggler" data-target="#sidebar">
				<span class="sr-only">Toggle sidebar</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<div class="navbar-header pull-left">
				<a href="${ctx }/cms" class="navbar-brand">
					<small>
						<i class="fa fa-leaf"></i>
						Java EasyCMS
					</small>
				</a>
			</div>
			<div class="navbar-buttons navbar-header pull-right" role="navigation">
				<ul class="nav ace-nav">
					<li class="grey dropdown-modal">
						<a data-toggle="dropdown" class="dropdown-toggle" href="#">
							<i class="ace-icon fa fa-tasks"></i>
							<span class="badge badge-grey">4</span>
						</a>
						<ul class="dropdown-menu-right dropdown-navbar dropdown-menu dropdown-caret dropdown-close">
							<li class="dropdown-header">
								<i class="ace-icon fa fa-check"></i>
								4 Tasks to complete
							</li>
							<li class="dropdown-content">
								<ul class="dropdown-menu dropdown-navbar">
									<li>
										<a href="#">
											<div class="clearfix">
												<span class="pull-left">Software Update</span>
												<span class="pull-right">65%</span>
											</div>

											<div class="progress progress-mini">
												<div style="width:65%" class="progress-bar"></div>
											</div>
										</a>
									</li>

									<li>
										<a href="#">
											<div class="clearfix">
												<span class="pull-left">Hardware Upgrade</span>
												<span class="pull-right">35%</span>
											</div>

											<div class="progress progress-mini">
												<div style="width:35%" class="progress-bar progress-bar-danger"></div>
											</div>
										</a>
									</li>

									<li>
										<a href="#">
											<div class="clearfix">
												<span class="pull-left">Unit Testing</span>
												<span class="pull-right">15%</span>
											</div>

											<div class="progress progress-mini">
												<div style="width:15%" class="progress-bar progress-bar-warning"></div>
											</div>
										</a>
									</li>

									<li>
										<a href="#">
											<div class="clearfix">
												<span class="pull-left">Bug Fixes</span>
												<span class="pull-right">90%</span>
											</div>

											<div class="progress progress-mini progress-striped active">
												<div style="width:90%" class="progress-bar progress-bar-success"></div>
											</div>
										</a>
									</li>
								</ul>
							</li>

							<li class="dropdown-footer">
								<a href="#">
									See tasks with details
									<i class="ace-icon fa fa-arrow-right"></i>
								</a>
							</li>
						</ul>
					</li>

					<li class="purple dropdown-modal">
						<a data-toggle="dropdown" class="dropdown-toggle" href="#">
							<i class="ace-icon fa fa-bell icon-animated-bell"></i>
							<span class="badge badge-important">8</span>
						</a>

						<ul class="dropdown-menu-right dropdown-navbar navbar-pink dropdown-menu dropdown-caret dropdown-close">
							<li class="dropdown-header">
								<i class="ace-icon fa fa-exclamation-triangle"></i>
								8 Notifications
							</li>

							<li class="dropdown-content">
								<ul class="dropdown-menu dropdown-navbar navbar-pink">
									<li>
										<a href="#">
											<div class="clearfix">
												<span class="pull-left">
													<i class="btn btn-xs no-hover btn-pink fa fa-comment"></i>
													New Comments
												</span>
												<span class="pull-right badge badge-info">+12</span>
											</div>
										</a>
									</li>

									<li>
										<a href="#">
											<i class="btn btn-xs btn-primary fa fa-user"></i>
											Bob just signed up as an editor ...
										</a>
									</li>

									<li>
										<a href="#">
											<div class="clearfix">
												<span class="pull-left">
													<i class="btn btn-xs no-hover btn-success fa fa-shopping-cart"></i>
													New Orders
												</span>
												<span class="pull-right badge badge-success">+8</span>
											</div>
										</a>
									</li>

									<li>
										<a href="#">
											<div class="clearfix">
												<span class="pull-left">
													<i class="btn btn-xs no-hover btn-info fa fa-twitter"></i>
													Followers
												</span>
												<span class="pull-right badge badge-info">+11</span>
											</div>
										</a>
									</li>
								</ul>
							</li>

							<li class="dropdown-footer">
								<a href="#">
									See all notifications
									<i class="ace-icon fa fa-arrow-right"></i>
								</a>
							</li>
						</ul>
					</li>

					<li class="green dropdown-modal">
						<a data-toggle="dropdown" class="dropdown-toggle" href="#">
							<i class="ace-icon fa fa-envelope icon-animated-vertical"></i>
							<span class="badge badge-success">5</span>
						</a>

						<ul class="dropdown-menu-right dropdown-navbar dropdown-menu dropdown-caret dropdown-close">
							<li class="dropdown-header">
								<i class="ace-icon fa fa-envelope-o"></i>
								5 Messages
							</li>

							<li class="dropdown-content">
								<ul class="dropdown-menu dropdown-navbar">
									<li>
										<a href="#" class="clearfix">
											<img src="${ctxStatic}/ace/images/avatars/avatar.png" class="msg-photo" alt="Alex's Avatar" />
											<span class="msg-body">
												<span class="msg-title">
													<span class="blue">Alex:</span>
													Ciao sociis natoque penatibus et auctor ...
												</span>

												<span class="msg-time">
													<i class="ace-icon fa fa-clock-o"></i>
													<span>a moment ago</span>
												</span>
											</span>
										</a>
									</li>

									<li>
										<a href="#" class="clearfix">
											<img src="${ctxStatic}/ace/images/avatars/avatar3.png" class="msg-photo" alt="Susan's Avatar" />
											<span class="msg-body">
												<span class="msg-title">
													<span class="blue">Susan:</span>
													Vestibulum id ligula porta felis euismod ...
												</span>

												<span class="msg-time">
													<i class="ace-icon fa fa-clock-o"></i>
													<span>20 minutes ago</span>
												</span>
											</span>
										</a>
									</li>

									<li>
										<a href="#" class="clearfix">
											<img src="${ctxStatic}/ace/images/avatars/avatar4.png" class="msg-photo" alt="Bob's Avatar" />
											<span class="msg-body">
												<span class="msg-title">
													<span class="blue">Bob:</span>
													Nullam quis risus eget urna mollis ornare ...
												</span>

												<span class="msg-time">
													<i class="ace-icon fa fa-clock-o"></i>
													<span>3:15 pm</span>
												</span>
											</span>
										</a>
									</li>

									<li>
										<a href="#" class="clearfix">
											<img src="${ctxStatic}/ace/images/avatars/avatar2.png" class="msg-photo" alt="Kate's Avatar" />
											<span class="msg-body">
												<span class="msg-title">
													<span class="blue">Kate:</span>
													Ciao sociis natoque eget urna mollis ornare ...
												</span>

												<span class="msg-time">
													<i class="ace-icon fa fa-clock-o"></i>
													<span>1:33 pm</span>
												</span>
											</span>
										</a>
									</li>

									<li>
										<a href="#" class="clearfix">
											<img src="${ctxStatic}/ace/images/avatars/avatar5.png" class="msg-photo" alt="Fred's Avatar" />
											<span class="msg-body">
												<span class="msg-title">
													<span class="blue">Fred:</span>
													Vestibulum id penatibus et auctor  ...
												</span>

												<span class="msg-time">
													<i class="ace-icon fa fa-clock-o"></i>
													<span>10:09 am</span>
												</span>
											</span>
										</a>
									</li>
								</ul>
							</li>

							<li class="dropdown-footer">
								<a href="inbox.html">
									See all messages
									<i class="ace-icon fa fa-arrow-right"></i>
								</a>
							</li>
						</ul>
					</li>

					<li class="light-blue dropdown-modal">
						<a data-toggle="dropdown" href="#" class="dropdown-toggle">
							<img class="nav-user-photo" src="${ctxStatic}/ace/images/avatars/user.jpg" alt="Jason's Photo" />
							<span class="user-info">
								<small>Welcome,</small>
								root
							</span>

							<i class="ace-icon fa fa-caret-down"></i>
						</a>

						<ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
							<li>
								<a href="javascript:cfg()">
									<i class="ace-icon fa fa-cog"></i>
									配置
								</a>
							</li>

							<li>
								<a href="javascript:clear()">
									<i class="ace-icon fa fa-user"></i>
									清理缓存
								</a>
							</li>

							<li class="divider"></li>

							<li>
								<a href="${ctx }/logout">
									<i class="ace-icon fa fa-power-off"></i>
									Logout
								</a>
							</li>
						</ul>
					</li>
				</ul>
			</div>
		</div><!-- /.navbar-container -->
	</div>

	<div class="main-container ace-save-state" id="main-container">
		<script type="text/javascript">
			try{ace.settings.loadState('main-container')}catch(e){}
		</script>

		<div id="sidebar" class="sidebar                  responsive                    ace-save-state">
			<script type="text/javascript">
				try{ace.settings.loadState('sidebar')}catch(e){}
			</script>

			<div class="sidebar-shortcuts" id="sidebar-shortcuts">
				<div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
					<button class="btn btn-success">
						<i class="ace-icon fa fa-signal"></i>
					</button>
					<button class="btn btn-info">
						<i class="ace-icon fa fa-pencil"></i>
					</button>
					<button class="btn btn-warning">
						<i class="ace-icon fa fa-users"></i>
					</button>
					<button class="btn btn-danger">
						<i class="ace-icon fa fa-cogs"></i>
					</button>
				</div>

				<div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
					<span class="btn btn-success"></span>
					<span class="btn btn-info"></span>
					<span class="btn btn-warning"></span>
					<span class="btn btn-danger"></span>
				</div>
			</div><!-- /.sidebar-shortcuts -->

			<ul class="nav nav-list">
				<li class="">
					<a href="${ctx }/index.html" target="_blank">
						<i class="menu-icon fa fa-tachometer"></i>
						<span class="menu-text"> Dashboard </span>
					</a>
					<b class="arrow"></b>
				</li>
				<!-- 一层 -->
				<c:forEach var="menu1" items="${menus}" varStatus="status">
				<li class="">
					<a href="#" class="dropdown-toggle">
						<i class="menu-icon fa fa-desktop"></i>
						<span class="menu-text" name="${menu1.name }" modelId="${menu1.id }" nav="${menu1.nav }">
							${menu1.name }
						</span>
						<c:if test="${fn:length(menu1.nodes) > 0 }">
						<b class="arrow fa fa-angle-down"></b>
						</c:if>
					</a>
					<!-- 二层 -->
					<c:if test="${fn:length(menu1.nodes) > 0 }">
					<b class="arrow"></b>
					<ul class="submenu">
						<c:forEach var="menu2" items="${menu1.nodes}" varStatus="status">
						<li class="">
							<a href="#" class="<c:if test="${fn:length(menu2.nodes) > 0 }">dropdown-toggle</c:if>" name="${menu2.name }" modelId="${menu2.id }" nav="${menu2.nav }">
								<i class="menu-icon fa fa-caret-right"></i>
								${menu2.name }
								<c:if test="${fn:length(menu2.nodes) > 0 }">
								<b class="arrow fa fa-angle-down"></b>
								</c:if>
							</a>
							<!-- 三层 -->
							<c:if test="${fn:length(menu2.nodes) > 0 }">
							<b class="arrow"></b>
							<ul class="submenu">
								<c:forEach var="menu3" items="${menu2.nodes}" varStatus="status">
								<li class="">
									<a href="#" name="${menu3.name }" modelId="${menu3.id }" nav="${menu3.nav }">
										<i class="menu-icon fa fa-caret-right"></i>
										${menu3.name }
									</a>
									<b class="arrow"></b>
								</li>
								</c:forEach>
							</ul>
							</c:if>
						</li>
						</c:forEach>
					</ul>
					</c:if>
				</li>
				</c:forEach>
			</ul><!-- /.nav-list -->

			<div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
				<i id="sidebar-toggle-icon" class="ace-icon fa fa-angle-double-left ace-save-state" data-icon1="ace-icon fa fa-angle-double-left" data-icon2="ace-icon fa fa-angle-double-right"></i>
			</div>
		</div>

		<div class="main-content">
			<div class="main-content-inner">
				<div class="page-content">
					<div class="ace-settings-container" id="ace-settings-container">
						<div class="btn btn-app btn-xs btn-warning ace-settings-btn" id="ace-settings-btn">
							<i class="ace-icon fa fa-cog bigger-130"></i>
						</div>

						<div class="ace-settings-box clearfix" id="ace-settings-box">
							<div class="pull-left width-50">
								<div class="ace-settings-item">
									<div class="pull-left">
										<select id="skin-colorpicker" class="hide">
											<option data-skin="no-skin" value="#438EB9">#438EB9</option>
											<option data-skin="skin-1" value="#222A2D">#222A2D</option>
											<option data-skin="skin-2" value="#C6487E">#C6487E</option>
											<option data-skin="skin-3" value="#D0D0D0">#D0D0D0</option>
										</select>
									</div>
									<span>&nbsp; Choose Skin</span>
								</div>

								<div class="ace-settings-item">
									<input type="checkbox" class="ace ace-checkbox-2 ace-save-state" id="ace-settings-navbar" autocomplete="off" />
									<label class="lbl" for="ace-settings-navbar"> Fixed Navbar</label>
								</div>

								<div class="ace-settings-item">
									<input type="checkbox" class="ace ace-checkbox-2 ace-save-state" id="ace-settings-sidebar" autocomplete="off" />
									<label class="lbl" for="ace-settings-sidebar"> Fixed Sidebar</label>
								</div>

								<div class="ace-settings-item">
									<input type="checkbox" class="ace ace-checkbox-2 ace-save-state" id="ace-settings-breadcrumbs" autocomplete="off" />
									<label class="lbl" for="ace-settings-breadcrumbs"> Fixed Breadcrumbs</label>
								</div>

								<div class="ace-settings-item">
									<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-rtl" autocomplete="off" />
									<label class="lbl" for="ace-settings-rtl"> Right To Left (rtl)</label>
								</div>

								<div class="ace-settings-item">
									<input type="checkbox" class="ace ace-checkbox-2 ace-save-state" id="ace-settings-add-container" autocomplete="off" />
									<label class="lbl" for="ace-settings-add-container">
										Inside
										<b>.container</b>
									</label>
								</div>
							</div><!-- /.pull-left -->

							<div class="pull-left width-50">
								<div class="ace-settings-item">
									<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-hover" autocomplete="off" />
									<label class="lbl" for="ace-settings-hover"> Submenu on Hover</label>
								</div>

								<div class="ace-settings-item">
									<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-compact" autocomplete="off" />
									<label class="lbl" for="ace-settings-compact"> Compact Sidebar</label>
								</div>

								<div class="ace-settings-item">
									<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-highlight" autocomplete="off" />
									<label class="lbl" for="ace-settings-highlight"> Alt. Active Item</label>
								</div>
							</div><!-- /.pull-left -->
						</div><!-- /.ace-settings-box -->
					</div><!-- /.ace-settings-container -->

					<div class="row">
						<div class="col-xs-12 jerichoTab">
							<!-- PAGE CONTENT BEGINS -->

							<!-- PAGE CONTENT ENDS -->
						</div><!-- /.col -->
					</div><!-- /.row -->
				</div><!-- /.page-content -->
			</div>
		</div><!-- /.main-content -->

		<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
			<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>
	</div><!-- /.main-container -->

	

	<!-- basic scripts -->

	
	<script src="${ctxStatic}/ace/js/bootstrap.min.js"></script>

	<!-- page specific plugin scripts -->

	<!-- ace scripts -->
	<script src="${ctxStatic}/ace/js/ace-elements.min.js"></script>
	<script src="${ctxStatic}/ace/js/ace.min.js"></script>
	<!-- inline scripts related to this page -->
	<div id="tbNews" >
	   <div class="row">
			<div class="space-6"></div>

			<div class="col-sm-6 infobox-container">
				<div class="infobox infobox-green  ">
					<div class="infobox-icon">
						<i class="icon-comments"></i>
					</div>

					<div class="infobox-data">
						<span class="infobox-data-number">32</span>
						<div class="infobox-content">comments + 2 reviews</div>
					</div>
					<div class="stat stat-success">8%</div>
				</div>

				<div class="infobox infobox-blue  ">
					<div class="infobox-icon">
						<i class="icon-twitter"></i>
					</div>

					<div class="infobox-data">
						<span class="infobox-data-number">11</span>
						<div class="infobox-content">new followers</div>
					</div>

					<div class="badge badge-success">
						+32%
						<i class="icon-arrow-up"></i>
					</div>
				</div>

				<div class="infobox infobox-pink  ">
					<div class="infobox-icon">
						<i class="icon-shopping-cart"></i>
					</div>

					<div class="infobox-data">
						<span class="infobox-data-number">8</span>
						<div class="infobox-content">new orders</div>
					</div>
					<div class="stat stat-important">4%</div>
				</div>

				<div class="infobox infobox-red  ">
					<div class="infobox-icon">
						<i class="icon-beaker"></i>
					</div>

					<div class="infobox-data">
						<span class="infobox-data-number">7</span>
						<div class="infobox-content">experiments</div>
					</div>
				</div>

				<div class="infobox infobox-orange2  ">
					<div class="infobox-chart">
						<span class="sparkline" data-values="196,128,202,177,154,94,100,170,224"><canvas style="display: inline-block; width: 44px; height: 34px; vertical-align: top;" width="44" height="34"></canvas></span>
					</div>

					<div class="infobox-data">
						<span class="infobox-data-number">6,251</span>
						<div class="infobox-content">pageviews</div>
					</div>

					<div class="badge badge-success">
						7.2%
						<i class="icon-arrow-up"></i>
					</div>
				</div>

				<div class="infobox infobox-blue2  ">
					<div class="infobox-progress">
						<div class="easy-pie-chart percentage easyPieChart" data-percent="42" data-size="46" style="width: 46px; height: 46px; line-height: 46px;">
							<span class="percent">42</span>%
						<canvas width="46" height="46"></canvas></div>
					</div>

					<div class="infobox-data">
						<span class="infobox-text">traffic used</span>

						<div class="infobox-content">
							<span class="bigger-110">~</span>
							58GB remaining
						</div>
					</div>
				</div>

				<div class="space-6"></div>

				<div class="infobox infobox-green infobox-small infobox-dark">
					<div class="infobox-progress">
						<div class="easy-pie-chart percentage easyPieChart" data-percent="61" data-size="39" style="width: 39px; height: 39px; line-height: 39px;">
							<span class="percent">61</span>%
						<canvas width="39" height="39"></canvas></div>
					</div>

					<div class="infobox-data">
						<div class="infobox-content">Task</div>
						<div class="infobox-content">Completion</div>
					</div>
				</div>

				<div class="infobox infobox-blue infobox-small infobox-dark">
					<div class="infobox-chart">
						<span class="sparkline" data-values="3,4,2,3,4,4,2,2"><canvas style="display: inline-block; width: 39px; height: 20px; vertical-align: top;" width="39" height="20"></canvas></span>
					</div>

					<div class="infobox-data">
						<div class="infobox-content">Earnings</div>
						<div class="infobox-content">$32,000</div>
					</div>
				</div>

				<div class="infobox infobox-grey infobox-small infobox-dark">
					<div class="infobox-icon">
						<i class="icon-download-alt"></i>
					</div>

					<div class="infobox-data">
						<div class="infobox-content">Downloads</div>
						<div class="infobox-content">1,205</div>
					</div>
				</div>
			</div>
			<div class="col-sm-6 infobox-container">
				<div class="infobox infobox-green  ">
					<div class="infobox-icon">
						<i class="icon-comments"></i>
					</div>

					<div class="infobox-data">
						<span class="infobox-data-number">32</span>
						<div class="infobox-content">comments + 2 reviews</div>
					</div>
					<div class="stat stat-success">8%</div>
				</div>

				<div class="infobox infobox-blue  ">
					<div class="infobox-icon">
						<i class="icon-twitter"></i>
					</div>

					<div class="infobox-data">
						<span class="infobox-data-number">11</span>
						<div class="infobox-content">new followers</div>
					</div>

					<div class="badge badge-success">
						+32%
						<i class="icon-arrow-up"></i>
					</div>
				</div>

				<div class="infobox infobox-pink  ">
					<div class="infobox-icon">
						<i class="icon-shopping-cart"></i>
					</div>

					<div class="infobox-data">
						<span class="infobox-data-number">8</span>
						<div class="infobox-content">new orders</div>
					</div>
					<div class="stat stat-important">4%</div>
				</div>

				<div class="infobox infobox-red  ">
					<div class="infobox-icon">
						<i class="icon-beaker"></i>
					</div>

					<div class="infobox-data">
						<span class="infobox-data-number">7</span>
						<div class="infobox-content">experiments</div>
					</div>
				</div>

				<div class="infobox infobox-orange2  ">
					<div class="infobox-chart">
						<span class="sparkline" data-values="196,128,202,177,154,94,100,170,224"><canvas style="display: inline-block; width: 44px; height: 34px; vertical-align: top;" width="44" height="34"></canvas></span>
					</div>

					<div class="infobox-data">
						<span class="infobox-data-number">6,251</span>
						<div class="infobox-content">pageviews</div>
					</div>

					<div class="badge badge-success">
						7.2%
						<i class="icon-arrow-up"></i>
					</div>
				</div>

				<div class="infobox infobox-blue2  ">
					<div class="infobox-progress">
						<div class="easy-pie-chart percentage easyPieChart" data-percent="42" data-size="46" style="width: 46px; height: 46px; line-height: 46px;">
							<span class="percent">42</span>%
						<canvas width="46" height="46"></canvas></div>
					</div>

					<div class="infobox-data">
						<span class="infobox-text">traffic used</span>

						<div class="infobox-content">
							<span class="bigger-110">~</span>
							58GB remaining
						</div>
					</div>
				</div>

				<div class="space-6"></div>

				<div class="infobox infobox-green infobox-small infobox-dark">
					<div class="infobox-progress">
						<div class="easy-pie-chart percentage easyPieChart" data-percent="61" data-size="39" style="width: 39px; height: 39px; line-height: 39px;">
							<span class="percent">61</span>%
						<canvas width="39" height="39"></canvas></div>
					</div>

					<div class="infobox-data">
						<div class="infobox-content">Task</div>
						<div class="infobox-content">Completion</div>
					</div>
				</div>

				<div class="infobox infobox-blue infobox-small infobox-dark">
					<div class="infobox-chart">
						<span class="sparkline" data-values="3,4,2,3,4,4,2,2"><canvas style="display: inline-block; width: 39px; height: 20px; vertical-align: top;" width="39" height="20"></canvas></span>
					</div>

					<div class="infobox-data">
						<div class="infobox-content">Earnings</div>
						<div class="infobox-content">$32,000</div>
					</div>
				</div>

				<div class="infobox infobox-grey infobox-small infobox-dark">
					<div class="infobox-icon">
						<i class="icon-download-alt"></i>
					</div>

					<div class="infobox-data">
						<div class="infobox-content">Downloads</div>
						<div class="infobox-content">1,205</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>