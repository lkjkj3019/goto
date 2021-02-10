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
					<h2>업체 가입 승인</h2>
					<div class="breadcrumb-option">
						<span>ApproveJoin</span>
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
												<th>업체 아이디</th>
												<th>업체 이름</th>
												<th>업체 번호</th>
												<th>업체 주소</th>
												<th>업체이메일</th>
												<th>승인</th>
												<th>거절</th>
											</tr>
										</thead>
										<tbody>
											<c:choose>
												<c:when test="${sessionScope.ALoginId=='ADMIN' }">
													<c:forEach var="list" items="${companyList }">
														<tr id="com${list.cmcode }">
															<td>${list.cmid }</td>
															<td>${list.cmname }</td>
															<td>${list.cmphone }</td>
															<td>${list.cmaddress }</td>
															<td>${list.cmemail }</td>
															<td><button class="site-btn btn" onclick="comApprove('${list.cmcode}')">승인</button></td>
															<td><button class="site-btn btn" onclick="comDecline('${list.cmcode}')">거절</button></td>
														</tr>
													</c:forEach>
												</c:when>
											</c:choose>
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
<!-- main 끝 -->

<script type="text/javascript">
	$(document).ready(function() {
		$("#a_approveJoin").addClass("sideActive");
	})
	/* 업체 승인 버튼을 누를 경우 */
	function comApprove(cmcode) {
		$.ajax({
			type : 'post',
			url : 'comApprove',
			data : {
				'cmcode' : cmcode,
			},
			dataType : 'text',
			success : function(result) {
				if (result == 'OK') {
					alert('승인되었습니다.')
					$("#com" + cmcode).remove();
				}
			},
			error : function() {
				console.log('approve 연결 실패')
			}
		})
	}

	/* 업체 거절 버튼을 누를 경우 */
	function comDecline(cmcode) {
		$.ajax({
			type : 'post',
			url : 'comDecline',
			data : {
				'cmcode' : cmcode,
			},
			dataType : 'text',
			success : function(result) {
				if (result == 'OK') {
					alert('거절되었습니다.')
					$("#com" + cmcode).remove();
				}
			},
			error : function() {
				console.log('decline 연결 실패')
			}
		})
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