<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
						<span>My BookingList</span>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Breadcrumb Section End -->

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
                
                <!-- bookingList Start -->
                <div class="col-lg-9">
                    <h4 class="property-title">숙소 예약내역</h4>
                    <div class="property-list">
                    <c:if test="${bookingList[0].bcode == null }">
                    <div class="breadcrumb-text">
					<h5 style="padding: 150px">예약된 내역이 없습니다.</h5>
					</div>
                    </c:if>
                    <c:forEach var="list" items="${bookingList }">
                        <div class="single-property-item" id="deldiv${list.bcode }">
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="property-pic">
                                        <a href="c_RoomList?hocode=${list.b_hocode }" style="text-decoration: none;"><img src="/resources/img/hotelFile/${list.hofileName }" alt=""></a>
                                    </div>
                                </div>
                                <div class="col-md-8">
                                    <div class="property-text">
                                        <div class="s-text btn" style="display: none;" id="complete${list.bcode }">이용완료</div>
                                    	<div class="f-text btn" style="display: none;" id="cancel${list.bcode }" onclick="cancelBooking('${list.bcode }')">예약취소</div>
                                        <h5 class="r-title"><a href="c_RoomList?hocode=${list.b_hocode }" style="text-decoration: none; color: black;">${list.honame }</a>
                                        <span class="t_title">&nbsp; -&nbsp; ${list.roname }</span></h5>
                                        <div class="properties-location"><i class="icon_pin"></i>${list.hoaddr }</div>
                                        <p id="checkinDate${list.bcode }"><span class="t_title">체크인 :</span> ${list.bcheckin }</p> <p><span class="t_title"> 예약자 :</span> ${list.mname }</p>
                                        <p id="checkoutDate${list.bcode }"><span class="t_title">체크아웃 :</span> ${list.bcheckout }</p> <p><span class="t_title">전화번호 :</span> ${list.mphone }</p>
                                        <div class="room-price">
                                            <span>결제 가격: </span>
                                            <h5>${list.bprice } </h5>
                                        <button type="button" style="display: none;" id="review${list.bcode }" class="site-btn review" onclick="writeReview('${list.b_hocode}', '${list.bcode }')">리뷰 등록</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        </c:forEach>
                    </div>
                    <div class="property-pagination">
                    <c:forEach begin="${pageDTO.startpage }" end="${pageDTO.endpage }" step="1" var="pageNum">
                    	<c:choose>
                    		<c:when test="${pageNum == pageDTO.page }">
		                        <a href="#" class="active">${pageNum }</a>
                    		</c:when>
                    		<c:otherwise>
		                        <a href="c_myBookingList?page=${pageNum }">${pageNum }</a>
                    		</c:otherwise>
                    	</c:choose>
                    </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </section>
<!-- bookingList End -->
<script>
	$(document).ready(function(){
		$("#home").removeClass('active');
		$("#hotel").removeClass('active');
		$("#help").addClass('active');
		checkDate();
	})
	/* 예약날짜를 현재시간과 비교하여 버튼 다르게 뜨게하기 */
	function checkDate(){
		<c:forEach var="list" items="${bookingList}">
		var bcode = "${list.bcode}";
		var checkin = new Date("${list.bcheckin}");
		var checkout = new Date("${list.bcheckout}");
		var nowDate = new Date();
		if(nowDate > checkin){	/* 예약날짜가 현재시간과 비교하여 과거일 경우 예약완료, 후기 버튼이 존재하도록 */
			$("#review" + bcode).removeAttr('style')
			$("#complete" + bcode).removeAttr('style')
		} else {	/* 예약날짜가 현재시간과 비교하여 미래일 경우 예약취소 버튼만 존재하도록 */
			$("#cancel" + bcode).removeAttr('style')
		}
		</c:forEach>
		<c:forEach var="vlist" items="${bcodeList}">
			if("${list.bcode == vlist}"){
				$("#review${vlist}").hide();
			}
		</c:forEach>
	}
	/* 예약 취소 */
	function cancelBooking(bcode){
		var loginId = '${sessionScope.MLoginId}';
		var mpw = '${bookingList[0].mpassword}';
		var inputPw = prompt('비밀번호를 입력하세요');
		console.log(mpw)
		console.log(inputPw)
		if(mpw == inputPw){	/* 비밀번호 확인 */
			$.ajax({
				type: 'post',
				url: 'deleteBooking',
				data: {
					'bcode' : bcode
				},
				dataType: 'text',
				success: function(data){
					if(data == 'OK'){
						$("#deldiv"+bcode).remove();
						alert('예매가 취소되었습니다.')
					}
				},
				error: function(){
					console.log('예매 취소 연결실패')
				}
			})

		} else {
			alert('비밀번호가 일치하지 않습니다.')
		}
		
	}
	/* 리뷰 작성 창 */
	function writeReview(hocode, bcode){
		window.name = "bookingList";
		var openWin = window.open("resources/writeReview.jsp?hocode="+hocode+"&loginId=${sessionScope.MLoginId}&v_bcode="+bcode, "reviewPop", "width=700, height=500, left=100, top=50");
		$("#review" + bcode).remove();
	}
	
	/* 탈퇴 */
	function delMember(mcode, mid) {
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
