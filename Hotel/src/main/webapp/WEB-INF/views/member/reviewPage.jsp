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
							<a href="/"><i class="fa fa-home"></i> Home</a> <a
								href="c_mypage?mid=${sessionScope.MLoginId }">My Page</a> 
								<span>My review</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Property Section Begin -->
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
									<span>Info</span>
								</div>
							</a> <a href="c_myBookingList" class="ba-item">
								<div class="ba-text">
									<h5>내 예약 목록</h5>
									<span>Booking</span>
								</div>
							</a> <a href="heartList" class="ba-item">
								<div class="ba-text">
									<h5>찜 목록</h5>
									<span>♡</span>
								</div>
							</a> <a href="reviewPage" class="ba-item">
								<div class="ba-text">
									<h5>나의 후기</h5>
									<span>Review</span>
								</div>
							</a>
							<button
								onclick="delMember('${memberDTO.mcode }','${memberDTO.mid }')"
								class="ba-item btn-none">
								<div class="ba-text">
									<h5>회원 탈퇴</h5>
									<span>Secession</span>
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
									<div class="col-md-12">
										<div class="property-text s-text">
											<a href="c_RoomList?hocode=${rList.v_hocode }"><h5>${rList.honame }</h5></a>
													<p>${rList.vcontent }</p>
														<button onclick="location.href='reviewDelete?vcode=${rList.vcode}'"
															class="btn primary-btn s-text" style="float: left;">삭제</button>
											</div>
										</div>
									</div>
								</div>
						</c:forEach>
					</div>
					<div class="property-pagination">
						<c:choose>
							<c:when test="${pageDTO.page<=1 }">
								<a href="#" class="page-link">[이전]</a>
							</c:when>
							<c:when test="${pageDTO.page>1 }">
								<a href="reviewPage?page=${pageDTO.page-1 }">[이전]</a>
							</c:when>
						</c:choose>
						<c:forEach var="pageNum" begin="${pageDTO.startpage}"
							end="${pageDTO.endpage}" step="1">
							<c:choose>
								<c:when test="${pageNum == pageDTO.page }">
									<a href="#" class="page-link">${pageNum }</a>
								</c:when>
								<c:otherwise>
									<a href="reviewPage?page=${pageNum }">${pageNum }</a>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:choose>
							<c:when test="${pageDTO.page < pageDTO.maxpage }">
								<a href="reviewPage?page=${pageDTO.page+1 }">[다음]</a>
							</c:when>
							<c:when test="${pageDTO.page >= pageDTO.maxpage }">
								<a href="#" class="page-link">[다음]</a>
							</c:when>
						</c:choose>

					</div>
				</div>
			</div>
		</div>
	</section>


</body>
<script type="text/javascript">
	function delMember(mcode, mid) {
		/* 회원 탈퇴 */
		$.ajax({
			type : 'post',
			url : 'memberDelete',
			data : {
				'mcode' : mcode,
				'mid' : mid
			},
			dataType : 'text',
			success : function(result) {
				console.log(result);
				if (result == 'OK') {
					alert('탈퇴되었습니다.')
					location.href = "/"
				}
			},
			error : function() {
				console.log('member 삭제 연결 실패')
			}
		})
	}
</script>

<%@ include file="../includes/footer.jsp"%>