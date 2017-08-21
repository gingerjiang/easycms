<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<head>
	<title>内容管理</title>
	<%@include file="/WEB-INF/views/include/head.jsp"%>
	<%@include file="/WEB-INF/views/include/jqgrid.jsp"%>
	<script src="${ctxStatic}/zTree/jquery.ztree.core.min.js" type="text/javascript"></script>
	<link href="${ctxStatic}/zTree/zTreeStyle/zTreeStyle.css" rel="stylesheet" />
	
	<style type="text/css">
	.divRight {
		background-color: White;
		border: double 0px #eee;
		height: 100%;
	}
	.divLeft {
		background-color: White;
		border: double 0px #eee;
		overflow-y: auto;
		height: 100%;
		width: 260px;
	}
</style>
	<script type="text/javascript">
		var setting = {
			data: {
				simpleData: {
					enable: true
				}
			},
			async: {
				enable: true,
				url:"${ctx}/cms/table?action=loadModelTree"
			},
			callback: {
				onClick: function(event, treeId, treeNode, clickFlag) {
					modelId = treeNode.id;
					load();
				}
			}
		};
		var modelId = "";
	    $(document).ready(function() {
	        d1 = new Date().getTime();
	        var w = $(window).width();
	        var h = $(window).height()-80;
	       // $('.divLeft').css({ width: 190,  'display': 'block' });
	       // $('.divRight').css({ width: w - 290,  'display': 'block' });
	        $.fn.zTree.init($("#modelTree"), setting);
	        
	        
	        var grid = $("#grid").jqGrid({
	                mtype: "POST",
	                datatype: "json",
	        		jsonReader: {
	        			root: "list"
	        		},
	        		toolbar:[true,"top"],   
	                colModel: [
	                    { label: '主键', name: 'id', key: true, hidden: true},
	                    { label: '名称', name: 'name', width: 120 },
	                    { label: '类型', name: 'type', width: 80 },
	                    { label: '序号', name: 'seq', width: 150 },
	                    { label:'备注', name: 'remark', width: 150 },
	                    { label: '列表显示宽度', name: 'width', width: 150 },
	                    { label: '允许为空', name: 'allowBlank', width: 150 },
	                    { label: '列表显示', name: 'listShow', width: 150 },
	                    { label: '下拉sql', name: 'sql', width: 150 },
	                    { label: '映射字段', name: 'mappingData', width: 150 },
	                    { label: '状态', name: 'status', width: 150/* , formatter : function(value, options, row) {
	                    }  */}
	                ],
	        		viewrecords: true,
	        		autowidth: true,
	        		multiselect: true
	            });
	        	$(window).resize(function(){
	        		grid.jqGrid('setGridWidth',w - 320);
	        		grid.jqGrid('setGridHeight',h);
	        	}).resize();
	        	
	        	$("#t_grid").append("<input class='btn' type='button' value='添加' onclick='add()'/>")
	        	.append("&nbsp;&nbsp;<input class='btn' type='button' value='修改' onclick='edit()'/>")
	        	.append("&nbsp;&nbsp;<input class='btn' type='button' value='删除' onclick='del()'/>");  
	    })
	    window.index_ = 0;
	    function open(title,url, w, h) {
			layer.open({
	    	  type: 2, 
	    	  area: [w+'px', h+'px'],
	    	  title: title,
	    	  closeBtn: 1,
	    	  shadeClose: false,
	    	  shade: [0.1 , '#ffffff' , true],
	    	  content: url
	    	});
	    }
	    function add() {
	    	window.index_ = open('新增字段', '${ctx}/cms/table?action=formColumn&modelId='+modelId, 600, 500);
	    
	    }
	    function edit() {
	    	var ids = $("#grid").jqGrid("getGridParam","selarrrow");
	    	if(ids.length == 1) {
	    		window.index_ = open('修改字段', '${ctx}/cms/table?action=formColumn&modelId='+modelId+'&id='+ids[0], 600, 500);
	    	} else {
	    		alert('请选择一条数据修改');
	    	}
	    }
	    function del() {
	    	var ids = $("#grid").jqGrid("getGridParam","selarrrow");
	    	if(ids.length == 0) {
	    		alert('请选择要删除的数据！');
	    		return;
	    	}
	    	var r = confirm("确定删除？");
	    	if (r) {
		    	$.post("${ctx}/cms/table?action=delColumn",{ids: ids.join(',')},function(result){
		    		load();
		    	})
	    	}
	    }
	    
	    function closeWin() {
	    	Share.close(window.index_);
	    }
	    
	    function load() {
	    	$("#grid").setGridParam({
	    		url: '${ctx}/cms/table?action=loadColumn',
	    		page: 1,
	    		postData: {
	    			modelId: modelId
	    		}
	        }).trigger("reloadGrid");
	    }
	    var refreshTree = function() {
	    	var zTree = $.fn.zTree.getZTreeObj("modelTree");
            zTree.reAsyncChildNodes(null, "refresh");
	    }
	    function editModel() {
	    	var nodes = $.fn.zTree.getZTreeObj('modelTree').getSelectedNodes();
	    	if (nodes && nodes.length > 0) {
	    		var modelId = nodes[0].id;
	    		open('修改模型', '${ctx}/cms/table?action=formModel&id='+modelId, 600, 400);
	    	} else {
	    		alert('请选择要修改的模型！')
	    	}
	    }
	    function addModel() {
	    	var nodes = $.fn.zTree.getZTreeObj('modelTree').getSelectedNodes();
	    	if (nodes && nodes.length > 0) {
	    		var modelId = nodes[0].id;
	    		open('修改模型', '${ctx}/cms/table?action=formModel&parentId='+modelId, 600, 350);
	    	} else {
	    		open('修改模型', '${ctx}/cms/table?action=formModel&parentId=1', 600, 350);
	    	}
	    }
	    function delModel() {
	    	var nodes = $.fn.zTree.getZTreeObj('modelTree').getSelectedNodes();
	    	if (nodes && nodes.length > 0) {
	    		var modelId = nodes[0].id;
	    		$.post("${ctx}/cms/table?action=delModel",{id: modelId},function(result){
	    			refreshTree();
		    	})
	    	} else {
	    		alert('请选择要删除的模型！')
	    	}
	    }
	</script>
</head>
<body>
<div class="row">
    <div class="span divLeft">
    	<div class="accordion-heading" >
	    	<label class="accordion-toggle" style="background-color:#24659D;margin-bottom: 0px;color:#fff;">模型树
	    	<i style="margin-left:10px;" class="icon-white icon-refresh pull-right" onclick="refreshTree();" title='刷新'></i>
	    	<i style="margin-left:10px;" class="icon-white icon-minus-sign  pull-right" onclick="delModel()" title='删除'></i>
	    	<i style="margin-left:10px;" class="icon-white icon-edit pull-right" onclick="editModel()" title='修改'></i>
	    	<i style="margin-left:10px;" class="icon-white icon-plus-sign  pull-right" onclick="addModel()" title='新增'></i>
	    	</label>
	    </div>
        <ul id="modelTree" class="ztree">
	    </ul>
    </div>
    <div class="span divRight">
    	<table id="grid"></table>
    </div>
</div>
</body>
</html>