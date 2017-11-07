<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="UTF-8">
<title>俄罗斯方块</title>

<!-- <meta name="viewport" content="width=device-width, initial-scale=1.0">-->
<meta name="description" content="">
<meta name="author" content="">

<link href="css/htmlCss/bootstrap.min.css" rel="stylesheet" />
<link href="css/style.css" rel="stylesheet" />

<link rel="stylesheet" href="css/indexCss.css">
</head>


<body>
	<!--登录界面  -->
	<div class="page-container login" id="loginPage">
		<div class="loginMsg">
			<input type="text" id="user_name" name="username" class="username"
				placeholder="Username"> <input id="pwd" type="password"
				name="password" class="password" placeholder="Password">
			<!-- <div class="checkCode">
            <input type="text" placeholder="验证码">
            <span>123</span>
        </div>-->
			<button class="btn" onclick="login()">登录</button>
			<button class="btn" data-toggle="modal" data-target="#reg"
				onclick="refreshkaptchaImag()">注册用户</button>

		</div>
	</div>

	<!--注册界面  -->
	<div class="modal fade in" id="reg" tabindex="-1"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
			
				<ul>
					<li><input type="text" id="reg_userName"
						placeholder="Username"><span id="exist">用户已存在</span></li>
					<li><input id="reg_pwd" type="password" placeholder="Password"><span id="pwd_len">密码长度5-10位</span></li>
					<li>
						<!--<div class="regCheck">--> <input type="text"
						id="regCheckNumber" placeholder="验证码"> <img
						src="${pageContext.request.contextPath}/kaptcha"
						id="kaptchaImage" title="看不清，点击换一张" /> <span>验证码不正确</span> <!--</div>-->
					</li>
					<li>
						<button class="btn" data-dismiss="modal"
							onclick="candelRegisterUser()">取消</button>
						<button class="btn" id="btnreg" onclick="registerUser()">注册</button>
					</li>
				</ul>


			</div>
			<!-- /.modal-content -->
		</div>
	</div>

	<!--游戏选择界面  -->
	<div class="box" id="playSel">
		<div class="boxTop">
			<p id="myName" onclick="openMsg()">欢迎：psm！</p>
		</div>
		<div class="boxCenter">
			<div class="left">
				<div class="userList">
					<p class="userList_p">在线用户</p>
					<ul id="userList">
						<li>1</li>
						<li>1</li>
						<li>1</li>
						<li>1</li>
						<li>1</li>
						<li>1</li>
						<li>1</li>
						<li>1</li>
						<li>1</li>
						<li>1</li>
						<li>1</li>
						<li>1</li>
						<li>1</li>
						<li>1</li>
						<li>1</li>
						<li>1</li>
						<li>1</li>
						<li>1</li>
					</ul>
				</div>

				<p class="roomList_p">房间列表</p>
				<div class="roomList">

					<ul id="roomList">
						<li><a onclick='enterRoom(ads)'>进入</a>1</li>
						<li><a onclick='enterRoom(ads)'>进入</a>1</li>
						<li><a onclick='enterRoom(ads)'>进入</a>1</li>
						<li><a onclick='enterRoom(ads)'>进入</a>1</li>
						<li><a onclick='enterRoom(ads)'>进入</a>1</li>
						<li><a onclick='enterRoom(ads)'>进入</a>1</li>
						<li><a onclick='enterRoom(ads)'>进入</a>1</li>
						<li><a onclick='enterRoom(ads)'>进入</a>1</li>
						<li><a onclick='enterRoom(ads)'>进入</a>1</li>
						<li><a onclick='enterRoom(ads)'>进入</a>1</li>
						<li><a onclick='enterRoom(ads)'>进入</a>1</li>
						<li><a onclick='enterRoom(ads)'>进入</a>1</li>
						<li><a onclick='enterRoom(ads)'>进入</a>1</li>
						<li><a onclick='enterRoom(ads)'>进入</a>1</li>

					</ul>
				</div>

			</div>
			<div class="center">

				<div class="talk">
					<div id="console" class="talk_content"></div>
					<form class="user_talk" onsubmit="return false;">
						<input id="msg" class="input-talk" type="text" placeholder="聊天" />
						<button type="button" id="btn_sendMessage">发送</button>
					</form>
				</div>

			</div>
		</div>
		<div class="boxBottom">
			<div class="right">

				<button class="btn" onclick="openGame()" onfocus="losebd()">单机游戏</button>
				<!-- 按钮触发模态框 -->
				<button class="btn" data-toggle="modal" data-target="#myModal" onclick="openCreateRoom()">创建房间</button>

				<button class="btn" data-toggle="modal" data-target="#myLevelList"
					onclick="getRanking()">排行榜</button>

			</div>
		</div>


		<!-- 排行榜（Modal） -->
		<div class="modal fade" id="myLevelList" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel1" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<!-- <div class="modal-header">
                     <button type="button" class="close" data-dismiss="modal"
                             aria-hidden="true">×</button>
                     <div class="modal-title" id="myModalLabel1">&lt;!&ndash;<img src="img/levelTop.png" alt="" width="100%" height="100%">&ndash;&gt;</div>
                 </div>-->
					<div class="modal-body">

						<div class="tab-content">
							<!--<div class="tab-pane active" id="friend">
                            <ul id="myLevel"></ul>
                        </div>
                        <div class="tab-pane" id="theWhole">全服排行</div>-->
							<div class="tab-content-top">
								<!--<img src="img/myQ1.png" alt="">
                            <img src="img/myQ2.png" alt="">-->
								<p>排行榜</p>
							</div>
							<div class="tab-content-center">
								<div class="tab-content-center-left">
									<button class="btn btn-lg" id="fightingClick"
										onclick="fightingClick()">战斗力</button>
									<button class="btn btn-lg" id="activeClick"
										onclick="activeClick()">活跃榜</button>
								</div>
								<div class="tab-content-center-right">
									<div class="tab-content-center-right-top">
										<ul id="myLevel">
											<li><span>玩家:1</span><span>积分:1 等级:1</span> <!--外层容器-->
												<div class="wrapper">
													<!--进度条容器-->
													<div class="progressbar">
														<!--用来模仿进度条推进效果的进度条元素-->
														<div class="fill bar mint"></div>
													</div>
												</div></li>
										</ul>
										<ul id="userActive">
											<li><span>玩家:1</span><span>场次:1</span></li>
											<li><span>玩家:1</span><span>场次:1</span></li>
											<li><span>玩家:1</span><span>场次:1</span></li>
											<li><span>玩家:1</span><span>场次:1</span></li>
											<li><span>玩家:1</span><span>场次:1</span></li>
											<li><span>玩家:1</span><span>场次:1</span></li>
											<li><span>玩家:1</span><span>场次:1</span></li>
											<li><span>玩家:1</span><span>场次:1</span></li>
											<li><span>玩家:1</span><span>场次:1</span></li>
											<li><span>玩家:1</span><span>场次:1</span></li>
											<li><span>玩家:1</span><span>场次:1</span></li>
											<li><span>玩家:1</span><span>场次:1</span></li>
											<li><span>玩家:1</span><span>场次:1</span></li>
											<li><span>玩家:1</span><span>场次:1</span></li>
											<li><span>玩家:1</span><span>场次:1</span></li>
											<li><span>玩家:1</span><span>场次:1</span></li>
										</ul>
									</div>
									<div class="tab-content-center-right-bottom">
										<!--<p><span>玩家:1</span>积分:<span>1</span></p>-->
									</div>
								</div>

							</div>
							<!--<div class="tab-content-right"></div>-->
						</div>
					</div>
					<!--<div class="modal-footer">
                    &lt;!&ndash;<button type="button" class="btn btn-default" data-dismiss="modal">
                        关闭</button>&ndash;&gt;
                    &lt;!&ndash; <button type="button" class="btn btn-primary">
                     提交更改
                 </button>&ndash;&gt;
                </div>-->
				</div>
				<!-- /.modal-content -->
			</div>
		</div>
		<!-- /.modal -->


		<!-- 创建房间（Modal） -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">

					<div class="modal-body enter">
						<input type="text" id="roomid" autofocus="autofocus"
							placeholder="房间名">
						<div>
							低中高<input type='range' id="selectSpeed" value='1' min='1' max='3'
								onchange="moveChange()" />
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-lg" data-dismiss="modal" onclick="candelCreateRoom()">
							取消</button>
						<button type="button" class="btn btn-lg" data-dismiss="modal"
							onclick="createRoom()">创建房间</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
		</div>
		<!-- /.modal -->


	</div>

	<!-- 返回游戏首页（Modal） -->
	<div class="modal fade in" id="goIndex" tabindex="-1"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content" id="victory_defeat">
				<img id="myQ" src="img/myQ.png" alt="">
				<div class="modal-content-msg">
					<p id="goIndexText">你赢了</p>
					<p id="goIndexFen">本次积分:</p>
					<p id="goIndexTime">用时:</p>
				</div>
				<!--<button class="btn" id="btnGoIndex" onclick="goIndex()"></button>-->
				<img id="btnGoIndex" onclick="goIndex()" src="img/back.png"></img>
			</div>
			<!-- /.modal-content -->
		</div>
	</div>


	<!-- 等待玩家进入（Modal） -->
	<div class="modal fade in" id="waiting" tabindex="-1"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">

				<p>等待玩家进入</p>
				<!--<button class="btn" onclick="outWaiting()">返回首页</button>-->
				<img src="img/back.png" alt="" onclick="outWaiting()">
			</div>
			<!-- /.modal-content -->
		</div>
	</div>

	<!-- 个人信息 -->
	<div class="modal fade" id="userMsg" tabindex="-1"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">

				<div class="userMsgLeft">
					<button class="btn btn-lg" id="btn_userMsgLeftMsg"
						onclick="userMsgLeftMsg()">个人信息</button>
					<button class="btn btn-lg" id="btn_userMsgLeftHistorical"
						onclick="userMsgLeftHistorical()">历史战绩</button>
					<button class="btn btn-lg" id="btn_userMsgLeftChangePwd" onclick="changePwd()">修改密码</button>
				</div>
				<div class="userMsgRight">
					<div id="userMsgRightMsg">
						<table id="myMsg" border="1px">

							<tbody>
								<tr>
									<td>玩家名:</td>
									<td colspan="3" id="myMsg_userName">pppp</td>
								</tr>
								<tr>
									<td>等级:</td>
									<td id="myMsg_grade">12</td>
									<td>积分:</td>
									<td id="myMsg_integral">12</td>
								</tr>
								<tr>
									<td>场次:</td>
									<td colspan="3" id="myMsg_times">32</td>

								</tr>
								<tr>
									<td>胜利:</td>
									<td id="myMsg_winTimes">2</td>
									<td>失败:</td>
									<td id="myMsg_defeatedTimes">3</td>
								</tr>

							</tbody>

						</table>
					</div>
					<ul id="historicalRecord">


					</ul>
					<ul id="userMsgRightChangePwd">
						<li><input id="oldPwd" type="password" placeholder="旧密码"><span id="span_pwd0">不能为空</span></li>
						<li><input id="newPwd" type="password" placeholder="新密码"><span
							id="span_pwd1">密码不能为空</span></li>
						<li><input id="confirmPwd" type="password" onclick=""
							placeholder="确认密码"><span id="span_pwd2">密码不一致</span></li>
						<li>
							<button class="btn" id="btn_candel" onclick="candelChangePwd()">取消</button>
							<button id="btn_confirm" class="btn">确认</button>
						</li>
					</ul>
				</div>

			</div>
			<!-- /.modal-content -->
		</div>
	</div>

	<!--游戏界面-->
	<div class="playGame" id="myPlayGame">
		<!--<div id="waiting"></div>-->
		<div class="pppppp">
			<div class="square" id="local">
				<div class="title">我的游戏区域</div>
				<div class="game" id="local_game"></div>
				<div class="next" id="local_next"></div>
				<div class="info">
					<div>
						已用时：<span id="local_time">0</span>s
					</div>
					<div>
						已得分：<span id="local_score">0</span>分
					</div>
					<div id="local_gameOver"></div>
				</div>
			</div>

			<div class="square" id="remote">
				<div class="title">对方游戏区域</div>
				<div class="game" id="remote_game"></div>
				<div class="next" id="remote_next"></div>
				<div class="info">
					<div>
						已用时：<span id="remote_time">0</span>s
					</div>
					<div>
						已得分：<span id="remote_score">0</span>分
					</div>
					<div id="remote_gameOver"></div>
					<br />
				</div>
			</div>
		</div>
		<div class="double_talk">
			<div id="double_console" class="double_talk_content"></div>
			<form class="double_talk_send" onsubmit="return false">
				<input type="text" id="double_msg" class="input-talk-double"
					placeholder="聊天">
				 <button type="button" id="btn_sendRoomMessage" onclick="sendRoomMessage()">发送</button>
			</form>
		</div>
	</div>


	<script src="js/jquery.js"></script>
	<script src="js/htmlJs/bootstrap.min.js" type="text/javascript"></script>
	<script src="js/htmlJs/moment.js" type="text/javascript"></script>


	<script src="js/socket.io.js"></script>
	<script src="js/square.js"></script>
	<script src="js/squareFactory.js"></script>
	<script src="js/game.js"></script>
	<script src="js/local.js"></script>
	<script src="js/remote.js"></script>
	<script src="js/script.js"></script>
	<script>


	
	//修改密码
	$("#confirmPwd").focus(function () {
	    $("#span_pwd2").css("visibility", "hidden");
	    $("#btn_confirm").css("background","#c0c0f8");
	
	});
	$("#confirmPwd").blur(function () {
	    if ($("#confirmPwd").val() != $("#newPwd").val()) {
	        $("#span_pwd2").css("visibility", "visible");
	        $("#btn_confirm").css("background","#c0c0f8");
	    }  else {
	        $("#btn_confirm").attr("onclick","confirmPwd();");
	        $("#btn_confirm").css("background","#B0AFF8");
	    }
	    /* else if ($("#newPwd").val() == "") {
	        $("#span_pwd1").css("visibility", "visible");
	    } */
	});
	$("#oldPwd").blur(function (){
		if($("#oldPwd").val()==""){
			$("#span_pwd0").css("visibility","visible");
		}else{
			$("#span_pwd0").css("visibility","hidden");
		}
	});

	$("#newPwd").blur(function () {
	    if ($("#confirmPwd").val() != $("#newPwd").val()) {
	        $("#span_pwd2").css("visibility", "visible");
	        $("#btn_confirm").css("background","#c0c0f8");
	        console.log("不一样");
	    }  else {
	        $("#btn_confirm").attr("onclick","confirmPwd();");
	        $("#btn_confirm").css("background","#B0AFF8");
	        $("#span_pwd2").css("visibility", "hidden");
	    }
	    /* else if ($("#newPwd").val() == "") {
	        $("#span_pwd1").css("visibility", "visible");
	    } */
	});

	//修改密码
	function confirmPwd() {	
		if($("#oldPwd").val()==""){
			$("#span_pwd0").css("visibility", "visible");
		}
		if($("#confirmPwd").val() == $("#newPwd").val() && $("#oldPwd").val()!=""){
			$.get("${pageContext.request.contextPath}/User/updatePassword",
	                {userName:MYNAME,oldPassword:$("#oldPwd").val(),newPassword:$("#newPwd").val()},
	                function (data) {
						if(data=="success"){
							alert("修改密码成功");
						}else if(data=="lose"){
							alert("旧密码错误或新密码不符合规范");
						}
	                }, "text"
	        );
			$("#oldPwd").val("");
		    $("#newPwd").val("");
		    $("#confirmPwd").val("");
		    $("#span_pwd2").css("visibility", "hidden");
		    $("#span_pwd1").css("visibility", "hidden");
		    $("#span_pwd0").css("visibility", "hidden");
		    $("#btn_confirm").removeAttr("onclick");
		    $("#btn_confirm").css("background","#c0c0f8");
		}
	}
	
	function candelChangePwd() {
	    $("#oldPwd").val("");
	    $("#newPwd").val("");
	    $("#confirmPwd").val("");
	    $("#span_pwd2").css("visibility", "hidden");
	    $("#span_pwd1").css("visibility", "hidden");
	    $("#userMsg").modal("hide");
	}


	//点击注册按钮刷新验证码
	function refreshkaptchaImag(){
		 $('#kaptchaImage').attr('src','${pageContext.request.contextPath}/kaptcha?' + Math.floor(Math.random() * 100));
		 $("#reg_userName").val("");
	     $("#reg_pwd").val("");
	     $("#regCheckNumber").val("");
	}
	
	//个人历史战绩的查询
 	$("#btn_userMsgLeftHistorical").click(function (){
 		 $("#userMsgRightMsg").css("display", "none");
         $("#btn_userMsgLeftHistorical").css("background", "#eaa142");
         $("#historicalRecord").css("display", "block");
         $("#userMsgRightChangePwd").css("display", "none");
         $("#btn_userMsgLeftMsg").css("background", "#b2b2fa");
         $("#btn_userMsgLeftChangePwd").css("background", "#b2b2fa");
 		
 		$.get("${pageContext.request.contextPath}/User/fightMessage",
                {userName:MYNAME},
                function (data) {
                	console.log(data.length);
					for(var i=0;i<data.length;i++){
						// console.log(data[i].userName);
						var result=data[i].result;
						if(result==1){
							result="胜利";
						}else{
							result="失败";
						}
						var oppsite=data[i].oppsite;
						var fightTime=data[i].fightTime;
						//parseInt(fightTime)
						var time =getMyDate(fightTime);
						
						/* console.log( a);
						var time=a.format("yyyy-MM-dd"); */
						$("#historicalRecord").append("<li><span><span>比赛时间:</span><span>"+ 
								time +"</span></span><span><span>对手:</span><span>" + 
								oppsite + "</span></span><span><span>结果:</span><span>" +
								result + "</span></span></li>");
					}
                }, "json"
        );
	});	
	
	//个人信息的查询
    $("#myName").click(function (){
    	$("#userMsg").modal("show");
        $("#oldPwd").val("");
        $("#newPwd").val("");
        $("#confirmPwd").val("");
        
        $("#userMsgRightMsg").css("display","block");
        $("#historicalRecord").css("display","none");
        $("#userMsgRightChangePwd").css("display","none");

        $("#btn_userMsgLeftMsg").css("background","#eaa142");
        $("#btn_userMsgLeftHistorical").css("background","#b2b2fa");
        $("#btn_userMsgLeftChangePwd").css("background","#b2b2fa");

        
        console.log("点击myName");
    	console.log(MYNAME);
    	$.get("${pageContext.request.contextPath}/User/FindUserByName",
                {userName:MYNAME},
                function (data) {
                	// console.log(data.userName);
					$("#myMsg_userName").text(data.userName);
					$("#myMsg_grade").text(data.grade);
					$("#myMsg_integral").text(data.integral);
					$("#myMsg_times").text(data.times);
					$("#myMsg_winTimes").text(data.winTimes);
					$("#myMsg_defeatedTimes").text(data.defeatedTimes);
                }, "json"
        );
        
    });
    function userMsgLeftMsg() {
        $("#userMsgRightMsg").css("display", "block");
        $("#btn_userMsgLeftMsg").css("background", "#eaa142");
        $("#historicalRecord").css("display", "none");
        $("#userMsgRightChangePwd").css("display", "none");
        $("#btn_userMsgLeftHistorical").css("background", "#b2b2fa");
        $("#btn_userMsgLeftChangePwd").css("background", "#b2b2fa");

    }
	
    //判断密码长度5~10
    var isPassword=false;
    $("#reg_pwd").blur(function (){
    	var password=$("#reg_pwd").val();
    	if(password.length<5||password.length>10){
    		$("#pwd_len").css("visibility", "visible");
    		isPassword=false;
    		 console.log(isname);
    	}else{
    		$("#pwd_len").css("visibility", "hidden");
    		isPassword=true;
    		 console.log("isPassword"+isPassword);
    	}
    });
    $("#reg_pwd").focus(function (){
    	$("#pwd_len").css("visibility", "hidden");
    });
    
    var isname=false;
    //用户是否已经注册
    $("#reg_userName").blur(function () {
        console.log("onExistUser");
        if ($("#reg_userName").val() == "") {
           /*  alert("用户名不能为空！"); */
          	 $("#exist").html("用户名不能为空");
        	 $("#exist").css("visibility","visible");
        	 isname=false;
        } else {
            $.get("${pageContext.request.contextPath}/User/notExistUsername",
                {userName: $("#reg_userName").val()},
                function (data) {

                    if (!data) {
                    	 /* alert("该用户已经存在，请重新输入！"); */
                    	 $("#exist").html("该用户已经存在");
                     	 $("#exist").css("visibility","visible");
                     	isname=false;
                    } else {
                    	isname=true;
                    }
                }, "json"
            );
        }
    })
      $("#reg_userName").focus(function () {
        $("#exist").css("visibility","hidden");
        isname=true;
    });
    

    //变换验证码
    $('#kaptchaImage').click(function() {
        $(this).attr('src','${pageContext.request.contextPath}/kaptcha?' + Math.floor(Math.random() * 100));
    });


    //用户注册
    function registerUser() {
        if ($("#reg_userName").val() == "" || $("#reg_pwd").val() == "") {
            alert("用户名/密码不能为空！");
        } else if(isname==true&&isPassword==true) {
            $.get("${pageContext.request.contextPath}/User/RegisterUser",
                {userName: $("#reg_userName").val(), password: $("#reg_pwd").val(),kaptcha:$("#regCheckNumber").val()},
                function (a) {
					console.log(a);
	                if (a=="kaptcha_error"){
	                    alert("验证码错误！");
	                    $('#kaptchaImage').attr('src','${pageContext.request.contextPath}/kaptcha?' + Math.floor(Math.random() * 100));
	                }else if(a=="success") {
	                    alert("注册成功！");
	                    $("#reg").modal("hide");
                        $("#exist").css("visibility","hidden");

                        $("#reg_userName").val("");
                        $("#reg_pwd").val("");
                        $("#regCheckNumber").val("");
	                } else{
	                   alert("注册失败/用户已经存在");
	                }
                }, "text"
            );
        }
    }

    function fightingClick() {

        $("#myLevel").css("display", "block");
        $("#userActive").css("display", "none");

        $("#fightingClick").css("background", "#eaa142");
        $("#activeClick").css("background", "#b2b2fa");

    }

    function losebd() {
        this.css("border", "none");

    }

    function candelRegisterUser(){
        $("#exist").css("visibility","hidden");

        $("#reg_userName").val("");
        $("#reg_pwd").val("");
        $("#regCheckNumber").val("");
    }


    //打开修改密码
    function changePwd() {
        $("#btn_userMsgLeftChangePwd").css("background", "#eaa142");
        $("#btn_userMsgLeftMsg").css("background", "#b2b2fa");
        $("#btn_userMsgLeftHistorical").css("background", "#b2b2fa");

        $("#historicalRecord").css("display", "none");
        $("#userMsgRightMsg").css("display", "none");
        $("#userMsgRightChangePwd").css("display", "block");
    }


    //获取排行榜的战斗力数据
    function getRanking(){
    	 $("#fightingClick").css("background", "#eaa142");
         $("#activeClick").css("background", "#b2b2fa");
         
         $("#myLevel").css("display", "block");
         $("#userActive").css("display", "none");

    	
        $.get("${pageContext.request.contextPath}/Ranking/integralRanking",
            function (data) {
                $("#myLevel").empty();
                for (var i = 0; i < data.length; i++){

                	$("#myLevel").append("<li> <div class='myLevelLiTop'>" +
                            "<span><span>玩家:</span><span>" + data[i].userName + "</span></span>" +
                            "<span><span>积分:</span><span>" + data[i].integral + "</span></span>" +
                            "<span><span>等级:</span><span>" + data[i].grade + "</span></span>" +
                       " </div> <div class='wrapper'> <div class='progressbar'>" +
                                "<div class='fill bar mint' style='width:"+data[i].integral+"px'></div></div> </div></li>");
                	
                   /*  $("#myLevel").append("<li><span>"+data[i].userName+"</span><span>积分："+data[i].integral+" 等级："+data[i].grade+"</span><div class='wrapper'><div class='progressbar'><div class='fill' style='width:"+data[i].integral+"px'></div></div> </div></li>")
            */     }
            }, "json"
        );
    }

    //获取排行榜的用户活跃数据
    function activeClick() {
        $("#myLevel").css("display","none");
        $("#userActive").css("display","block");
        $("#fightingClick").css("background","#b2b2fa");
        $("#activeClick").css("background","#eaa142");
        $.get("${pageContext.request.contextPath}/Ranking/timesRanking",
            function (data) {

                $("#userActive").empty();
                for (var i = 0; i < data.length; i++){
                    $("#userActive").append("<li><span><span>玩家:</span><span>"+data[i].userName+"</span></span>"+
                    		"<span><span>场次:</span><span>"+data[i].times+"</span></span></li>");
                }
            }, "json"
        );
    }

    function getMyDate(str){
        var oDate = new Date(str),
            oYear = oDate.getFullYear(),
            oMonth = oDate.getMonth()+1,
            oDay = oDate.getDate(),
            oHour = oDate.getHours(),
            oMin = oDate.getMinutes(),
            oSen = oDate.getSeconds(),
            oTime = oYear +'-'+ getzf(oMonth) +'-'+ getzf(oDay) +' '+ getzf(oHour) +':'+ getzf(oMin) +':'+getzf(oSen);//最后拼接时间
        return oTime;
    };
    //补0操作
    function getzf(num){
        if(parseInt(num) < 10){
            num = '0'+num;
        }
        return num;
    }
    function aa() {
        var data = getMyDate(1488850813000);
        alert(data);
    }


    /*$("body").bind("contextmenu", function(event) {
        return false;
    });


    $("body").bind("keydown",function(e){
        e=window.event||e;

        //禁止空格键翻页
        if(event.keyCode==32){
            return false;
        }

        //屏蔽F5刷新键
        if(event.keyCode==116){
            e.keyCode = 0; //IE下需要设置为keyCode为false
            return false;
        }

        //屏蔽 Alt+ 方向键 ←
        //屏蔽 Alt+ 方向键 →
        if ((event.altKey)&&((event.keyCode==37)||(event.keyCode==39)))
        {
            event.returnValue=false;
            return false;
        }

        //屏蔽退格删除键
        if(event.keyCode==8){
            return false;
        }

        //屏蔽ctrl+R
        if((event.ctrlKey) && (event.keyCode==82)){
            e.keyCode = 0;
            return false;
        }
    });
*/


</script>
</body>
</html>