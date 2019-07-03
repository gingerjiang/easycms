<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<head>
	<title>日志管理</title>
	<%@include file="/WEB-INF/views/include/head.jsp" %>
	<%@include file="/WEB-INF/views/include/jqgrid.jsp" %>
	<style type="text/css">
		form {
		    margin: 0 0 6px;
		}
	</style>
	<script type="text/javascript">
	
	var colModel = ${colModel};
	colModel.push({ label: '状态', name: 'state', width: 100, formatter : function(value, options, row) {
			if ('1' == row.state) {
				return "<font color='#458B00'>已发布 </font>";
			} else {
				return "<font color='#FF0000'>未发布 </font>";
			}
		}
	});
	colModel.push({ label: '操作', name: 'act', width: 50, formatter : function(value, options, row) {
			return '<a href="javascript:void(0)" onclick="edit('+row.id+')">修改</a>'
    	}
    });
	$(document).ready(function(){
		var grid = $("#grid").jqGrid({
	        url: '${ctx}/cms/content?action=loadData&subjectId=${subject.id}',
	        mtype: "POST",
	        datatype: "json",
			jsonReader: {
				root: "list"
			},
			toolbar:[true,"top"],
			colModel: colModel,
			viewrecords: true,
			multiselect: true,
			rownumbers: true,
	        rowNum: 20 ,
	        pager: "#pager" 
	    });
		$("#t_grid").append("<input type='button' value='添加' onclick='add()'/>")
		.append("&nbsp;&nbsp;<input type='button' value='发布' onclick='pub()'/>")
		.append("&nbsp;&nbsp;<input type='button' value='撤回' onclick='back()'/>")
		.append("&nbsp;&nbsp;<input type='button' value='删除' onclick='del()'/>");
		$(window).resize(function() {
			grid.jqGrid('setGridWidth',$(document).width()-30);
			grid.jqGrid('setGridHeight',$(document).height()-150);
		}).resize();
	});
	function searchForm() {
		//要件查询
		var serializeObj = {};
		$($("#searchForm").formToArray()).each(function() {
			serializeObj[this.name] = $.trim(this.value);
		});
		$("#grid").setGridParam({
			page: 1,
			postData: serializeObj,
	    }).trigger("reloadGrid");
	}
	function add() {
		var width = window.innerWidth;
		var height = window.innerHeight;
		window.formIndex = Share.open('添加数据', '${ctx}/cms/content?action=toForm&subjectId=${subject.id}', width*0.95, height*0.9);
	}
	function edit(id) {
		var width = window.innerWidth;
		var height = window.innerHeight;
		window.formIndex = Share.open('修改数据', '${ctx}/cms/content?action=toForm&subjectId=${subject.id}&id='+id, width*0.95, height*0.9);
	}
	function del() {
    	var ids = $("#grid").jqGrid("getGridParam","selarrrow");
    	if(ids.length == 0) {
    		alert('请选择要删除的数据！');
    		return;
    	}
    	var r = confirm("确定删除？");
    	if (r) {
	    	$.post("${ctx}/cms/content?action=delData",{subjectId: '${subject.id}',ids: ids.join(',')},function(result){
	    		searchForm();
	    	})
    	}
    }
	function pub() {
		var ids = $("#grid").jqGrid("getGridParam","selarrrow");
    	if(ids.length == 0) {
    		alert('请选择要发布的数据！');
    		return;
    	}
    	var r = confirm("确定发布到网站？");
    	if (r) {
	    	$.post("${ctx}/cms/content?action=pubData",{subjectId: '${subject.id}',ids: ids.join(',')},function(result){
	    		searchForm();
	    	})
    	}
	}
	function back() {
		var ids = $("#grid").jqGrid("getGridParam","selarrrow");
    	if(ids.length == 0) {
    		alert('请选择要撤回的数据！');
    		return;
    	}
    	var r = confirm("确定要撤回发布的数据？");
    	if (r) {
	    	$.post("${ctx}/cms/content?action=backData",{subjectId: '${subject.id}',ids: ids.join(',')},function(result){
	    		searchForm();
	    	})
    	}
	}
	window.refresh = function() {
		searchForm();
	}
	</script>
</head>
<body>
	<form id="searchForm" class="form-horizontal">
		<div class="form-item">
			<span>查询内容：</span>
			<input id="c1" name="c1" type="text" class="form-text"/>
			<span>创建时间：</span>
			<input name="date1" type="text" readonly="readonly" maxlength="20" class="Wdate form-text"
				onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:true});" style="width: 100px"/>
			<input name="date2" type="text" readonly="readonly" maxlength="20" class="Wdate form-text"
				 onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:true});" style="width: 100px"/>
			<input id="btnSubmit" type="button" value="查询" onclick="searchForm()"/>&nbsp;&nbsp;
		</div>
	</form>
	<table id="grid"></table>
	<div id="pager"></div>
</body>
</html>