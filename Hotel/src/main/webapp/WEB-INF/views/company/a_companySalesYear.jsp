<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"
	integrity="sha512-bLT0Qm9VnAYZDflyKcBaQ2gg0hSYNQrJ8RilYldYQ1FxQYoCLtUjuuRuZo+fjqhx/qtq/1itJ0C2ejDxltZVFg=="
	crossorigin="anonymous"></script>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
</head>
<body>
	<div id="charContainer"
		style="width: 1000px; height: 400px; margin: 0 auto"></div>
</body>
<script language="JavaScript">
	$(document).ready(function(){
		/* 구글 차트 api 불러오기 */
		google.charts.load('current', {'packages':['bar']});
		google.charts.setOnLoadCallback(salesChart);
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

</script>
</html>