<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../includes/header.jsp"%>
<style>
	.div-Date {
    font-size: 16px;
    font-weight: normal;
    color: #707079;
    clear: none;
    width: 100%;
    margin-right: 30px;
    height: 46px;
    background: #F2F4F5;
    border-radius: 0;
    border: 1px solid #ebebeb;
    line-height: 46px;
    margin-bottom: 20px;
    padding: 15px;
	}
	.comment-option ,.comment-option .single-comment-item{
		margin-bottom: 0;
	}
	.comment-btn{
		float: right;
	}
	.comment-option .single-comment-item .sc-text{
	display: inline;
	}
	.like-btn{
    background: #dc3545;
    cursor: pointer;
	}
	.property-list .single-property-item .property-pic img{
		min-width: 80%;
		width: 230px;
		height: 230px;
	}
	#hotel {
	color: #2CBDB8;
	}
</style>
	<!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text">
                        <h2>HotelList</h2>
                        <div class="breadcrumb-option">
                            <a href="#"><i class="fa fa-home"></i> Home</a>
                            <span>HotelList</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->
    
    <!-- search Begin -->
    <section class="property-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="property-sidebar">
                        <h4>예약하기</h4>
                        <form action="c_HotelList" class="sidebar-search" method="post" id="hotelListForm">
                        	<input type="hidden" id="page" name="page">
                            <div id="ctnameDiv">
                            <select name="ctname" id="ctname">
                                <option value="지역">지역</option>
                                <option value="서울">서울</option>
                                <option value="부산">부산</option>
                                <option value="제주도">제주도</option>
                                <option value="경주">경주</option>
                                <option value="여수">여수</option>
                            </select>
                            </div>
                            <p>체크인</p>
                            <input type="date" id="checkin" class="div-Date" value="${searchData.bcheckin }" name="bcheckin">
                            <p>체크아웃</p>
                            <input type="date" id="checkout" class="div-Date" value="${searchData.bcheckout }" name="bcheckout">
                            <div id="bpersonDiv">
                            <select name="bperson" id="bperson">
                                <option value="">인원</option>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="3">4</option>
                                <option value="3">4명 이상</option>
                            </select>
                            </div>
                        	<div id="bpriceDiv">
                            <select name="bprice" id="bprice">
                                <option value="">가격</option>
                                <option value="150000">150000이하</option>
                                <option value="300000">300000이하</option>
                                <option value="500000">500000이하</option>
                                <option value="1000000">1000000이하</option>
                                <option value="10000000">1000000이상</option>
                            </select>
                            <button type="button" class="search-btn btn" onclick="searchHotel()" >Search</button>
                            </div>
                        </form>
                    </div>
                </div>
               	<!-- search end --> 
               	
               	<!-- hotelList start -->
                <div class="col-lg-9">
                    <h4 class="property-title">HotelList</h4>
                    <div class="property-list">
                    <c:forEach var="list" items="${hotelList }">
                        <div class="single-property-item">
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="property-pic">
                                        <a onclick="updateHit('${list.hocode}')" style="text-decoration: none;"><img src="/resources/img/hotelFile/${list.hofileName }" alt=""></a>
                                    </div>
                                </div>
                                <div class="col-md-8 comment-option">
                                    <div class="property-text single-comment-item">
                                        <div class="s-text btn">평점 : ${list.hoscore }</div>
                                        <h5 class="r-title"><a onclick="updateHit('${list.hocode}')" style="text-decoration: none; color: black;">${list.honame }</a></h5>
                                        <div class="properties-location"><i class="icon_pin"></i>${list.hoaddr }</div>
                                        <p>${list.hopublicize }</p>
                                        <div class="room-price sc-text">
                                            <span>가격: </span>
                                            <h5>${list.roprice } ~</h5>
                                            <c:if test="${sessionScope.MLoginId != null }">
                                            <a id="heart${list.hocode }" class="comment-btn btn" onclick="heartProcess('${list.hocode }')">찜 등록</a>
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        </c:forEach>
                    </div>
                    <!-- hotelList end -->
                    <!-- page start -->
                    <div class="property-pagination">
                    <c:choose>
                    <c:when test="${search != null }">
                    <c:forEach begin="${pageDTO.startpage }" end="${pageDTO.endpage }" step="1" var="pageNum">
                    	<c:choose>
                    		<c:when test="${pageNum == pageDTO.page }">
		                        <a href="#" class="active">${pageNum }</a>
                    		</c:when>
                    		<c:otherwise>
		                        <a onclick="footerSearchHotel(${pageNum })">${pageNum }</a>
                    		</c:otherwise>
                    	</c:choose>
                    </c:forEach>
                    </c:when>
                    <c:otherwise>
                    	<c:forEach begin="${pageDTO.startpage }" end="${pageDTO.endpage }" step="1" var="pageNum">
                    	<c:choose>
                    		<c:when test="${pageNum == pageDTO.page }">
		                        <a href="#" class="active">${pageNum }</a>
                    		</c:when>
                    		<c:otherwise>
		                        <a onclick="c_HotelList(${pageNum })">${pageNum }</a>
                    		</c:otherwise>
                    	</c:choose>
                    </c:forEach>
                    </c:otherwise>
                    </c:choose>
                    </div>
                    <!-- page end -->
                </div>
            </div>
        </div>
    </section>
