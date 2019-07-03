<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<head>
<title></title>
</head>
<body style="width: 98%">
	<table class="table table-striped table-advance table-hover">
		<thead>
			<tr>
				<th>文件</th>
			</tr>
		</thead>
		<tbody id="table-data" role="alert" aria-live="polite" aria-relevant="all">
			<c:forEach var="item" items="${files}" varStatus="status">
				<tr class="gradeA odd">
					<td>${item}
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
		
	</div>
</body>
</html>