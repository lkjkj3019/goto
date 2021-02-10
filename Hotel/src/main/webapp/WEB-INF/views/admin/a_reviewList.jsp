<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../includes/a_sidebar.jsp"%>
<!-- main 시작 -->
<!-- main top 시작-->
<div class="main">
	<section class="breadcrumb-section">
		<div class="row">
			<div class="col-lg-12">
				<div class="breadcrumb-text">
					<h2>고객 후기 관리</h2>
					<div class="breadcrumb-option">
						<span>RivewList</span>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- main top 끝 -->

	<!-- main container 시작 -->
	<section class="property-section spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="property-list">
						<div class="card shadow">
							<div class="card-body">
								<div class="table-responsive">
									<table class="table table-bordered" cellspacing="0">
										<thead>
											<tr>
												<th>코드</th>
												<th>호텔 이름</th>
												<th>작성자 아이디</th>
												<th>작성일자</th>
												<th>삭제</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="rList" items="${reviewList }">
												<tr>
													<td>${rList.vcode }</td>
													<td>${rList.honame }</td>
													<td>${rList.vwriter }</td>
													<td>${rList.vdrawup }</td>
													<td><button class="site-btn btn" onclick="reviewDelete('${rList.vcode }')">삭제</button></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- main container 끝 -->
</div>
</div>
<!-- main 끝 -->

</body>
<script type="text/javascript">
	function reviewDelete(vcode){
		alert('삭제되었습니다.');
		location.href="reviewDel?vcode="+vcode;
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