<script>
	$(document).ready(function(){
		var ctname = '${ctname}'
		var bperson = '${searchData.bperson}';
		var bprice = '${searchData.bprice}';
		/* 호텔 search할 때 도시를 선택한 경우 */
		if(ctname != "null" && ctname != ""){
			$("#ctnameDiv .current").text(ctname);	/* 호텔 select 박스에 선택한 도시 이름 띄우기 */
			$("#ctname").val(ctname).prop("selected", true);	
			}
		/* 호텔 search할 때 인원수를 선택한 경우 */
		if(bperson != ""){
			$("#bpersonDiv .current").text(bperson);	/* 호텔 select 박스에 선택한 인원수 띄우기 */
			$("#bperson").val(bperson).prop("selected", true);
			}
		/* 호텔 search할 때 가격을 선택한 경우 */
		if(bprice != ""){
			$("#bpriceDiv .current").text(bprice+"이하");	/* 호텔 select 박스에 선택한 가격 띄우기 */
			$("#bprice").val(bprice).prop("selected", true);
			}
		checkHeart();
	})
	
	/* search 할 때 체크인과 체크아웃 날짜를 입력하도록 하기 */
	function searchHotel(){
		if($("#checkin").val() == ""){
			alert('체크인 날짜를 입력해주세요');
			return;
			}
		if($("#checkout").val() == ""){
			alert('체크아웃 날짜를 입력해주세요');
			return;
			}
		hotelListForm.submit();
		}

	/* 로그인 된 아이디가 찜한 내역이 있는지 확인하기 */
	function checkHeart(){
		<c:forEach var="hlist" items="${hotelList}">
		<c:forEach var="heartList" items="${heartList}">
			var hocode = "${hlist.hocode}";
			var ht_hocode = "${heartList.ht_hocode}";
			var loginId = "${sessionScope.MLoginId}";
			var htid = "${heartList.htid}";
			if(hocode == ht_hocode && loginId == htid){	/* 호텔코드와 찜테이블에 있는 호텔코드가 같으면서 로그인 아이디와 찜테이블에 있는 로그인 아이디가 같다면 찜 취소 버튼으로 바꿈 */
				$("#heart"+hocode).html('찜 취소').css({'color': '#ffffff','border': '1px solid #dc3545'}).addClass('like-btn');
			}
		</c:forEach>
		</c:forEach>
	}

	/* 찜 등록, 찜 취소 */
	function heartProcess(hocode){
		var loginId = '${sessionScope.MLoginId}';
		if($("#heart"+hocode).html() == '찜 등록'){ /* 찜 등록 버튼의 이름이 찜 등록이라면 찜 등록 내역 insert */
			$.ajax({
				type: 'post',
				url: 'insertHeart',
				data: {
						'ht_hocode': hocode,
						'htid': loginId
					},
				dataType: 'text',
				success: function(result){
					if(result == 'OK'){	/* 찜 등록 내역 insert에 성공하면 버튼을 찜 취소 버튼으로 바꾼다 */
						$("#heart"+hocode).html('찜 취소').css({'color': '#ffffff','border': '1px solid #dc3545'}).addClass('like-btn');
					}
					},
				error: function(){
					console.log('heart 등록 연결 실패');
					}
				});
		} else {  /* 찜 등록 버튼의 이름이 찜 취소라면 찜 등록 내역 삭제 */
			$.ajax({
				type: 'post',
				url: 'deleteHeart',
				data: {
						'ht_hocode': hocode,
						'htid': loginId
					},
				dataType: 'text',
				success: function(result){
					if(result == 'OK'){	/* 찜 등록 내역 delete에 성공하면 버튼을 찜 등록 버튼으로 바꾼다 */
						$("#heart"+hocode).html('찜 등록').removeClass('like-btn').removeAttr("style");
					}
					},
				error: function(){
					console.log('heart 취소 연결 실패');
					}
				});			
		}
		}

	/* 페이지 버튼을 누를시에 실행 */
	function c_HotelList(page){
		var url = "";
		if($("#checkin").val() == ""){	/* checkin input에 값이 비어 있다면 파라미터 값으로 page만 넘김 */
			url = "c_HotelList?page="+page;
			location.href= url;
		} else {
			$("#page").val(page);
			/* checkin input에 값이 존재한다면 form submit*/
			hotelListForm.submit();
		}
		}

	/* 호텔 조회수 1 올리기 */
	function updateHit(hocode){
		$.ajax({
			type: 'post',
			url: 'updateHit',
			data: {
					'hocode': hocode,
				},
			dataType: 'text',
			success: function(result){
				if(result == 'OK'){	
					location.href="c_RoomList?hocode="+hocode;
				}
				},
			error: function(){
				console.log('updateHit 연결 실패');
				}
			});
		}

	/* 메인 푸터 검색으로 들어왔을시에 페이징 처리 */
	function footerSearchHotel(page){
		var search = "${search}";
		var	url = "searchHotel?page="+page+"&search="+search;
		location.href= url;
		}
</script>
    <!-- Property Section End -->
<%@ include file="../includes/footer.jsp"%> 
