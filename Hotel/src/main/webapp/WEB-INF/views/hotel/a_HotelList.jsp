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
					<h2>호텔 관리</h2>
					<div class="breadcrumb-option">
						<span>HotelList</span>
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
													<th>지역코드</th>
													<th>업체이름</th>
													<th>호텔코드</th>
													<th>호텔이름</th>
													<th>호텔평점</th>
													<th>삭제</th>
												</tr>
											</thead>
											<tbody>
											<c:choose>
												<c:when test="${sessionScope.ALoginId != null }">
													<c:forEach var="list" items="${hotelList }">
														<tr id="hotel${list.hocode }">
															<td>${list.ho_ctcode }</td>
															<td>${list.ho_cid }</td>
															<td>${list.hocode }</td>
															<td> <a href="a_hotelView?hocode=${list.hocode }" style="color: black; text-decoration: underline;">${list.honame }</a></td>
															<td>${list.hoscore }</td>
															<td><button class="site-btn btn" onclick="hotelDelete('${list.hocode}')" >삭제</button></td>
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
<script type="text/javascript">
	$(document).ready(function() {
		$("#a_hotelList").addClass("sideActive");
	})
	function hotelDelete(hocode) {
		var cmPw = '${password}';
		var newPw = prompt('비밀번호를 입력하세요');
		/* 비밀번호 확인 작업 */
		if (cmPw == newPw) {
			/* 비밀번호가 일치하다면 hotel delete */
			$.ajax({
				type : 'post',
				url : 'deleteHotel',
				data : {
					'hocode' : hocode,
				},
				dataType : 'text',
				success : function(result) {
					if (result == 'OK') {
						alert('삭제되었습니다');
						$("#hotel" + hocode).remove();
					}
				},
				error : function() {
					console.log('hotel 삭제 연결 실패')
				}
			})
		}
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