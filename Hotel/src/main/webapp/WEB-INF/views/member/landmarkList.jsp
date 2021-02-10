<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../includes/header.jsp"%>

<!-- 상단 지도 부분 -->
<section class="breadcrumb-section">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="breadcrumb-text">
					<h2>Landmark List</h2>
					<div class="breadcrumb-option">
						<i class="fa fa-home"></i>유명 관광지 찾기
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- 좌측 사이드바 -->

<section class="property-section spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-3">
				<div class="property-sidebar">
					<h4>유명한 랜드마크 찾기</h4>
					<form action="searchingLandmark" class="sidebar-search">
					<div id="ctnameDiv">
						<select name="ctname">
							<option value="">찾고 있는 지역 선택</option>
							<option value="서울">서울</option>
							<option value="부산">부산</option>
							<option value="제주도">제주도</option>
							<option value="여수">여수</option>
							<option value="경주">경주</option>
						</select></div><div id="ctdivideDiv"> <select name="ctdivide">
							<option value="">찾고 있는 지역 선택</option>
							<option value="동">동</option>
							<option value="서">서</option>
							<option value="남">남</option>
							<option value="북">북</option>
						</select></div>
						<button type="submit" class="search-btn btn">관광지 탐색</button>
					</form>
				</div>
			</div>
			<div class="col-lg-9">
				<h4 class="property-title fa fa-arrows"> 랜드마크 찾아보기</h4>
				<div class="property-list">
					<c:forEach var="LList" items="${landmarkList}">
						<div class="single-property-item">
							<div class="row">
								<div class="col-md-4">
									<div class="property-pic">
										<img src="resources/img/landmarkFile/${LList.lafilename}"
											alt="">
									</div>
								</div>
								<div class="col-md-8">
									<div class="property-text">
										<h5 class="r-title">${LList.laname }</h5>
										<div class="properties-location">
											<i class="icon_pin"></i>${LList.laaddr }</div>
										<p>${LList.laintro }</p>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
			<div class="property-pagination" style="margin: auto">
			<c:choose>
			<c:when test="${cityDTO.ctname != null }">
				<c:forEach begin="${pageDTO.startpage}" end="${pageDTO.endpage}"
					step="1" var="pageNum">
					<!-- step 씩 증가하는 pageNum -->
					<c:choose>
						<c:when test="${pageNum == pageDTO.page}">
							<a href="#">${pageNum}</a>
						</c:when>
						<c:otherwise>
							<a onclick="landmarkList(${pageNum})">${pageNum}</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<c:forEach begin="${pageDTO.startpage}" end="${pageDTO.endpage}"
					step="1" var="pageNum">
					<!-- step 씩 증가하는 pageNum -->
					<c:choose>
						<c:when test="${pageNum == pageDTO.page}">
							<a href="#">${pageNum}</a>
						</c:when>
						<c:otherwise>
							<a href="landmarkList?page=${pageNum}">${pageNum}</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</c:otherwise>
			</c:choose>
			</div>
		</div>
	</div>
</section>
<script type="text/javascript">
	/* 랜드마크 페이지 다음 장 넘어갈 때 */
	function landmarkList(page){
		var ctname = "${cityDTO.ctname}";
		var ctdivide = "${cityDTO.ctdivide}";
		location.href="searchingLandmark?page="+page+"&ctname="+ctname+"&ctdivide="+ctdivide;
		}
	/* 검색했을때 넘어 오는 값 띄우기 */
	$(document).ready(function(){
		var ctname = '${cityDTO.ctname}'
		var ctdivide = '${cityDTO.ctdivide}';
		if(ctname != "null" && ctname != ""){
			$("#ctnameDiv .current").text(ctname);	
			$("#ctname").val(ctname).prop("selected", true);	
			}
		if(ctdivide != "null" && ctdivide != ""){
			$("#ctdivideDiv .current").text(ctdivide);	
			$("#ctdivide").val(ctdivide).prop("selected", true);	
			}
		})
</script>



<%@ include file="../includes/footer.jsp"%>