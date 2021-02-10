<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/a_sidebar.jsp"%>
<!-- main 시작 -->
<!-- main top 시작-->
<div class="main">
	<section class="breadcrumb-section">
		<div class="row">
			<div class="col-lg-12">
				<div class="breadcrumb-text">
					<h2>업체 정보 수정</h2>
					<div class="breadcrumb-option">
						<span>CompanyModifyForm</span>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- main top 끝 -->

	<!-- main container 시작 -->
	<section class="property-section spad">
		<div class="container" style="text-align: center;">
			<div class="row">
				<div class="col-lg-12">
					<div class="property-list">
						<div class="card shadow">
							<div class="card-body">
								<div class="table-responsive">
								<form action="CompanyModifyProcess" method="post" id="modifyForm">
									<table class="table table-bordered" cellspacing="0">
										<tr>
											<td>아이디</td>
											<td><input type="text" name="cmid"
												value="${companyDTO.cmid }" readonly="readonly"></td>
										</tr>
										<tr>
											<td>비밀번호</td>
											<td><input type="text" name="cmpassword"
												value="${companyDTO.cmpassword }" readonly="readonly"></td>
										</tr>
										<tr>
											<td>이름</td>
											<td><input type="text" name="cmname"
												value="${companyDTO.cmname }"></td>
										</tr>
										<tr>
											<td>업체코드(번호)</td>
											<td><input type="text" name="cmcode"
												value="${companyDTO.cmcode }" readonly="readonly"></td>
										</tr>
										<tr>
											<td>이메일</td>
											<td><input type="email" name="cmemail"
												value="${companyDTO.cmemail }"></td>
										</tr>
										<tr>
											<td>전화번호</td>
											<td><input type="text" name="cmphone"
												value="${companyDTO.cmphone }"></td>
										</tr>
										<tr>
											<td>주소</td>
											<td><input type="text" name="cmaddress"
												value="${companyDTO.cmaddress }"></td>
										</tr>
									</table>
									<button type="button" onclick="modifySubmit()" class="site-btn btn">등록</button>
								</form>
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
<script>
	function modifySubmit(){
		alert('수정되었습니다.')
		modifyForm.submit();
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

