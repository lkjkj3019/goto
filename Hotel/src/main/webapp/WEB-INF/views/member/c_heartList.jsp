<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../includes/header.jsp"%>



<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="breadcrumb-text">
					<h2>My Page</h2>
					<div class="breadcrumb-option">
						<a href="/"><i class="fa fa-home"></i> Home</a> 
						<a href="c_mypage?mid=${sessionScope.MLoginId }">My Page</a> 
						<span>My HeartList</span>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Breadcrumb Section Begin -->

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
				<h4 class="property-title">HeartList</h4>
				<div class="property-list">
				
				<form action="heartList" method="post">
					<c:forEach var="heartList" items="${heartList }">
						<div class="single-property-item" id="heartList${heartList.htcode }">
							<div class="row">
								<div class="col-md-4">
									<div class="property-pic">
									<img src="/resources/img/hotelFile/${heartList.hofilename}" alt="">
									
									</div>
								</div>
								<div class="col-md-8">
									<div class="property-text">
										<a href="#"><h5 class="r-title">${heartList.honame }</h5></a>
										<div class="room-price">
											<span>호텔평점 : </span>
											<h5>${heartList.hoscore }</h5>
										</div>
										<div class="properties-location">
											<i class="icon_pin"></i>${heartList.hoaddr }
										</div>
										<p>${heartList.hopublicize }</p>
										<div class="room-price">
											<span>호텔가격 : </span>
											<h5>${heartList.roprice }</h5>
										</div>
										<a class="btn primary-btn s-text" style="float: right;"
											onclick="heartDelete('${heartList.htcode }')">삭제</a>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
					</form>
				</div>
				<div class="property-pagination">
                    <c:forEach begin="${pagedto.startpage }" end="${pagedto.endpage }" step="1" var="pageNum">
                    	<c:choose>
                    		<c:when test="${pageNum == pagedto.page }">
		                        <a href="#" class="active">${pageNum }</a>
                    		</c:when>
                    		<c:otherwise>
		                        <a href="heartList?page=${pageNum }">${pageNum }</a>
                    		</c:otherwise>
                    	</c:choose>
                    </c:forEach>
                </div>
			</div>
		</div>
		</div>
</section>
<!-- Property Section End -->
<script type="text/javascript">
	function heartDelete(htcode){
		console.log(htcode)
		/* 찜 삭제 */
		$.ajax({
			type: "post",
			url: "heartDelete",
			data: {
				"htcode": htcode
				},
			dateType: "text",
			success: function(result){
				if(result = "OK") $("#heartList"+htcode).remove();
				alert('찜목록에서 삭제되었습니다.')
				},
			error: function(){
				console.log('heartDelte 연결 실패')
			}
			})
		}
	function delMember(mcode, mid) {
		/* 회원 삭제 */
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