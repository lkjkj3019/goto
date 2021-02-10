<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../includes/header.jsp"%>


<section class="property-details-section spad">
	<div class="container pd-hero-section" style="text-align: center;">
		<div class="row pd-details-text">
			<div class="col-lg-6 property-contactus margin_center">
				<h4 class="table-in">아이디 찾기</h4>
					<form action="#" class="agent-contact-form section-title">
						<input type="text" id="findName" placeholder="찾는 이름"><br> 
						<input type="text" id="findNumber" placeholder="찾는 전화번호">
						<button onclick="findLogin()" class="site-btn btn">찾기</button>
					</form>
				</div>
			</div>
		</div>
</section>


<script type="text/javascript">
	function findLogin() {
		var findname = $("#findName").val();
		var findnumber = $("#findNumber").val();

		console.log("이름 : " + findname);
		console.log("비밀번호 : " + findnumber);
		/* 아이디 찾기 */
		$.ajax({
			type : "post",
			url : "findLogin",
			data : {
				"findname" : findname,
				"findnumber" : findnumber
			},
			async : false,
			dataType : "text",
			success : function(result) {
				alert(result);
				location.href = "MemberLoginForm.jsp";
			},
			error : function() {
				alert(" 연결 실패 ");
			}
		});
	}
</script>

<%@ include file="../includes/footer.jsp"%>