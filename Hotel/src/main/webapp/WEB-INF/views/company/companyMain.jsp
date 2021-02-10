<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../includes/a_sidebar.jsp"%>
<div class="main">
   <section class="breadcrumb-section">
      <div class="row">
         <div class="col-lg-12">
            <div class="breadcrumb-text">
               <h2>관리페이지</h2>
               <div class="breadcrumb-option">
                  <span>Main</span>
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
                  <c:choose>
                     <c:when test="${sessionScope.ALoginId=='ADMIN' }">
                        <div class="card shadow">
                           <div class="card-body">
                              <div class="table-responsive">
                                 <table class="table table-bordered" cellspacing="0">
                                    <thead>
                                       <tr>
                                          <th>
                                             <div class="col-lg-12">
                                                <div class="loadmore">
                                                   <a href="a_memberList" class="primary-btn btn" style="width: 230px;">회원 관리</a>
                                                </div>
                                             </div>
                                          </th>
                                          <th>
                                             <div class="col-lg-12">
                                                <div class="loadmore">
                                                   <a href="a_companyList" class="primary-btn btn" style="width: 230px;">업체 관리</a>
                                                </div>
                                             </div>
                                          </th>
                                          <th>
                                             <div class="col-lg-12">
                                                <div class="loadmore">
                                                   <a href="restaurantForm" class="primary-btn btn" style="width: 230px;">맛집 등록</a><br>
                                                </div>
                                             </div>
                                             </th>
                                             </tr>
                                          <tr>
                                          
                                          
                                          <th>
                                             <div class="col-lg-12">
                                                <div class="loadmore">
                                                   <a href="adminRestaurantList" class="primary-btn btn" style="width: 230px;">맛집 관리</a>
                                                </div>
                                             </div>
                                          </th>
                                          <th>
                                             <div class="col-lg-12">
                                                <div class="loadmore">
                                                   <a href="LandmarkInsertForm" class="primary-btn btn" style="width: 230px;">관광지 등록</a>
                                                </div>
                                             </div>
                                          </th>
                                          <th>
                                             <div class="col-lg-12">
                                                <div class="loadmore">
                                                   <a href="adminLandmarkList" class="primary-btn btn" style="width: 230px;">관광지 관리</a><br>
                                                </div>
                                             </div>
                                          </th>
                                          </tr>
                                       <tr>
                                          <th>
                                             <div class="col-lg-12">
                                                <div class="loadmore">
                                                   <a href="questionList" class="primary-btn btn" style="width: 230px;">1대1 문의 관리</a>
                                                </div>
                                             </div>
                                          </th>
                                          <th>
                                             <div class="col-lg-12">
                                                <div class="loadmore">
                                                   <a href="a_reviewList" class="primary-btn btn" style="width: 230px;">고객 후기 관리</a>
                                                </div>
                                             </div>
                                          </th>
                                          <th>
                                             <div class="col-lg-12">
                                                <div class="loadmore">
                                                   <a href="FaqList" class="primary-btn btn" >자주 묻는 질문 관리</a>
                                                </div>
                                             </div>
                                          </th>


                                       </tr>
                                    </thead>

                                 </table>
                              </div>
                           </div>
                        </div>
                     </c:when>
                     <c:otherwise>
                        <div class="card shadow">
                           <div class="card-body">
                              <div class="table-responsive">
                                 <table class="table table-bordered" cellspacing="0">
                                    <thead>
                                       <tr>
                                          <th>
                                             <div class="col-lg-12">
                                                <div class="loadmore">
                                                   <a href="a_hotelInfoForm" class="primary-btn btn" style="width: 200px;">호텔 등록</a>
                                                </div>
                                             </div>
                                          </th>
                                          <th>
                                             <div class="col-lg-12">
                                                <div class="loadmore">
                                                   <a href="a_hotelList" class="primary-btn btn" style="width: 200px;">호텔 관리</a>
                                                </div>
                                             </div>
                                          </th>
                                          <th>
                                             <div class="col-lg-12">
                                                <div class="loadmore">
                                                   <a href="RoomWriteForm" class="primary-btn btn" style="width: 200px;">룸 등록</a><br>
                                                </div>
                                             </div>
                                          </th>
                                          </tr>
                                          
                                          <tr>
                                          <th>
                                             <div class="col-lg-12">
                                                <div class="loadmore">
                                                   <a href="RoomList" class="primary-btn btn" style="width: 200px;">룸 관리</a>
                                                </div>
                                             </div>
                                          </th>
                                          <th>
                                             <div class="col-lg-12">
                                                <div class="loadmore">
                                                   <a href="cpInfoView" class="primary-btn btn" style="width: 200px;">업체 정보 수정</a>
                                                </div>
                                             </div>
                                          </th>
                                          <th>
                                             <div class="col-lg-12">
                                                <div class="loadmore">
                                                   <a href="companySales" class="primary-btn btn" style="width: 200px;">호텔 매출현황</a><br>
                                                </div>
                                             </div>
                                          </th>
                                       </tr>
                                       
                                    </thead>
                                 </table>
                              </div>
                           </div>
                        </div>
                     </c:otherwise>
                  </c:choose>
               </div>
            </div>
         </div>
      </div>
   </section>
   <!-- main container 끝 -->
</div>

<!-- main 끝 -->

</body>

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