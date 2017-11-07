/**
 * Created by Administrator on 2017/9/19.
 */
var Local=function(socket){
    var game;
    var timer=null;
    var timeCount=0;
    var time=null;
    var myTime=null;
    var bindKeyEvent=function(){
        document.onkeydown=function(e){
            switch (e.keyCode){
                case 38://up
                    game.rotate();
                    socket.emit("rotate");
                    break;
                case 39://right
                    game.right();
                    socket.emit("right");
                    break;
                case 40://down
                    game.down();
                    socket.emit("down");
                    break;
                case 37://left
                    game.left();
                    socket.emit("left");
                    break;
                case 32://space
                    game.fall();
                    socket.emit("fall");
                    break;


            }
        }
    }


    //移动
    var move=function(){
        if(!game.down()){
            game.fixed();
            socket.emit("fixed");
            var line=game.checkClear();
            if(line){
                game.addScore(line);
                socket.emit("line",{line:line});
                if(line>1){
                    var bottomLines=gernerataBottomLine(line);
                    console.log("发送"+bottomLines);
                    socket.emit("bottomLines",{bottomLines:bottomLines});
                }
            }
           var gameOver= game.checkGameOver();

            if(gameOver){
                game.gameover(false);
                document.getElementById("remote_gameOver").innerHTML="你赢了";
                socket.emit('lose');
                console.log("你输了！");
                stop();

                $("#goIndex").css("display","block");

                $("#goIndexText").html("你输了！");
                $("#goIndexFen").html("本次得分:"+game.getScore());
                $("#goIndexTime").html("用时:"+time+"s");

                $("#myQ").attr("src","img/myQ3.png");
                $("#myQ").css({ "height":"65px",
                                "margin-top": "265px",
                                "margin-left": "390px",
                                "animation-name": "moveDefeat,movebackDefeat",
                                "animation-duration":"2s, 0s",
                                "animation-timing-function":"linear,linear",
                                "animation-delay":"0s,2s",
                                "animation-iteration-count":"2, 1",
                                "animation-fill-mode":"forwards ,both",
                                "animation-direction":"alternate, alternate"});

            }else {
                var t=generateType();
                var d=generateDir();
                game.performNext(t,d);
                socket.emit("next",{ type:t ,dir:d});
            }

        }else{
            socket.emit("down");
        }
    }

    //随机生成干扰行
    var gernerataBottomLine=function(lineNum){
    var lines=[];
        for(var i=0;i<lineNum;i++){
            var line=[];
            for(var j=0;j<10;j++){
                line.push(Math.ceil(Math.random()*2)-1);
            }
            lines.push(line);
        }
        return lines;
    }


    //计时
    var timeFunc=function(){
        timeCount+=1;
        if(timeCount==5){
            timeCount=0;
            time=time+1;
            game.setTime(time);
            $("#remote_time").html(time);
           /* socket.emit('time',{time:time});*/
            //if(time%5==0){
            //    game.addTailLines(gernerataBottomLine(1));
            //}
        }
    }

    //随机生成一个方块
    var generateType=function(){
        return Math.ceil( Math.random()*7)-1;
    }
    //随机生成一个旋转
    var generateDir=function(){
        return Math.ceil( Math.random()*4)-1;
    }


    //开始
    var start= function (data) {
        document.getElementById("waiting").display="none";
        /*document.getElementById("myModal").display="none";*/

        $(".modal-backdrop").css("display","none");

        var doms={
            gameDiv:document.getElementById("local_game"),
            nextDiv:document.getElementById("local_next"),
            timeDiv:document.getElementById("local_time"),
            scoreDiv:document.getElementById("local_score"),
            resultDiv:document.getElementById("local_gameOver")
        }

        game=new Game();
        var type=generateType();
        var dir=generateDir();

        game.init(doms,type,dir);
        socket.emit("init",{ type:type ,dir:dir});
        bindKeyEvent();

        var t=generateType();
        var d=generateDir();
        game.performNext(t,d);
        socket.emit("next",{ type:t ,dir:d});

        timer=setInterval(move,data);
        myTime=setInterval(timeFunc,200);
    }
    var stop=function(){
        if(timer){
            clearInterval(timer);
            clearInterval(myTime);
            timer=null;
            myTime=null;

        }
        document.onkeydown=null;
    }

    //start指令同时令双方开始游戏
    socket.on('start', function (data) {
        console.log("data_speed:"+data);
        time=null;
        $("#waiting").css("display","none");
        start(data);


    });

    /*对方输*/
    socket.on('lose', function () {

        game.gameover(true);
        stop();
        $("#goIndexText").html("你赢了！");
        $("#goIndexFen").html("本次得分:"+game.getScore());
        $("#goIndexTime").html("用时:"+time+"s");


       /* $("#victory_defeat").css("background","#a1a0fe url(\"img/yun.png\") no-repeat");*/
        $("#goIndex").css("display","block");
        /*$("#btnGoIndex").css("background","#a1a0fe");*/

        $("#myQ").attr("src","img/myQ.png");
        $("#myQ").css({ "height":"95px",
            "margin-left":"480px",
            "margin-top":"0px",
            "animation": "moveVictory 1s ease 1s infinite alternate",
            "margin-left":"480px"});

        console.log("你赢了！");



    });

    /*对方掉线*/
    socket.on('leave', function () {
        document.getElementById("local_gameOver").innerHTML="对方掉线"
        document.getElementById("remote_gameOver").innerHTML="已掉线"

        stop();
        $("#goIndexText").html("对方掉线,你赢了！");
        $("#goIndex").css("display","block");
        $("#goIndexFen").html("本次得分:"+game.getScore());
        $("#goIndexTime").html("用时:"+time+"s");

        $("#myQ").attr("src","img/myQ.png");
        $("#myQ").css({ "height":"95px",
            "margin-left":"480px",
            "margin-top":"0px",
            "animation": "moveVictory 1s ease 1s infinite alternate",
            "margin-left":"480px"});


       /* $("#victory_defeat").css("background","#f73d3a url(\"img/yun.png\") no-repeat");
        $("#btnGoIndex").css("background","#f73d3a");*/


    });

    socket.on('bottomLines', function (data) {
        console.log(data);
       game.addTailLines(data.bottomLines);
        socket.emit("addTailLines",data);
    });
}