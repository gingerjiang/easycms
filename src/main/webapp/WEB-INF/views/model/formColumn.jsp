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
				        url : "${ctx}/cms/table?action=saveColumn",
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
				        		//var iframeWin = window[parent.layer.find('iframe')[0]['name']];
				        		//iframeWin.load();
				        		parent.load();
			 	            } else {
			 	            	alert(result.msg);
			 	            }
				        },
				        error : function() {
				        	alert('出现错误，稍后再试！');
				        }
			        });
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#messageBox").text("输入有误，请先更正。");
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
		<input type="hidden" name="modelId" value="${entity.modelId}" />
		<div class="control-group">
			<label class="control-label">名称:</label>
			<div class="controls">
				<input type="text" name="name" maxlength="50" class="required" value="${entity.name }"/>
				<span class="help-inline"><font color="red">*</font>填写名字 </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">类型:</label>
			<div class="controls">
				<select name="type" class="input-xlarge">
					<option value="">请选择</option>
					<c:forEach items="${types}" var="item">
						<option value="${item.c1}"  <c:if test="${entity.type == item.c1}"> selected </c:if> >${item.c2}</option>
					</c:forEach>
				</select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">映射字段</label>
			<div class="controls">
				<select name="mappingData" class="input-xlarge">
					<option value="">请选择</option>
					<c:forEach items="${maps}" var="item">
						<option value="${item.c1}" <c:if test="${entity.mappingData == item.c1}"> selected </c:if> >${item.c2}</option>
					</c:forEach>
				</select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">下拉sql</label>
			<div class="controls">
				<input type="text" name="sql" maxlength="50" class="required" value="${entity.sql }" />
				<span class="help-inline">例：select type,value from combo where type = 1</span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">序号</label>
			<div class="controls">
				<input type="text" name="seq" maxlength="50" class="required" value="${entity.seq }" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">列表宽度</label>
			<div class="controls">
				<input type="text" name="width" maxlength="50" class="required" value="${entity.width }" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">允许为空</label>
			<div class="controls">
				是<input type="radio" name="allowBlank" value="1" <c:if test="${entity.allowBlank == '1'}"> checked="true"</c:if> />
				否<input type="radio" name="allowBlank" value="0" <c:if test="${entity.allowBlank == '0'}"> checked="true"</c:if> />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">列表显示</label>
			<div class="controls">
				是<input type="radio" name="listShow" value="1" <c:if test="${entity.listShow == '1'}"> checked="true"</c:if> />
				否<input type="radio" name="listShow" value="0" <c:if test="${entity.listShow == '0'}"> checked="true"</c:if> />
			</div>
		</div>
		
		<div class="control-group">
			<label class="control-label">备注</label>
			<div class="controls">
				<input type="text" name="remark" maxlength="50" value="${entity.remark }" />
			</div>
		</div>
		<div class="form-actions">
			<input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form>
</body>
</html>