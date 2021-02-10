<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="Azenta Template">
<meta name="keywords" content="Azenta, unica, creative, jsp">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Azenta | Template</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" integrity="sha512-bLT0Qm9VnAYZDflyKcBaQ2gg0hSYNQrJ8RilYldYQ1FxQYoCLtUjuuRuZo+fjqhx/qtq/1itJ0C2ejDxltZVFg==" crossorigin="anonymous"></script>
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
<link rel="stylesheet" href="resources/css/div-input.css" type="text/css">
</head>

<body>
	<!-- Header Section Begin -->
	<header class="header-section">
		<div class="top-nav" style="background-color: white;">
			<div class="container">
				<div class="row">
					<div class="col-lg-7">
						<nav class="main-menu">
							<ul>
								<li><a href="/"><img src="resources/img/logo.png" alt="홈페이지 로고" width="150px"></a>
								<li>
								<li><a id="home" href="/">Home</a></li>
								<li><a id="hotel" href="c_HotelList">Hotel</a></li>
								<li><a id="help" href="c_FAQList">Help</a></li>
							</ul>
						</nav>
					</div>
					<div class="col-lg-5">
						<div class="top-right" style="margin: 25px 0;">
							<!-- 로그인이 되면 보여줄 메뉴 -->
							<c:choose>
								<c:when test="${sessionScope.MLoginId eq null }">
									<a href="joinSelect" class="property-sub btn">회원가입</a>
									<a href="MemberLoginForm" class="property-sub btn">회원 로그인</a>
									<a href="AdminLoginForm" class="property-sub btn">업체 로그인</a>
								</c:when>
								<c:otherwise>
									<a href="Logout" onclick="LogOut()" class="property-sub btn">로그아웃</a>
									<a href="c_mypage?mid=${sessionScope.MLoginId }"
										class="property-sub btn">마이페이지</a>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>
	<script type="text/javascript">
		function LogOut() {
			alert("로그아웃 되었습니다!");
		}
	</script>
