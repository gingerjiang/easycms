<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<head>
	<title>字典管理</title>
	<%@include file="/WEB-INF/views/include/head.jsp" %>
	<%@include file="/WEB-INF/views/include/validation.jsp"%>
	<!-- 配置文件 -->
    <script src="${ctxStatic}/ueditor/ueditor.config.js"></script>
    <!-- 编辑器源码文件 -->
    <script src="${ctxStatic}/ueditor/ueditor.all.min.js"></script>
	<script type="text/javascript">
		var formUeditors = new Array();
		$(document).ready(function() {
			$("#name").focus();
			$("#inputForm").validate({
				submitHandler: function(form){
					$(form).ajaxSubmit({
			        	type : "post",
				        url : "${ctx}/cms/content?action=saveData",
				        dataType : "json",
				        timeout : 180000,
				        beforeSubmit : function() {
				        	//alert('bbb')
				        },
				        success : function(result, status) {
				        	if(result.success == true) {
				        		if ($("input[name='id']").val() == '') {
					        		var r = confirm("保存成功，是否继续添加？");
					    	    	if (r) {
					    	    		$("input[name='id']").val('');
					    	    		$("#inputForm").clearForm();
					    	    		for(j = 0; j < formUeditors.length; j++) {
					    	    			formUeditors[j].setContent('')
					    	    		}
					    	    	} else {
					    	    		Share.close(parent.window.formIndex);
					    	    		parent.window.refresh();
					    	    	}
				        		} else {
				        			Share.close(parent.window.formIndex);
				    	    		parent.window.refresh();
				        		}
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
				errorPlacement : function(error, element) {  
			        if (element.is(":radio"))  
			            error.appendTo(element.parent().next());  
			        else if (element.is(":checkbox"))  
			            error.appendTo(element.parent().parent());  
			        else  
			            error.appendTo(element.parent());   
				}
			});
		});
		
	</script>
	<style type="text/css">
		label.error {
    		display: inline;
    	}
	</style>
</head>
<body>
	<form id="inputForm" class="form-horizontal">
		<input type="hidden" name="id" value="${entity.id }"/>
		<input type="hidden" name="subjectId" value="${subject.id }"/>
		<c:forEach items="${fields}" var="item">
			<c:set var="mappingData" value="${item.mappingData }"></c:set>
			<c:choose>
			   <c:when test="${'text' == item.type}">
					<div class="form-item">
						<label>
						<c:if test="${'0' == item.allowBlank }"><font color="red">*</font></c:if>
						${item.name }:</label>
						<input type="text" name="${mappingData }" maxlength="${item.length }" style="width:550px;" class="form-text <c:if test="${'0' == item.allowBlank }">required</c:if>" value="${fns:getProperty(entity, mappingData)}"/>
						<span class="help-inline"> ${item.remark }</span>
					</div>
			   </c:when>
			   <c:when test="${'number' == item.type}">
			    	<div class="form-item">
						<label>
						<c:if test="${'0' == item.allowBlank }"><font color="red">*</font></c:if>
						${item.name }:</label>
						<input type="text" name="${mappingData }" maxlength="${item.length }" style="width:550px;" class="form-text number <c:if test="${'0' == item.allowBlank }">required</c:if>" value="${fns:getProperty(entity, mappingData)}"/>
						<span class="help-inline"> ${item.remark }</span>
					</div>
			   </c:when>
			   <c:when test="${'textarea' == item.type}">
			    	<div class="form-item">
						<label>
						<c:if test="${'0' == item.allowBlank }"><font color="red">*</font></c:if>
						${item.name }:</label>
		   				<textarea name="${mappingData }" maxlength="${item.length }" class="<c:if test="${'0' == item.allowBlank }">required</c:if>" rows="3" style="width: 600px;">${fns:getProperty(entity, mappingData)}</textarea>
						<span class="help-inline"> ${item.remark }</span>
					</div>
			   </c:when>
			   <c:when test="${'date' == item.type}">
			   		<div class="form-item">
						<label>
						<c:if test="${'0' == item.allowBlank }"><font color="red">*</font></c:if>
						${item.name }:</label>
		   				<input type="text" name="${mappingData }" class="Wdate <c:if test="${'0' == item.allowBlank }">required</c:if>" pattern="yyyy-MM-dd" style="width: 120px;" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});" value="${fns:getProperty(entity, mappingData)}"/>
						<span class="help-inline"> ${item.remark }</span>
					</div>
			   </c:when>
			   <c:when test="${'editor' == item.type}">
			    	<div class="form-item">
						<label>${item.name }:</label>
				    	<script id="${mappingData }" name="${mappingData }" type="text/plain">${fns:getProperty(entity, mappingData)}</script>
	    				<!-- 实例化编辑器 -->
					    <script type="text/javascript">
					    var formUeditor = UE.getEditor('${mappingData }');
					    formUeditors.push(formUeditor);
					    </script>
					</div>
			   </c:when>
			   <c:when test="${'combo' == item.type}">
			   		<div class="form-item">
						<label>
						<c:if test="${'0' == item.allowBlank }"><font color="red">*</font></c:if>
						${item.name }:</label>
				    	<select name="${mappingData }" class="<c:if test="${'0' == item.allowBlank }">required</c:if>">
							<option value="">请选择</option>
							<c:forEach items="${item.combo}" var="op">
								<option value="${op.value}" <c:if test="${op.value == fns:getProperty(entity, mappingData)}"> selected </c:if> >${op.value}</option>
							</c:forEach>
						</select>
						<span class="help-inline"> ${item.remark }</span>
					</div>
			   </c:when>
			</c:choose>
		
		</c:forEach>
			<input id="btnSubmit" class="btn btn-primary" style="right: 0;position: fixed;bottom: 5%;" type="submit" value="保 存"/>&nbsp;
	</form>
</body>
</html>