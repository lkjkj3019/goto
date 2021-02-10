<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../includes/header.jsp"%>
<style>
.property-pagination a {
	display: contents
}
</style>
<body>
	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb-text">
						<h2>My Page</h2>
						<div class="breadcrumb-option">
							<a href="home"><i class="fa fa-home"></i> Home</a> <span>MyReview</span>
						</div>

					</div>
				</div>
			</div>
		</div>
	</section>


	<section class="property-section spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<div class="property-sidebar">
						<div class="best-agents">
							<h4>MyPage</h4>
							<a href="c_mypage?mid=${sessionScope.MLoginId }" class="ba-item">
								<div class="ba-text">
									<h5>내 정보</h5>
									<span>#</span>
								</div>
							</a> <a href="c_myBookingList" class="ba-item">
								<div class="ba-text">
									<h5>내 예약 목록</h5>
									<span>#</span>
								</div>
							</a> <a href="heartList" class="ba-item">
								<div class="ba-text">
									<h5>찜 목록</h5>
									<span>#</span>
								</div>
							</a> <a href="reviewList" class="ba-item">
								<div class="ba-text">
									<h5>나의 후기</h5>
									<span>#</span>
								</div>
							</a>
							<button
								onclick="delMember('${memberDTO.mcode }','${memberDTO.mid }')"
								class="ba-item btn-none">
								<div class="ba-text">
									<h5>회원 탈퇴</h5>
									<span>#</span>
								</div>
							</button>
						</div>
					</div>
				</div>
				<!-- 사이드 메뉴 끝 -->

				<div class="col-lg-9">
					<h4 class="property-title">후기 목록</h4>
					<div class="property-list">

						<c:forEach var="rList" items="${reviewList }">
							<div class="single-property-item">
								<div class="row">
									<div class="col-md-8">
										<div class="property-text">
											<h5>
												<a href="c_RoomList?hocode=${rList.rocode }">${rList.honame }</a>
											</h5>
											<p>${rList.vcontent }
											<p>
											<div class="top-nav" style="background-color: white;">
												<div class="col-lg-5">
													<div class="top-right" style="margin: 25px 0;">
														<button
															onclick="location.href='reviewDelete?vcode=${rList.vcode}'"
															class="property-sub" style="margin: 0 10px;">삭제</button>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>

					</div>
					<div class="property-pagination">

						<a href="reviewPage">1</a> <a href="reviewPage">[다음]</a>
					</div>
				</div>



			</div>

		</div>
	</section>


</body>






<%@ include file="../includes/footer.jsp"%>