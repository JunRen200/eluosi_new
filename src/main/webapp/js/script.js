var socket = io.connect('http://192.168.70.26' +
    ':9099');

var local=new Local(socket);

var ROOMID;
var MYNAME;
//速度
var SPEED=800;
new Remote(socket);


function openGame(){

    var obj = new Object();
    obj.name="51js";

    var iWidth = 420;
    var iHeight = 600;
    var iTop = (window.screen.availHeight - 30 - iHeight) / 2;
    var iLeft = (window.screen.availWidth - 10 - iWidth) / 2;
    // window.showModalDialog("单机/index.html",obj,"dialogWidth=400px;dialogHeight=600px;scroll:no");
    window.open("单机/index.html", "弹出窗口", "width=" + iWidth + ", height=" + iHeight + ",top=" + iTop + ",left=" + iLeft + ",toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no,alwaysRaised=yes,depended=yes");
}

/*判断web端是否连接服务器*/
socket.on('connect', function () {
    console.log("connect");
});

//服务器的roomds方法，刷新房间列表
socket.on('roomds', function (data) {
    $("#roomList").empty();//先清空已有的用户，然后在添加所有的
    for (var i = 0; i < data.length; i++){
        addRoom(data[i]);
    }

});


//web端页面添加房间列表，玩家可以点击“进入”，进行双人对战
function addRoom(userName) {
    var element = "<li>" + userName + "<a onclick='enterRoom(\""+userName+"\")'>进入</a></li>";
    $("#roomList").prepend(element);
}

//玩家进入房间后，web端传roomId到服务器端，销毁房间
function enterRoom(data) {

    //传键值对roomId:data给服务器
    socket.emit("enterRoom",{roomId:data});
    ROOMID=data;
    $("#playSel").css("display","none");
    $("#loginPage").css("display","none");
    $("#myPlayGame").css("display","block");
}

//input滑块移动获取值
function moveChange() {
    SPEED = $("#selectSpeed").val();
    if(SPEED == 1){
        SPEED == 800;
    }else if (SPEED == 2){
        SPEED = 600;
    }else if(  SPEED = 3){
        SPEED = 300;
    }

    console.log("SPEED:"+SPEED);

}

//取消创建房间
function candelCreateRoom() {
    $("#roomid").val("");
    $("#selectSpeed").val("1");
    SPEED=800;
}

//点击打开创建房间
function openCreateRoom(){
    $("#roomid").val("");
    $("#selectSpeed").val("1");
    SPEED=800;
}


//玩家创建房间，等待另外的玩家进入游戏
function createRoom(){
    var v=$("input[id='roomid']").val();
    ROOMID = v;
    /*
    * 通知服务器调用服务器的reateRoom这个方法
    * */
    if(v.length==0){
        alert("房间不能为空！")
    }else {
        socket.emit("createRoom",{roomId:v,speed:SPEED});
    }


}
/**
 *该房间已经创建,创建成功进入waiting
 *
 */
socket.on('createRoom', function () {

        alert("该房间已经创建，请重新输入！");
        $("#roomid").val("");
        $("#selectSpeed").val("1");
        SPEED=800;


});

/*创建成功进入waiting*/
socket.on('waiting', function (str) {
    $("#playSel").css("display","none");
    $("#loginPage").css("display","none");
    $("#myPlayGame").css("display","block");
    $(".modal-backdrop").css("display","none");

    /*等待页面*/
    $("#waiting").css("display","block");

    $("#roomid").val("");
    $("#selectSpeed").val("1");
    SPEED=800;

    console.log("wating"+str);
});


function login(){
    var username=$("input[name='username']").val();
    var password=$("input[name='password']").val();
    MYNAME=username;

    if (username==null || password ==null){
        alert("用户名/密码不正确!");
    }else {
        socket.emit("login",{userName:username,password:password});

    }

}

socket.on('login', function (data) {
   /*alert(data);*/
   console.log(data);
   if(data==2){
       $("#myName").html(MYNAME);
       $("#playSel").css("display","block");
       $("#loginPage").css("display","none");
   }else if(data==0){
       alert("用户名/密码不正确!");
    }else if(data==1){
       alert("该用户已经登录");
   }


});

