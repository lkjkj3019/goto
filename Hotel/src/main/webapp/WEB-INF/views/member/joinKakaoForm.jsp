<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="Azenta Template">
<meta name="keywords" content="Azenta, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>GOTO</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"
	integrity="sha512-bLT0Qm9VnAYZDflyKcBaQ2gg0hSYNQrJ8RilYldYQ1FxQYoCLtUjuuRuZo+fjqhx/qtq/1itJ0C2ejDxltZVFg=="
	crossorigin="anonymous"></script>
<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="resources/css/bootstrap.min.css"
	type="text/css">
<link rel="stylesheet" href="resources/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet" href="resources/css/elegant-icons.css"
	type="text/css">
<link rel="stylesheet" href="resources/css/themify-icons.css"
	type="text/css">
<link rel="stylesheet" href="resources/css/nice-select.css"
	type="text/css">
<link rel="stylesheet" href="resources/css/jquery-ui.min.css"
	type="text/css">
<link rel="stylesheet" href="resources/css/owl.carousel.min.css"
	type="text/css">
<link rel="stylesheet" href="resources/css/magnific-popup.css"
	type="text/css">
<link rel="stylesheet" href="resources/css/slicknav.min.css"
	type="text/css">
<link rel="stylesheet" href="resources/css/style.css" type="text/css">
<link rel="stylesheet" href="resources/css/div-input.css"
	type="text/css">
<style>
.accordion_one .panel-group {
	margin-bottom: 0;
	border: 1px solid #f1f1f1;
	margin-left: 1px
}

.accordion_one .panel {
	background-color: transparent;
	box-shadow: none;
	border-bottom: 0px solid transparent;
	border-radius: 0;
	margin: 0
}

.accordion_one .panel-default {
	border: 0
}

.accordion_one .panel-default>.panel-heading {
	border-radius: 0px
}

.panel-title {
	margin-top: 0;
	margin-bottom: 0;
	font-size: 16px;
	color: inherit
}

h4 {
	font-size: 18px;
	line-height: 24px
}

.accordion_one .panel .panel-heading a.collapsed {
	color: #999999;
	display: block;
	padding: 12px 30px;
	border-top: 0px
}

.accordion_one .panel .panel-heading a {
	display: block;
	padding: 12px 30px;
	background: #fff;
	color: #313131;
	border-bottom: 1px solid #f1f1f1
}

.accordion-wrap .panel .panel-heading a {
	font-size: 14px
}

.accordion_one .panel-group .panel-heading+.panel-collapse>.panel-body {
	border-top: 0;
	padding-top: 0;
	padding: 25px 30px 30px 35px;
	background: #fff;
	color: #999999
}

.img-accordion {
	width: 81px;
	float: left;
	margin-right: 15px;
	display: block
}

.accordion_one .panel .panel-heading a:after {
	content: "\2212"
}

.accordion_one .panel .panel-heading a:after, .accordion_one .panel .panel-heading a.collapsed:after
	{
	font-family: 'FontAwesome';
	font-size: 15px;
	width: 36px;
	height: 48px;
	line-height: 48px;
	text-align: center;
	background: #F1F1F1;
	float: left;
	margin-left: -31px;
	margin-top: -12px;
	margin-right: 15px
}

a:link {
	text-decoration: none
}

.btn-none {
	background-color: transparent;
	border: 0;
	text-align: left;
	padding-left: 0;
	width: 100%;
}
</style>
</head>
<body>
	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb-text">
						<h2>KakaoJoin</h2>
						<div class="breadcrumb-option">
							<a href="index"><i class="fa fa-home"></i> Home</a> <span>카카오톡
								회원가입</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section Begin -->
	<section class="property-section spad" style="padding-top: 30px;">
		<div class="col-lg-9">
			<h4 class="property-title">회원가입 정보</h4>
			<div class="property-list">
				<div class="single-property-item">
					<div class="row">
						<div class="col-lg-10 accordion_one">
							<div class="panel-group" id="accordion_oneRight">

								<form action="memberModify" method="post" id="myInfo">
									<table class="table-width">
										<tr>
											<td>이름</td>
											<td><input type="text" class="input-table"
												value="${memberDTO.mname }" id="mname" name="mname"></td>
										</tr>
										<tr>
											<td>아이디</td>
											<td><input type="text" class="input-table"
												value="${memberDTO.mid }" id="mid" name="mid" readonly="readonly"></td>
										</tr>
										<tr>
											<td>비밀번호</td>
											<td><input type="text" class="input-table" id="mpassword"
											 name="mpassword"></td>
										</tr>
										<tr>
											<td>전화번호</td>
											<td><input type="text" class="input-table" id="mphone"
												name="mphone"></td>
										</tr>
										<tr>
											<td>생일</td>
											<td><input type="date" class="input-table" id="mbirth"
												name="mbirth"></td>
										</tr>
										<tr>
											<td>이메일</td>
											<td><input type="text" class="input-table"
												value="${memberDTO.memail }" id="memail" name="memail"
												readonly="readonly"></td>
										</tr>
										<tr>
											<td colspan="2"><input type="button"
												class="input-table-btn btn" id="modify-1" value="가입하기"
												onclick="kakaoJoin()"> <input type="button" onclick="cancelJoin()"
												class="input-table-btn btn" id="reset" value="취소"></td>
										</tr>
									</table>
								</form>
							</div>
						</div>
					</div>
				</div>
	</section>
	<!-- Property Section End -->
	<!-- Js Plugins -->
	<script src="resources/js/jquery-3.3.1.min.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/jquery.magnific-popup.min.js"></script>
	<script src="resources/js/jquery.nice-select.min.js"></script>
	<script src="resources/js/jquery.slicknav.js"></script>
	<script src="resources/js/jquery-ui.min.js"></script>
	<script src="resources/js/owl.carousel.min.js"></script>
	<script src="resources/js/main.js"></script>
</body>
<script type="text/javascript">
	function kakaoJoin() {
		var mname = $("#mname").val();
		var mid = $("#mid").val();
		var mpassword = $("#mpassword").val();
		var mphone = $("#mphone").val();
		var mbirth = $("#mbirth").val();
		var memail = $("#memail").val();
		/* 카카오 아이디로 회원가입 */
		$.ajax({
			url : 'kakaoJoin',
			data : {
				"mname" : mname,
				"mid" : mid,
				"mpassword" : mpassword,
				"mphone" : mphone,
				"memail" : memail,
				"mbirth" : mbirth
			},
			success : function(data) {
				$(opener.location).attr("href", "javascript:gotoMain();")
				window.close();
			},
			error : function() {

			}
		});
	}
	function cancelJoin(){
		window.close();
		}
</script>
</html>