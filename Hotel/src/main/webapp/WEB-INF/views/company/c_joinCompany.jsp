<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../includes/header.jsp"%>
<style>
.ba-text, #cmemailDomain{
margin: 10px 0 0;
}
</style>
<!-- 주소 -->
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="resources/js/findLocation.js"></script>

<!-- Contact Section Begin -->
<section class="contact-section">
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-6" style="margin-left: auto; margin-right: auto;">
				<div class="row">
					<div class="col-lg-10 offset-lg-1">
						<div class="contact-text">
							<div class="section-title">
								<span>company</span>
								<h2>회원가입</h2>
							</div>
							<form action="companyJoin" class="contact-form" method="post" id="joinForm">
								<!-- 아이디 -->
								<div class="ba-text">
									<span>아이디<span
										id="cmidCheck"></span></span> <input type="text" placeholder="아이디 입력"
										id="cmid" name="cmid">
								</div>

								<!-- 비밀번호 -->
								<div class="row">
									<div class="col-lg-6">
										<span>비밀번호<span
											id="cmpasswordCheck"></span></span><input type="password"
											placeholder="비밀번호 입력" id="cmpassword" name="cmpassword">
									</div>
									<!-- 비밀번호 재입력 -->
									<div class="col-lg-6">
										<span>비밀번호 재입력<span
											id="cmpasswordConFirm"></span></span> <input type="password"
											placeholder="비밀번호 확인" id="checkPw">
									</div>
								</div>

								<!-- 이름 -->
								<div class="ba-text">
									<span>이름</span> <input
										type="text" placeholder="이름 입력" id="cmname" name="cmname">
								</div>

								<!-- 전화번호 -->
								<div class="ba-text">
									<span>전화번호</span> <input
										type="text" placeholder="전화번호 입력" id="cmphone" name="cmphone">
								</div>

								<!-- 이메일 -->
								<div class="row">
									<div class="col-lg-5" style="margin: auto;">
										<span>이메일</span> <input type="text" placeholder="이메일 입력" id="cmemail"
											name="cmmailid">
									</div>
									<div style="margin: auto;">
										<h2 style="color: #aaaab3;">@</h2>
									</div>
									<div class="col-lg-4" style="margin: auto;">
										<input type="text" id="cmemailDomain" name="cmdomain">
									</div>
									<div class="col-lg-2" style="margin: auto;">
										<select id="cmemailSel" class="nice-select">
											<option value="">직접입력</option>
											<option value="naver.com">naver.com</option>
											<option value="gmail.com">gmail.com</option>
											<option value="daum.net">daum.net</option>
										</select>
									</div>
								</div>
								<hr>
								<!-- 주소 -->
								<div class="row">
									<div class="col-lg-6">
										<label class="breadcrumb-text">주소</label> <input type="text"
											id="sample6_postcode" name="cmpost" placeholder="우편번호">
									</div>
									<div class="col-lg-6">
										<label class="breadcrumb-text">우편번호</label> <input class="btn"
											type="button" onclick="sample6_execDaumPostcode()"
											value="우편번호 찾기">
									</div>
									<div class="col-lg-10">
										<input type="text" id="sample6_address" name="cmaddr"
											placeholder="주소">
									</div>
									<div class="col-lg-6">
										<input type="text" id="sample6_detailAddress" name="cmdetail"
											placeholder="상세주소">
									</div>
									<div class="col-lg-6">
										<input type="text" id="sample6_extraAddress" name="cmexaddr"
											placeholder="참고항목">
									</div>
								</div>

								<!-- 회원가입 버튼 -->
								<hr>
								<div class="col-lg-12">
									<div class="loadmore">
										<button type="button" onclick="companyJoin()" class="btn site-btn">가입완료</button>
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
<!-- Contact Section End -->


<script type="text/javascript">
	$(document).ready(
			function() {

				/* 이메일(도메인) 선택을 누르면 입려창에 들어가지게하는 */
				$("#cmemailSel").change(function() {
					var cmemailSel = $("#cmemailSel").val();
					$("#cmemailDomain").val(cmemailSel);
				});

				/* 비밀번호 확인 */
				$("#checkPw").keyup(
						function() {
							var checkPw = $("#checkPw").val();
							var cmpassword = $("#cmpassword").val();

							if (cmpassword == '') {
								alert("비밀번호가 입력되지 않았습니다.");
								$("#checkPw").val("");
								$("#cmpassword").focus();
								return;
							}

							if (checkPw == cmpassword) {
								/* 일치 */
								$("#cmpasswordConFirm").css("color", "green")
										.text(" 비밀번호 일치함");
							} else {
								/* 불일치 */
								$("#cmpasswordConFirm").css("color", "red")
										.text(" 비밀번호 불일치함");
							}
						});

				/* 아이디 사용가능 여부 확인 */
				$("#cmid").keyup(
						function() {
							var cmid = $("#cmid").val();
							console.log("cmid::" + cmid);
							$.ajax({
								type : "post",
								url : "cmidCheck",
								data : {
									"cmid" : cmid
								},
								dataType : "text",
								success : function(result) {
									console.log("result : " + result);
									if (result == "OK") {
										$("#cmidCheck").css("color", "green")
												.text(" 사용가능함");
									} else {
										$("#cmidCheck").css("color", "red")
												.text(" 사용불가능함");
									}
								},
								error : function() {
									alert("cmidCheck 연결실패.");
								}
							});
						});

			});
	function companyJoin(){
		alert('회원가입 되었습니다. 승인을 기다려주세요');
		joinForm.submit();
		}
</script>



<%@ include file="../includes/footer.jsp"%>