<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../includes/a_sidebar.jsp"%>



<!-- Breadcrumb Section Begin -->
<div class="main">
<section class="breadcrumb-section">
		<div class="row">
			<div class="col-lg-12">
				<div class="breadcrumb-text">
					<h2>업체 관리</h2>
					<div class="breadcrumb-option">
						<span>CompanyList</span>
					</div>
				</div>
			</div>
		</div>
</section>
<!-- Breadcrumb Section Begin -->


<!-- Property Section Begin -->
<section class="property-section spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="property-list">
				
					<!-- Begin Page Content -->
					<c:choose>
						<c:when test="${sessionScope.ALoginId=='ADMIN' }">
						<div class="card shadow">
							<div class="card-body">
								<div class="table-responsive">
									<table class="table table-bordered" cellspacing="0">
										<thead>
											<tr>
												<th>코드</th>
												<th>아이디</th>
												<th>이름</th>
												<th>이메일</th>
												<th>삭제</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="cList" items="${companyList }">
												<tr>
													<td>${cList.cmcode }</td>
													<td>${cList.cmid }</td>
													<td>${cList.cmname }</td>
													<td>${cList.cmemail }</td>
													<td>
													<button class="site-btn btn" onclick="companyDelete('${cList.cmid }')">삭제</button></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						</c:when>
					</c:choose>	
				</div>
			</div>
		</div>
	</div>
</section>
	</div>

<!-- Property Section End -->
</body>
<script type="text/javascript">
	function companyDelete(cmid){
		var inputPw = prompt('비밀번호를 입력하세요');
		var loginPw = '${loginPw}';
		if(inputPw == loginPw){
			alert('탈퇴되었습니다.')
			location.href="companyDelete?cmid="+cmid;
			}
		}
</script>


	<script src="resources/js/jquery-3.3.1.min.js"></script>
    <script src="resources/js/bootstrap.min.js"></script>
    <script src="resources/js/jquery.magnific-popup.min.js"></script>
    <script src="resources/js/jquery.nice-select.min.js"></script>
    <script src="resources/js/jquery.slicknav.js"></script>
    <script src="resources/js/jquery-ui.min.js"></script>
    <script src="resources/js/owl.carousel.min.js"></script>
    <script src="resources/js/main.js"></script>
    </html>