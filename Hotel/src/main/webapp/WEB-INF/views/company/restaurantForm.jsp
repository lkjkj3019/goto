<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../includes/a_sidebar.jsp"%>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<div class="main">
	<section class="breadcrumb-section">
		<div class="row">
			<div class="col-lg-12">
				<div class="breadcrumb-text">
					<h2>맛집 등록</h2>
					<div class="breadcrumb-option">
						<span>RestaurantForm</span>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="contact-section">
		<div class="single-property-item" style="background-color: white;">
			<div class="row">
				<div class="col-lg-7" style="margin-left: auto; margin-right: auto;">
					<div class="row">
						<div class="col-lg-10 offset-lg-1">
							<div class="contact-text">
								<form action="JoinRestaurant" class="contact-form" method="post"
									enctype="multipart/form-data" id="insertId">
									<!-- 지역 카테고리 코드 선택 -->
									<div class="row">
										<div class="col-lg-4">
											<div class="section-title">
												<select name="ctname" id="ctname">
													<option value="none">지역 선택</option>
													<option value="서울">서울</option>
													<option value="경주">경주</option>
													<option value="부산">부산</option>
													<option value="여수">여수</option>
													<option value="제주도">제주도</option>
												</select>
											</div>
										</div>
										<div class="col-lg-4" style="display: none;" id="ctdivideDiv">
											<div class="section-title">
												<select name="ctdivide" id="ctdivide">
													<option value="none">지역 선택</option>
													<option value="동">동</option>
													<option value="서">서</option>
													<option value="남">남</option>
													<option value="북">북</option>
												</select>
											</div>
										</div>
										<div class="col-lg-4" style="display: none;" id="ctboroughDiv">
											<div class="section-title" id="optionId">
												<select name="ctborough" id="ctborough">
													<option value="none">지역 선택</option>
													<!-- <option value="은평구">은평구</option>
                                					<option value="서대문구">서대문구</option>
                                					<option value="종로구">종로구</option>
                                					<option value="중구">중구</option>
                                					<option value="용산구">용산구</option>
                                					<option value="마포구">마포구</option> -->
												</select>
											</div>
										</div>
									</div>
									<hr>

									<div class="ba-text">
										<label class="breadcrumb-text">식당 이름</label> <input
											type="text" id="rename" name="rename">
									</div>

									<div class="row">
										<div class="col-lg-6">
											<label class="breadcrumb-text">주소</label> <input type="text"
												id="sample6_postcode" name="readdr_postcode"
												placeholder="우편번호" required="required">
										</div>
										<div class="col-lg-6">
											<label class="breadcrumb-text">우편번호</label> <input
												class="btn" type="button"
												onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
										</div>
										<div class="col-lg-10">
											<input type="text" id="sample6_address" name="readdr_address"
												placeholder="주소">
										</div>
										<div class="col-lg-6">
											<input type="text" id="sample6_detailAddress"
												name="readdr_detailAddress" placeholder="상세주소">
										</div>
										<div class="col-lg-6">
											<input type="text" id="sample6_extraAddress"
												name="readdr_extraAddress" placeholder="참고항목">
										</div>
									</div>

									<div class="ba-text">
										<label class="breadcrumb-text">소개글</label>
										<textarea rows="8" class="card-body form-control"
											name="reintro" placeholder="식당 홍보 문구"></textarea>
									</div>

									<div class="form-row">
										<div class="form-group col-md-6">
											<label class="small mb-1">맛집 사진</label> <input type="file"
												class="form-control" id="rephoto" name="rephoto"><br>
										</div>
									</div>

									<hr>
									<div class="col-lg-12">
										<div class="loadmore">
											<button type="button" onclick="insertForm()"
												class="btn site-btn">등록하기</button>
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

</body>
<script>
	function GetSelectedItem(el) {
		var e = document.getElementById(el);
		var strSel = "The Value is: " + e.options[e.selectedIndex].value
				+ " and text is: " + e.options[e.selectedIndex].text;
		alert(strSel);
	}

	$(document).ready(function() {
		$("#rephoto").change(function() {
			var rephoto = $("#rephoto").val();
			console.log(rephoto);
		});
		$("#ctname").change(function() {
			$("#ctdivideDiv").removeAttr("style");
		})
		$("#ctdivide").change(function() {
			var ctname = $("#ctname").val();
			var ctdivide = $("#ctdivide").val();
			/* 도시 선택하면 세부 지역 select */
			$.ajax({
				type : "post",
				url : "getCtborough",
				data : {
					"ctname" : ctname,
					"ctdivide" : ctdivide
				},
				dataType : "json",
				success : function(result) {
					console.log(result);
					showCtborough(result);
				},
				error : function() {
					alert("연결 실패.");
				}
			})
		})
	});

	/* 세부 지역 option 생성 */
	function showCtborough(result) {
		$("#ctboroughDiv").removeAttr("style");
		$("#ctborough").empty();
		$("#optionId .list").empty();
		var output = '<li data-value="none" class="option selected">지역 선택</li>';
		var option = "<option value='none'>지역 선택</option>";
		for ( var list in result) {
			option += "<option value='"+result[list]+"'>" + result[list]
					+ "</option>";
			output += '<li data-value="'+result[list]+'" class="option selected focus">'
					+ result[list] + '</li>'
		}
		$("#ctborough").append(option);
		$("#optionId .list").append(output);
	}

	function insertForm() {
		var ctname = $("#ctname").val();
		var ctdivide = $("#ctdivide").val();
		var ctborough = $("#ctborough").val();
		if (ctname == "" || ctdivide == "" || ctborough == "") {
			alert('지역을 선택해주세요');
			return;
		}
		var rename = $("#rename").val();
		var sample6_postcode = $("#sample6_postcode").val();
		var reintro = $("#reintro").val();
		var rephoto = $("#rephoto").val();
		if (rename == "" || sample6_postcode == "" || reintro == ""
				|| rephoto == "") {
			alert('작성을 완료해주세요');
			return;
		}
		alert('작성이 완료되었습니다.')
		insertId.submit();

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
<script src="resources/js/findLocation.js"></script>

</html>