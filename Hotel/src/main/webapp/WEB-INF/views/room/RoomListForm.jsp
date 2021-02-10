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
					<h2>룸 관리</h2>
					<div class="breadcrumb-option">
						<span>RoomListForm</span>
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
						<form action="RoomList" method="get">
									<div class="card shadow">
										<div class="card-body">
											<div class="table-responsive">
												<table class="table table-bordered" cellspacing="0">
													<thead>
														<tr>
															<td>업체코드</td>
															<td>룸코드</td>
															<td>호텔이름</td>
															<td>룸이름</td>
															<td>방갯수</td>
															<td>삭제</td>
														</tr>

													</thead>
													<tbody>
												<c:choose>
													<c:when test="${sessionScope.ALoginId=='AACM' }">
														<c:forEach var="rList" items="${RoomList }">

																<tr>
																	<td>${rList.ro_hocode }</td>
																	<td>${rList.rocode }</td>
																	<td>${rList.honame }</td>
																	<td><a href="a_roomDetail?rocode=${rList.rocode }" style="color: black; text-decoration: underline;">${rList.roname }<a></a></td>
																	<td>${rList.ronum }</td>
																	<td><button type="button" class="site-btn btn"
																			onclick="roomListDel('${rList.rocode}')">삭제</button></td>
																</tr>
														</c:forEach>
													</c:when>
												</c:choose>
											</tbody>
												</table>
											</div>
										</div>
									</div>
						</form>
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

<script>
	function roomListDel(rocode){
		var inputPw = prompt('비밀번호를 입력해주세요');
		var loginPw = '${loginPw}';
		if(inputPw == loginPw){
			alert('삭제되었습니다.');
			location.href='RoomListDel?rocode='+rocode;
			}
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