/*收到广播的在线用户*/
socket.on('getOnLineUser', function (data) {
    console.log(11111111);
    console.log(data);
    $("#userList").empty();
    for (var i = 0; i < data.length; i++){

        $("#userList").append("<li>"+data[i]+"</li>");
        /*$("#userList").append("<li>12</li>");*/
    }
});



<!-- 游戏结束返回游戏首页-->
function goIndex() {
    $("#playSel").css("display","block");
    $("#myPlayGame").css("display","none");
    $("#goIndex").css("display","none");
    $("#waiting").css("display","none");

    //清除积分时间
    $("#local_time").html("");
    $("#local_score").html("");
    $("#local_gameOver").html("");
    $("#remote_time").html("");
    $("#remote_score").html("");
    $("#remote_gameOver").html("");



}

<!-- 等待玩家进入（Modal）按返回销毁房间 -->
function outWaiting() {
    $("#playSel").css("display","block");
    $("#myPlayGame").css("display","none");
    $("#goIndex").css("display","none");

    /*
   * 通知服务器调用服务器的cancelRoom这个方法，销毁房间
   * */
     socket.emit("cancelRoom",{roomId:ROOMID});
    $("#waiting").css("display","none");
}

/*广播聊天*/
$("#msg").blur(function () {
    var message = $("#msg").val();
    if(message.length>0){
        $("#btn_sendMessage").attr("onclick","sendMessage();");
    }else {
        $("#btn_sendMessage").removeAttr("onclick");
    }

})
function sendMessage() {
    var message = $("#msg").val();
    var userName = MYNAME;
    var jsonObject = {
        userName: userName,
        message: message
    };
    socket.emit('chatEvent', jsonObject);
    $("#msg").val("");
    $("#btn_sendMessage").removeAttr("onclick");
}
socket.on('chatEvent', function(data){
    console.log(data.userName +" "+data.message);
    $('#console').append('<p class="username-msg" style="color: #0e90d2"> ' + moment().format('HH:mm:ss.SSS')+"     "+"<span>"+data.userName+"</span>" + ':</p> ' + data.message+'<br/>');
    /*$('#console').scrollTop = $('#console').prop('scrollHeight');*/
    var bb = $('#console').prop("scrollTop");
    $('#console').scrollTop($('#console').prop('scrollHeight'));
    console.log("scrollHeight:"+$('#console').prop('scrollHeight')+"    scrollTop:"+bb);
});


/*房间聊天*/
$("#double_msg").blur(function () {
    var message = $("#double_msg").val();
    if(message.length>0){
        $("#btn_sendRoomMessage").attr("onclick","sendRoomMessage();");
    }else {
        $("#btn_sendRoomMessage").removeAttr("onclick");
    }

})
function sendRoomMessage() {
    var message = $("#double_msg").val();

    var jsonObject = {
        message: message
    };
    $('#double_console').append('<p class="username-msg" style="color: #0e90d2"> ' + moment().format('HH:mm:ss.SSS')+"     "+"<span>"+MYNAME+"</span>" + ':</p> ' + message+'<br/>');
    var bb = $('#double_console').prop("scrollTop");
    $('#double_console').scrollTop($('#double_console').prop('scrollHeight'));
    socket.emit('chatRoom', jsonObject);
    $("#double_msg").val("");
    $("#btn_sendRoomMessage").removeAttr("onclick");
}
socket.on('chatRoom', function(data){
    console.log("data.userName:"+data.userName);
    $('#double_console').append('<p class="username-msg" style="color: #0e90d2"> ' + moment().format('HH:mm:ss.SSS')+"     "+"<span>"+data.userName+"</span>" + ':</p> ' + data.message+'<br/>');

    /*$('#console').scrollTop = $('#console').prop('scrollHeight');*/
    var bb = $('#double_console').prop("scrollTop");
    $('#double_console').scrollTop($('#double_console').prop('scrollHeight'));
    $("#double_msg").html("");

});