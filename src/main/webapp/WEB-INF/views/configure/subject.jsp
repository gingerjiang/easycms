<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<head>
	<title>字典管理</title>
	<%@include file="/WEB-INF/views/include/head.jsp" %>
	<%@include file="/WEB-INF/views/include/validation.jsp"%>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#name").focus();
			$("#inputForm").validate({
				submitHandler: function(form){
					//loading('正在提交，请稍等...');
					//alert('')
					$(form).ajaxSubmit({
			        	type : "post",
				        url : "${ctx}/cms/configure?action=saveSubject",
				        dataType : "json",
				        timeout : 180000,
				        beforeSubmit : function() {
				        	//alert('bbb')
				        },
				        success : function(result, status) {
				        	if(result.success == true) {
				        		//alert(result.msg);
				        		var index = parent.layer.getFrameIndex(window.name);
				        		parent.layer.close(index);
				        		//parent.refreshTree();
			 	            } else {
			 	            	alert(result.msg);
			 	            }
				        },
				        error : function() {
				        	alert('出现错误，稍后再试！');
				        }
			        });
				},
				errorElement: 'span',
				errorPlacement: function(error, element) {
					if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
						error.appendTo(element.parent().parent());
					} else {
						error.insertAfter(element);
					}
				}
			});
		});
		
	</script>
</head>
<body>
	<form id="inputForm" class="form-horizontal">
		<input type="hidden" name="id" value="${entity.id}"/>
		<input type="hidden" name="parentId" value="${entity.parentId}" />
		<div class="form-item">
			<label>名称:</label>
			<input type="text" name="name" maxlength="50" class="form-text required" value="${entity.name }"/>
			<span class="help-inline"><font color="red">*</font>填写名名称</span>
		</div>
		<div class="form-item">
			<label>表名:</label>
			<input type="text" name="tableName" maxlength="50" class="form-text required" value="data_1"/>
			<span class="help-inline"><font color="red">*</font>填写存储的表名称 </span>
		</div>
		
		<div class="form-item">
			<label>序号:</label>
			<input type="text" name="seq" maxlength="50" class="form-text required" value="${entity.seq }"/>
			<span class="help-inline"><font color="red">*</font>填写序号 </span>
		</div>
		
		<div class="form-item">
			<label>备注</label>
			<input type="text" name="remark" maxlength="50" class="form-text"  value="${entity.remark }" />
		</div>
		<div class="form-action">
			<input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;
		</div>
	</form>
</body>
</html>