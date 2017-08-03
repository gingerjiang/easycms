<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html>
<head>
	<title>我的内容管理系统</title>
	<%@include file="/WEB-INF/views/include/head.jsp"%>
	<script src="${ctxStatic}/zTree/jquery.ztree.core.min.js" type="text/javascript"></script>
	<link href="${ctxStatic}/zTree/zTreeStyle/zTreeStyle.css" rel="stylesheet" />
	<style type="text/css">
		body,html{font-size:14px;font-family:'微软雅黑';padding:0;margin:0;} a img{border:0px;}
		.divTop {background:#4F94CD}
		.divTop span{padding-left:20px;line-height:60px;font-size:24px;color: #ffffff} 
		.divMain{float:left;clear:both;}
		.divLeft,.divRight{display:none;float:left;background-color:White;border:double 4px #eee;padding:5px;}
	</style>
	<script type="text/javascript">
		var jericho = {
	        buildTabpanel: function() {
	            $.fn.initJerichoTab({
	                renderTo: '.divRight',
	                uniqueId: 'myJerichoTab',
	                contentCss: { 'height': $('.divRight').height() - 30 }
	            });
	        }
	    }
		var setting = {
			data: {
				simpleData: {
					enable: true
				}
			},
			async: {
				enable: true,
				url:"${ctx}/cms?action=loadModelTree"
			},
			callback: {
				onClick: function(event, treeId, treeNode, clickFlag) {
					if ('1' == treeNode.nav) {
						return;
					}
					 $.fn.jerichoTab.addTab({
						tabFirer: $(treeNode),
	                    title: treeNode.name,
	                    data: {
	                    	dataType: 'iframe',
	                        dataLink: '${ctx}/cms?action=toDataList&modelId='+treeNode.id
	                    }
	                }).loadData();
				}
			}
		};

	    $(document).ready(function() {
	        d1 = new Date().getTime();
	        var w = $(document).width();
	        var h = $(document).height();
	        $('.divLeft').css({ width: 190, height: h - 87, 'display': 'block' });
	        $('.divRight').css({ width: w - 240, height: h - 87, 'display': 'block', 'margin-left': 7 });
	        jericho.buildTabpanel();
	        $.fn.jerichoTab.addTab({
                title: '首页',
                closeable: false,
                data: { dataType: 'formtag', dataLink: '#tbNews' }
            }).loadData();
	        $.fn.zTree.init($("#modelTree"), setting);
	        
	    })
	    $(window).resize(function() {
	        var w = $(document).width();
	        $('.divRight').css({ width: w - 240 });
	    })
	   
	    
	    function cfg() {
	    	window.addTab('配置模型', '${ctx}/cms/table');
	    }
	</script>
</head>
<body>
	<div class="divTop">
	    <span>我的内容管理系统</span>
	    <a href="${ctx}/logout" style="float:right;margin-top: 5px;margin-right: 5px;cursor: pointer;color: #ffffff">退出</a>
		<div style="float:right;margin-top: 20px;margin-right: 5px;">
			<shiro:hasRole name="root">
			    <input onclick="cfg()" class="btn btn-primary" type="button" value="配置模型"/>&nbsp;
			    <input onclick="user()" class="btn btn-primary" type="button" value="用户管理"/>&nbsp;
			</shiro:hasRole>
		</div>
	</div>
	<div class="divMain">
	    <div class="divLeft">
	        <ul id="modelTree" class="ztree">
		    </ul>
	    </div>
	    <div class="divRight"></div>
	</div>
	<div id="tbNews" style="display:none">
	   <div style="text-align:center;vertical-align:middle;">
			<img  src="${ctxStatic}/image/welcome.png" >
		</div>
		
	</div>
	
</body>
</html>