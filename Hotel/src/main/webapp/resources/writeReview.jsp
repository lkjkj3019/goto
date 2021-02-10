<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Azenta Template">
    <meta name="keywords" content="Azenta, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>GOTO</title>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" integrity="sha512-bLT0Qm9VnAYZDflyKcBaQ2gg0hSYNQrJ8RilYldYQ1FxQYoCLtUjuuRuZo+fjqhx/qtq/1itJ0C2ejDxltZVFg==" crossorigin="anonymous"></script>
    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="css/themify-icons.css" type="text/css">
    <link rel="stylesheet" href="css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">
</head>
<body>
<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="breadcrumb-text">
					<h2>Review 작성</h2>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Breadcrumb Section End -->


<div class="row" style="padding: 20px">
	<div class="col-lg-10 offset-lg-1">
		<div class="leave-comment">
			<form action="/writeReview" method="post" id="reviewForm">
				<div class="row">
					<div class="col-lg-6">
						<input type="text" id="vwriter" name="vwriter" value="${param.loginId }" readonly="readonly">
					</div>
				</div>
				<input type="hidden" value="${param.v_bcode }" id="v_bcode" name="v_bcode">
				<textarea placeholder="Content" id="vcontent" name="vcontent" required="required"></textarea>
				<input type="hidden" value="${param.hocode }" id="hocode" name="hocode">
				<select id="vscore" name="vscore">
					<option value="">별점</option>
					<option>1</option>
					<option>2</option>
					<option>3</option>
					<option>4</option>
					<option>5</option>
				</select> &nbsp;
				<button type="button" class="site-btn" onclick="writeReview()">등록하기</button>
			</form>
		</div>
	</div>
</div>

    <!-- Js Plugins -->
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.magnific-popup.min.js"></script>
    <script src="js/jquery.nice-select.min.js"></script>
    <script src="js/jquery.slicknav.js"></script>
    <script src="js/jquery-ui.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/main.js"></script>
</body>
<script type="text/javascript">
	function writeReview(){
		var vwriter = $("#vwriter").val();
		var vcontent = $("#vcontent").val();
		var hocode = $("#hocode").val();
		var vscore = $("#vscore").val();
		var v_bcode = $("#v_bcode").val();
		$.ajax({
			url : '<c:url value='/writeReview' />',
			data : {
				"vwriter": vwriter,
				"vcontent": vcontent,
				"hocode": hocode,
				"vscore": vscore,
				"v_bcode" : v_bcode
				},
			success : function(data){									
				window.close();
			},
			error: function(){

			}
		});
	}
</script>
</html>
