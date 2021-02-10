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
					<h2>회원 관리</h2>
					<div class="breadcrumb-option">
						<span>MemberList</span>
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
												<th>이름</th>
												<th>아이디</th>
												<th>이메일</th>
												<th>탈퇴</th>
											</tr>
										</thead>
										<tbody>
											<c:choose>
												<c:when test="${sessionScope.ALoginId=='ADMIN' }">
													<c:forEach var="list" items="${memberList }">
														<tr id="mem${list.mcode }">
															<td>${list.mcode }</td>
															<td>${list.mname }</td>
															<td>${list.mid }</td>
															<td>${list.memail }</td>
															<td><button class="site-btn btn" onclick="memberDelete('${list.mcode}', '${list.mid }')">탈퇴</button></td>
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
</div>
<!-- main 끝 -->
</body>
<script type="text/javascript">
	$(document).ready(function() {
		$("#a_memberList").addClass("sideActive");
	})
	/* member 탈퇴 */
	function memberDelete(mcode, mid) {
		var inputPw = prompt('비밀번호를 입력해주세요');
		var loginPw = '${loginPw}';
		if(inputPw == loginPw){
		$.ajax({
			type : 'post',
			url : 'a_memberDelete',
			data : {
				'mcode' : mcode,
				'mid' : mid
			},
			dataType : 'text',
			success : function(result) {
				console.log(result);
				if (result == 'OK') {
					$("#mem" + mcode).remove();
					alert('탈퇴되었습니다.')
				}
			},
			error : function() {
				console.log('member 삭제 연결 실패')
			}
		})

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