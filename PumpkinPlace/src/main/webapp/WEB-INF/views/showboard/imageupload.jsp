<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>

	<form action="imageupload" method="post" enctype="multipart/form-data">
		<input type="file" name="uploadFile" id="imgInp" /> <input
			type="submit" value="Upload" onclick="sendimage();" />
	</form>

	<div></div>

	<p>
		<small>공연을 위한 포스터를 업로드해주세요. 그렇지 않을 경우 대체 이미지가 사용됩니다.</small>
	</p>

	<br />
	<img id="blah"
		src="${pageContext.request.contextPath}/resources/assets/img/showboard/imagesprepare.png"
		alt="" width="570px;" height="796px;" />
	<br />
	<br />

	<!-- 사진 저장 -->
	<script type="text/javascript">
	function sendimage(){
		if (window.opener != null && !window.opener.closed) {
           // var txtName1 = window.opener.document.getElementById("txtName1");
          //  var txtName2 = window.opener.document.getElementById("txtName2");
           // txtName1.value = filename;
           // txtName2.value = imagefile;
        }
	}
	</script>
	<script>
     $(document).ready(function() {
    	 var filename = null;
         if (${not empty saved}) {
        	// filename = saved;
        	 //console.log('파일 이름 : ' filename);
            alert('${saved}' + 'SAVED');
         	filename = '${saved}';
         	console.log(filename);
         	var txtName1 = window.opener.document.getElementById("txtName1");
         	 txtName1.value = filename;
         	console.log('filename' + filename);
            window.close();
         }
      });
         </script>

	<!-- 사진 미리보기 -->
	<script type="text/javascript">
        $(function() {
            $("#imgInp").on('change', function(){
                readURL(this);
            });
        });
		var imagefile = null;
        function readURL(input) {
            if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
            	imagefile = e.target.result;
            	console.log('파일 : ' + imagefile);
            	var txtName2 = window.opener.document.getElementById("txtName2");
            	txtName2.value = imagefile;
            	console.log('imagefile' + imagefile);
                    $('#blah').attr('src', e.target.result);
                }
              reader.readAsDataURL(input.files[0]);
            }
            
        }

    </script>
	<!-- end 미리보기 -->

</body>
</html>