<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../includes/header.jsp"%>
<style>
.ba-text, #memailDomain{
margin: 10px 0 0;
}
</style>
<body>
	<section class="contact-section">
		<div class="col-lg-6" style="margin-left: auto; margin-right: auto;">
			<div class="row">
				<div class="col-lg-10 offset-lg-1">
					<div class="contact-text">
						<div class="section-title">
							<span>member</span>
							<h2>회원가입</h2>
						</div>
						<form action="joinMember" class="contact-form" method="post" id="joinForm">
							<div class="ba-text">
								<span>이름</span> <input type="text" id="inputMname" name="mname" placeholder="이름입력">
							</div>
							<div class="ba-text">
								아이디 <span id="idCheckMsg"></span><input type="text" id="inputMid" name="mid" placeholder="아이디 입력">
							</div>
							<div class="row">
								<div class="col-lg-6">
									<span>비밀번호</span> <input type="text" id="inputMpassword" name="mpassword" placeholder="비밀번호 입력">
								</div>
								<div class="col-lg-6">
									<span>비밀번호 확인</span> <span id="pwConfirmMsg"></span> <input type="text" class="form-control" id="checkPw" placeholder="비밀번호확인">
								</div>
							</div>
							<div class="ba-text">
								<span>전화번호</span> <input type="text" id="inputMphone" name="mphone"
									placeholder="전화번호 입력">
							</div>
							<div class="ba-text">
								<span>생년월일</span> <input type="date" id="inputMbirth" name="mbirth">
							</div>
							<div class="row">
								<div class="col-lg-5">
									<span>이메일</span> <input type="text" placeholder="이메일 입력" id="inputMemailId" name="memailid">
								</div>
								<div style="margin: auto;">
									<h2 style=" color: #aaaab3;">@</h2>
								</div>
								<div class="col-lg-4" style="margin: auto;">
									<input type="text" id="memailDomain" name="memaildomain" style="margin: 10px 0 0;">
								</div>
								<div class="col-lg-2" style="margin: auto;">
									<select id="domainSel" class="nice-select">
										<option value="">직접입력</option>
										<option value="naver.com">naver.com</option>
										<option value="gmail.com">gmail.com</option>
										<option value="daum.net">daum.net</option>
									</select>
								</div>
							</div>
								<hr>
								<div class="col-lg-12">
									<div class="loadmore">
										<button type="button" onclick="memberJoin()" class="btn site-btn">가입완료</button>
									</div>
								</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>


	<script type="text/javascript">
		$(document).ready(
				function() {

					$("#domainSel").change(function() {
						var domain = $("#domainSel").val();
						$("#memailDomain").val(domain);
					});

					/* 비밀번호 확인 */
					$("#checkPw").keyup(
							function() {
								var checkPw = $("#checkPw").val();
								var mpassword = $("#inputMpassword").val();

								if (mpassword == '') {
									alert("비밀번호가 입력되지 않았습니다.");
									$("#checkPw").val("");
									$("#inputMpassword").focus();
									return;
								}

								if (checkPw == mpassword) {
									$("#pwConfirmMsg").css("color", "green")
											.text("비밀번호 일치");
								} else {
									$("#pwConfirmMsg").css("color", "red")
											.text("비밀번호 불일치");
								}
							});

					/* 아이디 중복 확인 */
					$("#inputMid").keyup(
							function() {
								var inputMid = $("#inputMid").val();
								$.ajax({
									type : "post",
									url : "idCheck",
									data : {
										"inputMid" : inputMid
									},
									dataType : "text",
									success : function(result) {
										console.log("result:" + result);
										if (result == "OK") {
											$("#idCheckMsg").css("color",
													"green").text("사용가능한 아이디");
										} else {
											$("#idCheckMsg")
													.css("color", "red").text(
															"사용 불가능한 아이디");
										}
									},
									error : function() {
										alert("idCheck 연결실패");
									}
								});
							});
				});

		function memberJoin(){
			alert('회원가입 되었습니다.');
			joinForm.submit();
			}
	</script>
</body>
<%@ include file="../includes/footer.jsp"%>