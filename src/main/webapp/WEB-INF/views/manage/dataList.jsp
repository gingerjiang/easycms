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
	        url: '${ctx}/cms?action=loadData&modelId=${model.id}',
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
		$("#t_grid").append("<input class='btn' type='button' value='添加' onclick='add()'/>")
		.append("&nbsp;&nbsp;<input class='btn' type='button' value='发布' onclick='pub()'/>")
		.append("&nbsp;&nbsp;<input class='btn' type='button' value='撤回' onclick='back()'/>")
		.append("&nbsp;&nbsp;<input class='btn' type='button' value='删除' onclick='del()'/>");
		$(window).resize(function() {
			grid.jqGrid('setGridWidth',$(document).width()-2);
			grid.jqGrid('setGridHeight',$(document).height()-160);
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
		window.addTab('添加数据', '${ctx}/cms?action=toDataForm&modelId=${model.id}');
	}
	function edit(id) {
		window.addTab('修改数据', '${ctx}/cms?action=toDataForm&modelId=${model.id}&id='+id);
	}
	function del() {
    	var ids = $("#grid").jqGrid("getGridParam","selarrrow");
    	if(ids.length == 0) {
    		alert('请选择要删除的数据！');
    		return;
    	}
    	var r = confirm("确定删除？");
    	if (r) {
	    	$.post("${ctx}/cms?action=delData",{modelId: '${model.id}',ids: ids.join(',')},function(result){
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
	    	$.post("${ctx}/cms?action=pubData",{modelId: '${model.id}',ids: ids.join(',')},function(result){
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
	    	$.post("${ctx}/cms?action=backData",{modelId: '${model.id}',ids: ids.join(',')},function(result){
	    		searchForm();
	    	})
    	}
	}
	</script>
</head>
<body>
	<%-- <ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/cms?action=toDataList&modelId=${model.id}">列表</a></li>
		<li ><a href="${ctx}/cms?action=toDataForm&modelId=${model.id}">添加</a></li>
	</ul> --%>
	<form id="searchForm" class="form-search">
		<li>
			<label>查询内容：</label><input id="c1" name="c1" type="text" class="input-medium"/>
			<label>创建时间：</label>
			<input name="date1" type="text" readonly="readonly" maxlength="20" class="Wdate"
				onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:true});" style="width: 100px"/>
			<input name="date2" type="text" readonly="readonly" maxlength="20" class="Wdate"
				 onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:true});" style="width: 100px"/>
			<input id="btnSubmit" class="btn btn-primary" type="button" value="查询" onclick="searchForm()"/>&nbsp;&nbsp;
		</li>
	</form>
	<table id="grid"></table>
	<div id="pager"></div>
</body>
</html>