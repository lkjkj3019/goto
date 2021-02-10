<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../includes/header.jsp"%>

   <!-- Property Details Hero Section Begin -->

    <!-- Property Details Section Begin -->
    <section class="property-details-section spad">
	<div class="container pd-hero-section" style="text-align: center;">
		<div class="row pd-details-text">
			<div class="col-lg-6 property-contactus margin_center">
				<h4 class="table-in">관리자 로그인</h4>
				<form action="AdminLogin" class="agent-contact-form section-title" id="adminLogin" method="post">
					<input type="text" name="cmid" id="cmid" placeholder="아이디"> <input type="text" name="cmpassword" id="cmpassword" placeholder="비밀번호">
					<button type="button" onclick="ALoginBtn()" class="site-btn btn">로그인</button>
				</form>
			</div>
		</div>
	</div>
</section>
     <script type="text/javascript">
  function ALoginBtn(){
 	var cmid = $("#cmid").val();
	var cmpassword = $("#cmpassword").val();
	var DBcmid = '${sessionScope.ALoginId}';
	console.log(cmid+":::"+cmpassword+":::"+DBcmid);
	
	if(cmid==''){
		alert("아이디를 입력해야 합니다.");
		$("#cmid").focus();
		return;
	}
	if(cmpassword==''){
		alert("비밀번호를 입력해야 합니다.");
		$("#cmpassword").focus();
		return;
	}
	adminLogin.submit();
	};
	$(document).ready(function(){
		var loginResult = "${loginResult}";
		if(loginResult == "NO") alert('아이디 비밀번호가 일치하지 않습니다.');
		if(loginResult == "WAIT") alert('아직 승인되지 않은 아이디입니다.');
		if(loginResult == "DECLINE") alert('승인 거절된 아이디 입니다.');
		})
    </script>
    

<%@ include file="../includes/footer.jsp"%>
