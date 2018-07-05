<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>youtube</title>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>
.youtubeWrap {
   position: relative;
   width: 50%;
   padding-bottom: 56.25%;
}

.youtubeWrap iframe {
   position: absolute;
   width: 100%;
   height: 100%;
}
</style>
</head>
<body>

<iframe width="1440" height="2960" src="http://192.168.11.4:8181/pumpkinplace/game/gamepage" frameborder="0" ></iframe>

<script>
      jQuery(document).ready(
            function($) {
               $('iframe[src^="http://192.168.11.4:8181/pumpkinplace/game/gamepage/"]').wrap(
                     '<div class="youtubeWrap"></div>');
            });   
      //ㅁㄴㅇ
</script>
</body>
</html>
   