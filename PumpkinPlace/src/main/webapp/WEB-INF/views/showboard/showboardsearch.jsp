<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<title>Pumk</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- 부트스트랩 -->
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- jquery -->
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<link rel="stylesheet"
   href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>

<style>
/* Remove the navbar's default margin-bottom and rounded borders */
.navbar {
   margin-bottom: 0;
   border-radius: 0;
}

/* Add a gray background color and some padding to the footer */
footer {
   background-color: #f2f2f2;
   padding: 25px;
}

.carousel-inner img {
   width: 100%; /* Set width to 100% */
   margin: auto;
   min-height: 200px;
}

/* Hide the carousel text when the screen is less than 600 pixels wide */
@media ( max-width : 600px) {
   .carousel-caption {
      display: none;
   }
}

body {
   position: relative; /* For scrollyspy */
   padding-top: 300px; /*Account for fixed navbar */
   background-color: #f8f8f8;
}
}
</style>
</head>
<body>
   <%@ include file="/WEB-INF/views/header.jspf"%>
   <br />
   <br />
   <!-- 가운데 정렬 -->
   <div class="container text-center">
      <h1>공 연 검색 결과</h1>
      <div class="tab-content">
         <form action="search" style="float: right;">
            <input type="text" id="startdate" placeholder="공연 날짜 선택" /> <input
               type="submit" value="선택" />
         </form>
         <br /> <br />
         <!-- 검색창 -->
         <form action="showboardsearch" style="float: right; margin-bottom: 50px;">
            <input type="text" name="searchKeyword" placeholder="검색어 입력"
               required /> <input type="submit" value="검색" />
         </form>
      </div>
   </div>

   <!-- 바디부분 -->

   <div class="container text-center">
      <div class=""></div>
      <div class="row justify-content-md-center">
         <div class="row align-items-start">
            <div class="row align-items-start">
               <c:forEach var="showboardsearch" items="${showboardList}">
                  <div class="col-md-3">
                     <a class="table-title-link" href="${showboardsearch.sb_no}"> <img
                        alt="Bootstrap Image Preview"
                        src="${pageContext.request.contextPath}/resources/assets/img/showboard/${showboardsearch.sb_img}" style="width: 228px; height: 280px;"/>
                     </a> <label class="table-title-link" href="${showboardsearch.sb_no}">
                        <div class="card">
                           <h5 class="card-header">
                              <b>${showboardsearch.sb_title}</b>
                           </h5>
                           <div class="card-body">
                              <p class="card-text">${showboardsearch.sb_nm}</p>
                           </div>
                           <fmt:formatDate value="${showboardsearch.sb_startdate}"
                              pattern="yyyy년 MM월 dd일 HH시 mm분" var="startdate" />
                           <div class="card-footer">${startdate}</div>
                        </div>
                     </label>
                  </div>
               </c:forEach>
            </div>
         </div>
      </div>
   </div>


   <script>
      $(document).ready(function() {
         $(function() {
            $("#startdate, #enddate").datepicker({
               dateFormat : 'yy/mm/dd'
            });
         });

         $('.table-title-link').click(function() {
            event.preventDefault();
            var sb_no = $(this).attr('href');
            $('#page-form-sb_no').val(sb_no);
            var frm = $('#page-form');
            frm.attr('action', 'showdetail');
            frm.attr('method', 'get');
            frm.submit();
         });
      });
   </script>

   <!-- footer -->
   <footer class="container-fluid text-center">

      <div class="row">
         <!-- Add Google Maps -->
         <div id="googleMap"
            style="height: 400px; width: 500px; float: right; margin-right: 200px;"></div>
         <div class="col-sm-7 slideanim">
            <h2 class="text-center" style="margin-left: 230px;">CONTACT</h2>
            <br /> <br />
            <div class="col-sm-7 slideanim" style="margin-left: 350px;">
               <div class="row">
                  <div class="col-sm-6 form-group">
                     <input class="form-control" id="name" name="name"
                        placeholder="Name" type="text" required>
                  </div>
                  <div class="col-sm-6 form-group">
                     <input class="form-control" id="email" name="email"
                        placeholder="Email" type="email" required>
                  </div>
               </div>
               <textarea class="form-control" id="comments" name="comments"
                  placeholder="Comment" rows="5"></textarea>
               <br>
               <div class="row">
                  <div class="col-sm-12 form-group">
                     <button class="btn btn-default pull-right" type="submit">Send</button>
                  </div>
               </div>
            </div>
         </div>
      </div>

      <script>
         function myMap() {
            var myCenter = new google.maps.LatLng(37.499685, 127.031535);
            var map;

            var mapProp = {
               center : myCenter,
               zoom : 12,
               scrollwheel : false,
               draggable : false,
               mapTypeId : google.maps.MapTypeId.ROADMAP
            };
            var map = new google.maps.Map(document
                  .getElementById("googleMap"), mapProp);
            var marker = new google.maps.Marker({
               position : myCenter
            });
            marker.setMap(map);

         }
      </script>
      <script
         src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBLOpelo4l6yKdCApN_d5uUehocuiw7Uuk&callback=myMap"></script>
      <!--
To use this code on your website, get a free API key from Google.
Read more at: https://www.w3schools.com/graphics/google_maps_basic.asp
-->

   </footer>

   <%@ include file="/WEB-INF/views/footer.jspf"%>

</body>
</html>
