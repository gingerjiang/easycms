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
				        url : "${ctx}/cms/configure?action=saveField",
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
		<input type="hidden" name="subjectId" value="${entity.subjectId}" />
		<div class="form-item">
			<label>名称:</label>
			<input type="text" name="name" maxlength="50" class="form-text required" value="${entity.name }"/>
			<span class="help-inline"><font color="red">*</font>填写名字 </span>
		</div>
		<div class="form-item">
			<label>类型:</label>
			<select name="type" class="input-xlarge">
				<option value="">请选择</option>
				<c:forEach items="${types}" var="item">
					<option value="${item.c1}"  <c:if test="${entity.type == item.c1}"> selected </c:if> >${item.c2}</option>
				</c:forEach>
			</select>
		</div>
		<div class="form-item">
			<label>映射字段:</label>
			<select name="mappingData" class="input-xlarge">
				<option value="">请选择</option>
				<c:forEach items="${maps}" var="item">
					<option value="${item.c1}" <c:if test="${entity.mappingData == item.c1}"> selected </c:if> >${item.c2}</option>
				</c:forEach>
			</select>
		</div>
		<div class="form-item">
			<label>下拉sql:</label>
			<input type="text" name="sql" class="form-text"  value="${entity.sql }" />
			<span class="help-inline">例：select type,value from combo where type = 1</span>
		</div>
		<div class="form-item">
			<label>序号:</label>
			<input type="text" name="seq" maxlength="50" class="form-text required" value="${entity.seq }" />
		</div>
		<div class="form-item">
			<label>列表宽度:</label>
			<input type="text" name="width" maxlength="50" class="form-text required" value="${entity.width }" />
		</div>
		<div class="form-item">
			<label>允许为空:</label>
			<div class="controls">
				是<input type="radio" name="allowBlank" value="1" class="form-radio" <c:if test="${entity.allowBlank == '1'}"> checked="true"</c:if> />
				否<input type="radio" name="allowBlank" value="0" class="form-radio" <c:if test="${entity.allowBlank == '0'}"> checked="true"</c:if> />
			</div>
		</div>
		<div class="form-item">
			<label>列表显示:</label>
			是<input type="radio" name="listShow" value="1" class="form-radio" <c:if test="${entity.listShow == '1'}"> checked="true"</c:if> />
			否<input type="radio" name="listShow" value="0" class="form-radio" <c:if test="${entity.listShow == '0'}"> checked="true"</c:if> />
		</div>
		
		<div class="form-item">
			<label>备注:</label>
			<input type="text" name="remark" maxlength="50" class="form-text" value="${entity.remark }" />
		</div>
		<div class="form-action">
			<input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form>
</body>
</html>