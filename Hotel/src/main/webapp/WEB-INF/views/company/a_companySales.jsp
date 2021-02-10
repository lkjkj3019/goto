<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../includes/a_sidebar.jsp"%>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<style>
 .nice-select{
 	margin-left: 40px;
 }
</style>
<!-- main top 시작-->
<div class="main">
	<section class="breadcrumb-section">
		<div class="row">
			<div class="col-lg-12">
				<div class="breadcrumb-text">
					<h2>호텔 매출 현황</h2>
					<div class="breadcrumb-option">
						<span>CompanySales</span><br>
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
				<div class="col-lg-6">
					<div class="property-list">
						<div class="card shadow">
							<div class="card-body">
								<div class="table-responsive">
									<table class="table table-bordered" cellspacing="0">
										<thead>
											<tr>
												<th colspan="2">호텔 매출 정보</th>
											</tr>
										</thead>
										<tbody>
												<tr>
													<td>이번달 매출 : </td>
													<td id="salesTd"></td>
												</tr>
												<tr>
													<td>이번달 예약 건수 : </td>
													<td id="countTd"></td>
												</tr>
												<tr>
													<td><select id="yearSelect">
													<option value="">선택</option>
													</select></td>
													<td><button class="site-btn btn" onclick="gotoCompanySales()">월별 매출 보기</button></td>
												</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="property-list">
						<div class="card shadow">
							<div class="card-body">
								<div class="table-responsive" style="height: 232px">
									<table class="table table-bordered" cellspacing="0">
										<thead>
											<tr>
												<th colspan="3">호텔 조회수 정보</th>
											</tr>
										</thead>
										<tbody>
										<c:forEach var="hitList" items="${hotelHitList }">
												<tr>
													<td rowspan="2">${hitList.honame }</td>
													<td>이번달 조회수 : </td>
													<td>${hitList.hohit }</td>
												</tr>
												<tr>
													<td>총 조회수 : </td>
													<td>${hitList.hototalhit }</td>
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
	<div id="charContainer"
		style="width: 1000px; height: 400px; margin: 0 auto"></div>
	<!-- main container 끝 -->
</div>
</div>
<!-- main 끝 -->
</body>
<script language="JavaScript">
	$(document).ready(function(){
		/* 구글 차트 api 불러오기 */
		google.charts.load('current', {'packages':['bar']});
		google.charts.setOnLoadCallback(salesChart);
		nowMonth();
		selectYear();
		})

	function salesChart(){
		/* 구글 차트 이용하여 12개월로 나눠서 차트 생성 */
		var nowDate = '${salesList[0].bdrawup}';
		var nowYear = nowDate.split('-');
		
		var data = google.visualization.arrayToDataTable([
			['Month', '매출액(단위: 만)', '예약 건수'],
	        ['JAN', ${salesList[0].bprice}/10000, ${salesList[0].cnt}],
	        ['FEB', ${salesList[1].bprice}/10000, ${salesList[1].cnt}],
	        ['MAR', ${salesList[2].bprice}/10000, ${salesList[2].cnt}],
	        ['APR', ${salesList[3].bprice}/10000, ${salesList[3].cnt}],
	        ['MAY', ${salesList[4].bprice}/10000, ${salesList[4].cnt}],
	        ['JUN', ${salesList[5].bprice}/10000, ${salesList[5].cnt}],
	        ['JUL', ${salesList[6].bprice}/10000, ${salesList[6].cnt}],
	        ['AUG', ${salesList[7].bprice}/10000, ${salesList[7].cnt}],
	        ['SEP', ${salesList[8].bprice}/10000, ${salesList[8].cnt}],
	        ['OCT', ${salesList[9].bprice}/10000, ${salesList[9].cnt}],
	        ['NOV', ${salesList[10].bprice}/10000, ${salesList[10].cnt}],
	        ['DEC', ${salesList[11].bprice}/10000, ${salesList[11].cnt}],
	        ]);

		var options = {
			chart: {
				title: nowYear[0]+' 년도 월별 매출',
				}
			};

		var chart = new google.charts.Bar(document.getElementById('charContainer'));
		chart.draw(data, google.charts.Bar.convertOptions(options));
		}

	/* 월 별 매출, 매출 건수 출력 */
	function nowMonth(){
		var nowDate = new Date();
		var bdrawup = nowDate.getFullYear() + '-' +nowDate.getMonth()+1;
		var bprice = 0;
		var count = 0;
		<c:forEach var="list" items="${salesList}">
			if(bdrawup == '${list.bdrawup}'){
				bprice = '${list.bprice}';
				count = '${list.cnt}';
			}
		</c:forEach>
		$("#salesTd").text(bprice+' 원');
		$("#countTd").text(count+' 건');
		}

	/* 매출이 있는 년도 option 생성 */
	function selectYear(){
		var output = "";
		var option = "";
		<c:forEach var="list" items="${yearList}">
			output = "<li data-value='${list.year}' class='option focus'>${list.year}</li>"
			option = "<option>${list.year}</option>";
			$(".list").append(output);
			$("#yearSelect").append(option);
		</c:forEach>
		}

	/* 다른 년도의 매출보기 누르면 뜨는 window 창 */
	function gotoCompanySales(){
		var selectYear = $("#yearSelect").val();
		if(selectYear != ""){
			window.name = "companySales";
			var openWin = window.open("companySales?year="+selectYear, "companySalesPop", "width=1000, height=450, left=100, top=50");
		} else {
			alert('년도를 선택해주세요')
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