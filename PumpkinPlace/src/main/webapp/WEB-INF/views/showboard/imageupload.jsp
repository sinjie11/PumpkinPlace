<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
<form action="imageupload" method="post" 
    enctype="multipart/form-data">
    <input type="file" name="uploadFile" />
    <input type="submit" value="Upload" />
</form>

	<input type='file' id="imgInp" name="uploadFile" />
	<div></div>

	<p>
		<small>공연을 위한 포스터를 업로드해주세요. 그렇지 않을 경우 대체 이미지가 사용됩니다.</small>
	</p>

	<br />
	<img id="blah" src="#" alt="" width="570px;" height="796px;" />
	<br />
	<br />

	<!-- 사진 저장 -->
	<script>
            $(document).ready(function() {
         if (${not empty saved}) {
            alert('${saved}' + 'SAVED');
         }
            });
         </script>
	<!-- 사진저장 -->

	<!-- 사진 미리보기 -->
	<script type="text/javascript">
        $(function() {
            $("#imgInp").on('change', function(){
                readURL(this);
            });
        });

        function readURL(input) {
            if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                    $('#blah').attr('src', e.target.result);
                }

              reader.readAsDataURL(input.files[0]);
            }
        }

    </script>
	<!-- end 미리보기 -->
</body>
</html>