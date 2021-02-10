<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>

<style>
.pd-hero-text {
	padding: 20px 0 20px;
}

#hotel {
	color: #2CBDB8;
}
</style>
<!-- Property Details Hero Section Begin -->
<section class="pd-hero-section set-bg"
	data-setbg="resources/img/properties/product-content-bg.jpg"
	style="background-image: url(&quot;img/properties/product-content-bg.jpg&quot;); height: 300px; margin: auto; padding: 80px">
	<div class="container">
		<div class="row">
			<div class="col-lg-8 offset-lg-2">
				<div class="pd-hero-text">
					<p class="room-location">
						<i class="icon_pin"></i> ${hotelDTO.hoaddr }
					</p>
					<h2>${hotelDTO.honame }</h2>
					<p style="font-size: 20px; color: white;">${roomDTO.roname }</p>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Property Details Hero Section Begin -->

<!-- Property Details Section Begin -->
<section class="property-section spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-3">
				<div class="property-sidebar">
					<h4>Reservation</h4>
					<form class="sidebar-search">
						<div class="first-row">
							<div id="ctnameDiv">
								<p>체크인</p>
								<input type="date" id="checkin" class="div-Date" name="bcheckin">
								<p>체크아웃</p>
								<input type="date" id="checkout" class="div-Date"
									name="bcheckout">
							</div>
						</div>
						<div id="bpriceDiv">
							<c:if test="${sessionScope.MLoginId != null }">
								<button type="button" onclick="BookingBtn()" class="search-btn btn"
									style="margin: 5px 0;">예약</button>
								<button type="reset" class="search-btn btn" style="margin: 15px 0;">다시작성</button>
							</c:if>
							<button type="button"
								onclick="location.href='restaurantList?re_ctcode=${hotelDTO.ho_ctcode}'"
								class="search-btn btn" style="margin: 5px 0;">주변 맛집</button>
							<button type="button"
								onclick="location.href='landmarkList?la_ctcode=${hotelDTO.ho_ctcode}'"
								class="search-btn btn" style="margin: 5px 0;">주변 관광지</button>
						</div>
					</form>
				</div>
			</div>

			<div class="col-lg-9">
				<div class="pd-details-text">
					<div class="property-more-pic">
						<div class="product-pic-zoom">
							<img name="rofilename" class="product-big-img"
								src="resources/img/roomFile/${roomDTO.rofilename }" alt=""
								width="100px" height="500px">
						</div>
					</div>
					<div class="pd-details-text">
						<div class="pd-details-tab">
							<div class="tab-item">
								<ul class="nav" role="tablist">
									<li><a class="active" data-toggle="tab" href="#tab-1"
										role="tab">룸 정보</a></li>
								</ul>
							</div>
							<div class="tab-item-content">
								<div class="tab-content">
									<div class="tab-pane fade-in active" id="tab-1" role="tabpanel">
										<div class="property-more-table">
											<table class="table">
												<tbody>
													<tr>
														<td class="pt-name">이름</td>
														<td class="p-value">${roomDTO.roname }</td>
													</tr>
													<tr>
														<td class="pt-name">최소 인원 수</td>
														<td class="p-value">${roomDTO.rominper }명</td>
													</tr>
													<tr>
														<td class="pt-name">최대 인원 수</td>
														<td class="p-value">${roomDTO.romaxper }명</td>
													</tr>
													<tr>
														<td class="pt-name">가격</td>
														<td class="p-value">${roomDTO.roprice }원</td>
													</tr>
													<tr>
														<td class="pt-name">세부사항</td>
														<td class="p-value">${roomDTO.rodetail }</td>
													</tr>
													<tr>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Property Details Section End -->
<script>
	function BookingBtn() {

		var rocode = "${roomDTO.rocode }";
		var checkin = $("#checkin").val();
		var checkout = $("#checkout").val();
		if (checkin == "") {
			alert('체크인 날짜를 입력해주세요');
			return;
		}
		if (checkin == "") {
			alert('체크아웃 날짜를 입력해주세요');
			return;
		}
		location.href = "bookingCheckForm?b_rocode=" + rocode + "&bcheckin="
				+ checkin + "&bcheckout=" + checkout;

	}
</script>

<%@ include file="../includes/footer.jsp"%>