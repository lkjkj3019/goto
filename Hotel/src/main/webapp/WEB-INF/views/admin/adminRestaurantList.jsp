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
					<h2>맛집 관리</h2>
					<div class="breadcrumb-option">
						<span>RestaurantList</span>
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
						<div class="card shadow">
							<div class="card-body">
								<div class="table-responsive">
									<table class="table table-bordered" cellspacing="0">
										<thead>
											<tr>
												<th>맛집코드</th>
												<th>도시코드</th>
												<th>맛집 이름</th>
												<th>주소</th>
												<th>수정</th>
												<th>삭제</th>
											</tr>
										</thead>
										<tbody>
											<c:choose>
												<c:when test="${sessionScope.ALoginId=='ADMIN' }">
													<c:forEach var="rList" items="${restaurantList}">
														<tr>
															<td>${rList.recode}</td>
															<td>${rList.re_ctcode}</td>
															<td>${rList.re_name}</td>
															<td>${rList.readdr}</td>
															<td><button class="site-btn btn"
																	onclick="location.href='restaurantModifyForm?recode=${rList.recode}'">수정</button></td>
															<td><button class="site-btn btn"
																	onclick="deleteRes('${rList.recode}')">삭제</button></td>
														</tr>
													</c:forEach>
												</c:when>
											</c:choose>
										</tbody>
									</table>
								</div>
							</div>
						</div>
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

<script type="text/javascript">
	$(document).ready(
			function() {

				var modalBno = '${modalRecode}';
				var msg = '${msg}';
				checkModal(modalBno);

				function checkModal(modalRecode) {
					if (modalRecode === '') {
						return;
					}
					if (parseInt(modalRecode) > 0) {
						/* if(deleteCheck == 'del'){
							$(".modal-body").text("게시글 " +parseInt(modalBno) +" 번이 삭제되었습니다." )
						}else{
							$(".modal-body").text("게시글 " +parseInt(modalBno) +" 번이 등록되었습니다." )
						} */
						$(".modal-body").text(
								"게시글 " + parseInt(modalRecode) + " 개가 " + msg
										+ " 되었습니다.")
					}

					$("#modalRecode").modal("show");
				}
			});
	function deleteRes(recode){
		alert('삭제되었습니다.');
		location.href='restaurantDelete?recode='+recode;
		}
</script>
