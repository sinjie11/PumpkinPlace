<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Login</title>

        <!-- CSS -->
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/assets/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/assets/font-awesome/css/font-awesome.min.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/assets/css/form-elements.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/assets/css/style.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    </head>

    <body>
        <!-- Top content -->
        <div class="top-content">
            <div class="inner-bg">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-6 col-sm-offset-3 form-box">
                        <!-- 로그인 창에서 회원가입(Register) 버튼 -->
                        <p><a class="btn btn-link-1 btn-link-1-google-plus" href="/pumpkinplace/member/register" style="width: 100px; margin-left: 80%;">Register</a></p>                          
                        	<div class="form-top">
                        		<div class="form-top-left">
                        			<h3>Login to our site</h3>
                            		<p>Enter your username and password to log on:</p>
                        		</div>
                        		<div class="form-top-right">
                        			<i class="fa fa-key"></i>
                        		</div>
                            </div>
                            <div class="form-bottom">
			                    <form role="form" action="/pumpkinplace/member/login-post" method="post" class="login-form">
			                    	<div class="form-group">
			                    		<label class="sr-only" for="form-username">Username</label>
			                        	<input type="text" name="mem_id" placeholder="Username..." class="form-username form-control" id="form-username" required>
			                        </div>
			                        <div class="form-group">
			                        	<label class="sr-only" for="form-password">Password</label>
			                        	<input type="password" name="mem_pwd" placeholder="Password..." class="form-password form-control" id="form-password" required>
			                        	<input type="hidden" name="targetUrl" value="${targetUrl}"/>
			                        	<input type="hidden" name="urlNo" value="${urlNo}"/>
			                        </div>
			                        <button type="submit" class="btn">Sign in!</button>
			                    </form>
		                    </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 col-sm-offset-3 social-login">
                        	<div class="social-login-buttons">
	                        	<a class="btn btn-link-1 btn-link-1-facebook" href="https://www.facebook.com/">
	                        		<i class="fa fa-facebook"></i> Facebook
	                        	</a>
	                        	<a class="btn btn-link-1 btn-link-1-twitter" href="https://twitter.com">
	                        		<i class="fa fa-twitter"></i> Twitter
	                        	</a>
	                        	<a class="btn btn-link-1 btn-link-1-google-plus" href="https://plus.google.com">
	                        		<i class="fa fa-google-plus"></i> Google Plus
	                        	</a>
                        	</div>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>
        
        <script>
        jQuery(document).ready(function() {

            /*
                Form validation
            */
            $('.login-form input[type="text"], .login-form input[type="password"], .login-form textarea').on('focus', function() {
            	$(this).removeClass('input-error');
            });
            
            $('.login-form').on('submit', function(e) {
            	
            	$(this).find('input[type="text"], input[type="password"], textarea').each(function(){
            		if( $(this).val() == "" ) { // 공백 입력시 다음단계로 진행되지 못하게 막음
            			e.preventDefault();
            			$(this).addClass('input-error');
            		}
            		else {
            			$(this).removeClass('input-error');
            		}
            	});
            	
            });
            
            
        });
        </script>
        
        
        
    </body>

</html>