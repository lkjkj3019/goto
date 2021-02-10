<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../includes/a_sidebar.jsp" %>
		<!-- main 시작 -->
			<!-- main top 시작-->
		<div class="main">
			<section class="breadcrumb-section">
				<div class="row">
					<div class="col-lg-12">
						<div class="breadcrumb-text">
							<h2>관리페이지</h2>
							<div class="breadcrumb-option">
								<span>CompanyList</span>
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
								<c:choose>
									<c:when test="${sessionScope.ALoginId==ADMIN }">
										<div class="card shadow">
											<div class="card-body">
												<div class="table-responsive">
													<table class="table table-bordered" cellspacing="0">
														<thead>
															<tr>
																<th>코드</th>
																<th>아이디</th>
																<th>이름</th>
																<th>이메일</th>
																<th>삭제</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach var="cList" items="${companyList }">
																<tr>
																	<td>${cList.cmcode }</td>
																	<td>${cList.cmid }</td>
																	<td><a href="#">${cList.cmname }</a></td>
																	<td>${cList.cmemail }</td>
																	<td><a class="btn primary-btn"
																		style="padding: 5% 10%;"
																		href="companyDelete?cmid=${cList.cmid }">삭제</a></td>
																</tr>
															</c:forEach>
														</tbody>
													</table>
												</div>
											</div>
										</div>
									</c:when>
								</c:choose>
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