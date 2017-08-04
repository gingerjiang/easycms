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
		var formUeditor;
		$(document).ready(function() {
			$("#name").focus();
			$("#inputForm").validate({
				submitHandler: function(form){
					$(form).ajaxSubmit({
			        	type : "post",
				        url : "${ctx}/cms?action=saveData",
				        dataType : "json",
				        timeout : 180000,
				        beforeSubmit : function() {
				        	//alert('bbb')
				        },
				        success : function(result, status) {
				        	if(result.success == true) {
				        		var r = confirm("保存成功，是否继续添加？");
				    	    	if (r) {
				    	    		$("input[name='id']").val('');
				    	    		$("#inputForm").clearForm();
				    	    		if (formUeditor) {
				    	    			formUeditor.setContent('')
				    	    		}
				    	    	} else {
				    	    		window.closeCurrentTab();
				    	    		//window.location.href = "${ctx}/cms?action=toDataList&modelId=${model.id}";
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
		form {
		    margin-left: -100px;
		}
		label.error {
    		display: inline;
    	}
	</style>
</head>
<body>
	<%-- <ul class="nav nav-tabs">
		<li><a href="${ctx}/cms?action=toDataList&modelId=${model.id}">列表</a></li>
		<li class="active">
			<a href="${ctx}/cms?action=toDataForm&modelId=${model.id}&id=${entity.id}">
			${not empty entity.id?'修改':'添加'}
			</a>
		</li>
	</ul><br/> --%>
	<form id="inputForm" class="form-horizontal">
		<input type="hidden" name="id" value="${entity.id }"/>
		<input type="hidden" name="modelId" value="${model.id }"/>
		<c:forEach items="${columns}" var="item">
			<c:set var="mappingData" value="${item.mappingData }"></c:set>
			<c:choose>
			   <c:when test="${'text' == item.type}">
					<div class="control-group">
						<label class="control-label">
						<c:if test="${'0' == item.allowBlank }"><font color="red">*</font></c:if>
						${item.name }:</label>
						<div class="controls">
							<input type="text" name="${mappingData }" maxlength="${item.length }" style="width:550px;" <c:if test="${'0' == item.allowBlank }">class="required"</c:if> value="${fns:getProperty(entity, mappingData)}"/>
							<span class="help-inline"> ${item.remark }</span>
						</div>
					</div>
			   </c:when>
			   <c:when test="${'number' == item.type}">
			    	<div class="control-group">
						<label class="control-label">
						<c:if test="${'0' == item.allowBlank }"><font color="red">*</font></c:if>
						${item.name }:</label>
						<div class="controls">
							<input type="text" name="${mappingData }" maxlength="${item.length }" style="width:550px;" class="number <c:if test="${'0' == item.allowBlank }">required</c:if>" value="${fns:getProperty(entity, mappingData)}"/>
							<span class="help-inline"> ${item.remark }</span>
						</div>
					</div>
			   </c:when>
			   <c:when test="${'textarea' == item.type}">
			    	<div class="control-group">
						<label class="control-label">
						<c:if test="${'0' == item.allowBlank }"><font color="red">*</font></c:if>
						${item.name }:</label>
						<div class="controls">
			   				<textarea name="${mappingData }" maxlength="${item.length }" class="<c:if test="${'0' == item.allowBlank }">required</c:if>" rows="3" style="width: 600px;">${fns:getProperty(entity, mappingData)}</textarea>
							<span class="help-inline"> ${item.remark }</span>
						</div>
					</div>
			   </c:when>
			   <c:when test="${'date' == item.type}">
			   		<div class="control-group">
						<label class="control-label">
							<c:if test="${'0' == item.allowBlank }"><font color="red">*</font></c:if>
							${item.name }:</label>
							<div class="controls">
				   				<input type="text" name="${mappingData }" class="Wdate <c:if test="${'0' == item.allowBlank }">required</c:if>" pattern="yyyy-MM-dd" style="width: 120px;" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});" value="${fns:getProperty(entity, mappingData)}"/>
								<span class="help-inline"> ${item.remark }</span>
							</div>
					</div>
			   </c:when>
			    <c:when test="${'editor' == item.type}">
			    	<div class="control-group">
						<label class="control-label">${item.name }:</label>
						<div class="controls">
					    	<script id="${mappingData }" name="${mappingData }" type="text/plain">
								${fns:getProperty(entity, mappingData)}
    						</script>
		    				<!-- 实例化编辑器 -->
						    <script type="text/javascript">
						    formUeditor = UE.getEditor('${mappingData }');
						    </script>
						</div>
					</div>
			   </c:when>
			    <c:when test="${'combo' == item.type}"> 
			   </c:when>
			</c:choose>
		
		</c:forEach>
			<input id="btnSubmit" class="btn btn-primary" style="right: 0;position: fixed;bottom: 2%;" type="submit" value="保 存"/>&nbsp;
	</form>
</body>
</html>