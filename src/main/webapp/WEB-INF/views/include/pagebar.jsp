<%@ page contentType="text/html;charset=UTF-8" %>
<c:choose>
	<c:when test="${total > 0}">

		<c:choose>
			<c:when test="${currentPage == 1}">
				<li class="pageItemDisable">首页</li>
			</c:when>
			<c:otherwise>
				<li class="pageItem"><a href="${pageUrl}&page=1">首页</a></li>
			</c:otherwise>
		</c:choose>
		<c:choose>
			<c:when test="${currentPage-1 ge 1}">
				<li class="pageItem"><a href="${pageUrl}&page=${currentPage - 1}">上一页</a></li>
			</c:when>
			<c:otherwise>
				<li class="pageItemDisable">上一页</li>
			</c:otherwise>
		</c:choose>
		<c:choose>
			<c:when test="${totalPage >= 10}">
				<c:choose>
					<c:when test="${currentPage <= 5}">
						<c:forEach begin="1" end="10" var="i">
							<c:choose>
								<c:when test="${currentPage == i}">
									<li class="pageItemActive">${i}</li>
								</c:when>
								<c:otherwise>
									<li class="pageItem"><a href="${pageUrl}&page=${i}">${i}</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<c:forEach begin="${currentPage - 5}" end="${currentPage + 5}"
							var="i">
							<c:if test="${i <=  totalPage}">
								<c:choose>
									<c:when test="${currentPage == i}">
										<li class="pageItemActive">${i}</li>
									</c:when>
									<c:otherwise>
										<li class="pageItem"><a href="${pageUrl}&page=${i}">${i}</a></li>
									</c:otherwise>
								</c:choose>
							</c:if>
						</c:forEach>
						<c:if test="${currentPage + 5 <  totalPage}">
							<span>...</span>
						</c:if>
					</c:otherwise>
				</c:choose>
			</c:when>
			<c:otherwise>
				<c:forEach begin="1" end="${totalPage}" var="i">
					<c:choose>
						<c:when test="${currentPage == i}">
							<li class="pageItemDisable">${i}</li>
						</c:when>
						<c:otherwise>
							<li class="pageItem"><a href="${pageUrl}&page=${i}">${i}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</c:otherwise>
		</c:choose>


		<c:choose>
			<c:when test="${currentPage+1 le totalPage}">
				<li class="pageItem"> <a href="${pageUrl}&page=${currentPage + 1}">下一页</a></li>
			</c:when>
			<c:otherwise>
				<li class="pageItemDisable">下一页</li>
			</c:otherwise>
		</c:choose>
		<c:choose>
			<c:when test="${currentPage == totalPage}">
				<li class="pageItemDisable">末页</li>
			</c:when>
			<c:otherwise>
				<li class="pageItem"><a href="${pageUrl}&page=${totalPage}">末页</a></li>
			</c:otherwise>
		</c:choose>
		<li class="pageItem">共${totalPage}页-${total}条记录</li>
	</c:when>
	<c:otherwise>
		暂无任何记录 !!
	</c:otherwise>
</c:choose>