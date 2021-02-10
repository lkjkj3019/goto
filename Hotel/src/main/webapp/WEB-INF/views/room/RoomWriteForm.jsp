<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/a_sidebar.jsp"%>
<!-- main 시작 -->
<!-- main top 시작-->
<div class="main">
	<section class="breadcrumb-section">
		<div class="row">
			<div class="col-lg-12">
				<div class="breadcrumb-text">
					<h2>룸 등록</h2>
					<div class="breadcrumb-option">
						<span>RoomWriteForm</span>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- main top 끝 -->

	<!-- main container 시작 -->
	<section class="contact-section">
		<div class="single-property-item" style="background-color: white;">
			<div class="row">
				<div class="col-lg-7" style="margin-left: auto; margin-right: auto;">
					<div class="row">
						<div class="col-lg-10 offset-lg-1">
							<div class="contact-text">
								<form action="RoomWrite" class="contact-form" method="post"
									enctype="multipart/form-data" id="roomForm">
									<select name="ro_hocode" id="ro_hocode">
										<option value="">호텔선택</option>
										<c:forEach var="list" items="${hotelList }">
											<option value="${list.hocode }">${list.honame }</option>
										</c:forEach>
									</select><br> <br>
									<hr>
									<!-- 룸 이름 -->
									<div class="ba-text">
										<label class="breadcrumb-text">룸 이름</label> <input type="text"
											name="roname" id="roname">
									</div>

									<!-- 룸사진 -->
									<div class="ba-text">
											<label class="breadcrumb-text">룸 사진</label> <input type="file"
												name="rophoto" name="rophoto" id="rophoto"><br>
									</div>

									<!-- 룸상세정보 -->
									<div class="ba-text">
										<label class="breadcrumb-text">룸 상세정보</label> <input
											type="text" name="rodetail"
											id="rodetail">
									</div>

									<!-- 룸최소인원 -->
									<div class="ba-text">
										<label class="breadcrumb-text">룸 최소인원</label> <input
											type="number" name="rominper" id="rominper">
									</div>

									<!-- 룸최대인원 -->
									<div class="ba-text">
										<label class="breadcrumb-text">룸 최대인원</label> <input
											type="number" name="romaxper" id="romaxper">
									</div>

									<!-- 룸가격 -->
									<div class="ba-text">
										<label class="breadcrumb-text">룸 가격</label> <input type="text"
											name="roprice" id="roprice">
									</div>

									<!-- 방갯수 -->
									<div class="ba-text">
										<label class="breadcrumb-text">룸 갯수</label> <input
											type="number" name="ronum" id="ronum">
									</div>

									<!-- 등록 버튼 -->
									<hr>
									<div class="col-lg-12">
										<div class="loadmore">
											<button type="button" onclick="roomFormSubmit()"
												class="btn site-btn">등록</button>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- main container 끝 -->
</div>
<!-- main 끝 -->


<script type="text/javascript">
	$(document).ready(function() {
		$("#rophoto").change(function() {
			var rophoto = $("#rophoto").val();
			console.log(rophoto);

		});
	});
	function roomFormSubmit() {
		var ro_hocode = $("#ro_hocode").val();
		var roname = $("#roname").val();
		var rophoto = $("#rophoto").val();
		var rominper = $("#rominper").val();
		var romaxper = $("#romaxper").val();
		var roprice = $("#roprice").val();
		var ronum = $("#ronum").val();
		if (ro_hocode == "" || roname == "" || rophoto == "" || rominper == ""
				|| romaxper == "" || roprice == "" || ronum == "") {
			alert('작성을 완료해주세요');
			return;
		}
		alert('등록되었습니다.');
		roomForm.submit();
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