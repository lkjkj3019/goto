<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <!-- Footer Section Begin -->
    <footer class="footer-section set-bg" data-setbg="resources/img/footer-bg.jpg">
        <div class="container">
            <div class="footer-text">
                <div class="row">
                    <div class="col-lg-3">
                        <div class="footer-logo">
                            <p>찾고싶은 숙소를 검색하세요.</p>
                            <form action="searchHotel" class="newslatter-form">
                                <input type="text" name="search" placeholder="호텔이름으로 검색">
                                <button type="submit"><i class="fa fa-location-arrow"></i></button>
                            </form>
                        </div>
                    </div>
                    <div class="col-lg-3 offset-lg-1">
                        <div class="footer-widget">
                            <h4>Trevel area</h4>
                            <ul>
                                <li><i class="fa fa-caret-right"></i> <a href="/c_HotelList?ctname=서울">서울</a></li>
                                <li><i class="fa fa-caret-right"></i> <a href="/c_HotelList?ctname=경주">경주</a></li>
                                <li><i class="fa fa-caret-right"></i> <a href="/c_HotelList?ctname=전주">전주</a></li>
                               	<li><i class="fa fa-caret-right"></i> <a href="/c_HotelList?ctname=부산">부산</a></li>
                                <li><i class="fa fa-caret-right"></i> <a href="/c_HotelList?ctname=제주">제주</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="footer-widget">
                            <h4>Contact Us</h4>
                            <ul class="contact-option">
                                <li><i class="fa fa-map-marker"></i> Michuhol-gu, Incheon</li>
                                <li><i class="fa fa-phone"></i> (032) 123 4567</li>
                                <li><i class="fa fa-envelope"></i> ICIA@gmail.com</li>
                                <li><i class="fa fa-clock-o"></i> Mon - Sat, 08 AM - 06 PM</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- Footer Section End -->
    <!-- Js Plugins -->
    <script src="resources/js/jquery-3.3.1.min.js"></script>
    <script src="resources/js/bootstrap.min.js"></script>
    <script src="resources/js/jquery.magnific-popup.min.js"></script>
    <script src="resources/js/jquery.nice-select.min.js"></script>
    <script src="resources/js/jquery.slicknav.js"></script>
    <script src="resources/js/jquery-ui.min.js"></script>
    <script src="resources/js/owl.carousel.min.js"></script>
    <script src="resources/js/main.js"></script>
</body>

</html>