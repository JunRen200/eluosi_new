<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script src="jquery-1.8.2.min.js"></script>
</head>
<body>
	<form action="${pageContext.request.contextPath}/User/check">
		用户名:<input type="text" name="userName" id="userName" /><br> 密码:<input
			type="text" name="password" id="password" /><br> <input
			type="text" name="kaptcha" id="kaptcha" /> <input type="submit" value="提交" id="submit"></input><br>
	</form>




	<p>验证码</p>
	用户名:
	<input type="text" name="userName" id="userName1" />
	<br> 密码:
	<input type="text" name="password" id="password1" />
	<br>
	<img src="http://localhost:8080/eluosi_new/kaptcha" width="130"
		id="kaptchaImage" title="看不清，点击换一张" />
	<input type="text" name="kaptcha" id="kaptcha1" />
	<br>
	<input type="submit" value="提交" id="submit2"></input>


	<br />
	<small>看不清，点击换一张</small>
	<script type="text/javascript">
		$(function() {
			$("#submit2")
					.click(
							function() {
								$
										.ajax({
											url : "${pageContext.request.contextPath}/User/RegisterUser",
											//加上这句话
											xhrFields : {
												withCredentials : true
											},
											crossDomain : true,
											data : "userName="
													+ $("#userName1").val()
													+ "&password="
													+ $("#password1").val()
													+ "&kaptcha="
													+ $("#kaptcha1").val(),
											success : function(result) {
												alert(result);
											},
											error : function(date) {
												console.log("erro::::" + date);
											},
											dataType : "text",
											async : false
										});
							});

			$("#submit").click(function() {
				$.get("http://192.168.56.1:8080/eluosi_new/User/check", {
					kaptcha : $("#kaptcha2").val()
				}, function(data) {
					console.log(data);

				}, "json");
			});

			$('#kaptchaImage').click(
					function() {
						$(this).attr(
								'src',
								'http://192.168.56.1:8080/eluosi_new/kaptcha?'
										+ Math.floor(Math.random() * 100));
					});

		});
	</script>

</body>
</html>