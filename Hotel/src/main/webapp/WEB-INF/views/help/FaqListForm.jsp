<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../includes/a_sidebar.jsp"%>
<!-- main 시작 -->
<!-- main top 시작-->
<div class="main">
	<section class="breadcrumb-section">
		<div class="row">
			<div class="col-lg-12">
				<div class="breadcrumb-text">
					<h2>자주 묻는 질문 관리</h2>
					<div class="breadcrumb-option">
						<span>FaqListForm</span>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- main top 끝 -->

	<!-- main container 시작 -->
	<section class="property-section spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="property-list">
						<form action="FaqList" method="post">
							<div class="card shadow">
								<div class="card-body">
									<div class="table-responsive">
										<table class="table table-bordered" cellspacing="0">
											<thead>
												<tr>
													<td>FaqCode</td>
													<td>카테고리</td>
													<td>자주묻는 질문 제목</td>
													<td>삭제</td>
												</tr>
											</thead>
											<tbody>
												<c:choose>
													<c:when test="${sessionScope.ALoginId=='ADMIN' }">
														<c:forEach var="fList" items="${FaqList }">
															<tr>
																<td>${fList.faqcode }</td>
																<td>${fList.faq_qccode }</td>
																<td>${fList.faqtitle }</td>
																<td><button type="button" id="FaqDelBtn"
																		class="site-btn btn"
																		onclick="deleteBtn('${fList.faqcode}')">삭제</button></td>
															</tr>
														</c:forEach>
													</c:when>
												</c:choose>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- main container 끝 -->
</div>
</div>
<!-- main 끝 -->



</body>

<script>
	function deleteBtn(faqcode) {
		alert('삭제되었습니다.');
		location.href = 'FaqListDel?faqcode=' + faqcode;
	}
</script>

<!-- Js Plugins -->
<script src="resources/js/jquery-3.3.1.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/jquery.magnific-popup.min.js"></script>
<script src="resources/js/jquery.nice-select.min.js"></script>
<script src="resources/js/jquery.slicknav.js"></script>
<script src="resources/js/jquery-ui.min.js"></script>
<script src="resources/js/owl.carousel.min.js"></script>
<script src="resources/js/main.js"></script>

</html>