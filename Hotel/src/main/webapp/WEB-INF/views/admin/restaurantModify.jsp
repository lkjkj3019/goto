<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../includes/a_sidebar.jsp" %>
    
<div class="main">
			<section class="breadcrumb-section">
				<div class="row">
					<div class="col-lg-12">
						<div class="breadcrumb-text">
							<h2>맛집 수정</h2>
							<div class="breadcrumb-option">
								<span>${rList.recode} 맛집 관리</span>
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
												<form action="restaurantModify" method="post" class="contact-form" enctype="multipart/form-data" id="modifyForm">
													<table class="table table-bordered" cellspacing="0">
														<thead>
															<tr>
																<th>맛집코드</th>
																<th>도시코드</th>
																<th>맛집 이름</th>
																<th>주소</th>
																<th>수정</th>
																<th>삭제</th>
															</tr>
														</thead>
														<tbody>
																<tr>
																	<td><input type="text" name="recode" readonly="readonly" value="${rList.recode}"></td>
																	<td><input type="text" name="re_ctcode" readonly="readonly" value="${rList.re_ctcode}"></td>
																	<td><input type="text" name="rename" value="${rList.rename}"></td>
																	<td><input type="text" name="readdr" value="${rList.readdr}"></td>
																	<td><button class="site-btn btn" type="button" onclick="submitForm()">수정</button></td>
                                									<td><button class="site-btn btn" onclick="deleteRes('${rList.recode}')">삭제</button></td>
																</tr>
														</tbody>
														<tfoot>
														<tr>
														<td colspan="6"><textarea cols="100" rows="10" name="reintro">${rList.reintro}</textarea></td>
														</tr>
														<tr>
														<td colspan="6"><input type="file" name="rephoto">${rList.refilename}</td>
														</tr>
														</tfoot>
													</table>
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
    
</body>

<script>
	function submitForm(){
		alert('수정되었습니다.');
		modifyForm.submit();
		}
	function deleteRes(recode){
		alert('삭제되었습니다.');
		location.href='restaurantDelete?recode='+recode;
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