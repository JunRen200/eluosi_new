/**
 * Created by Administrator on 2017/9/19.
 */
var Remote=function(socket){
    var game;

    var bindEvents=function(){
        socket.on("init",function(data){
            start( data.type , data.dir );
        });
        socket.on("next",function(data){
            game.performNext(data.type , data.dir);
        });
        socket.on("rotate",function(data){game.rotate();});
        socket.on("right",function(data){game.right();});
        socket.on("down",function(data){game.down();});
        socket.on("left",function(data){game.left();});
        socket.on("fall",function(data){game.fall();});
        socket.on("line",function(data){game.checkClear();game.addScore(data.line)});
        socket.on("fixed",function(data){game.fixed();});
        socket.on("time",function(data){ game.setTime(data.time);});
        socket.on("lose",function(data){game.gameover(false); });
        socket.on("addTailLines",function(data){ game.addTailLines(data.bottomLines);});
        //socket.on("fixed",function(data){game.fixed();});

        //document.getElementById("down").onclick=function(){game.down();}
        //document.getElementById("left").onclick=function(){game.left();}
        //document.getElementById("right").onclick=function(){game.right();}
        //document.getElementById("rotate").onclick=function(){game.rotate();}
        //document.getElementById("fall").onclick=function(){game.fall();}
        //document.getElementById("fixed").onclick=function(){game.fixed();}
        //document.getElementById("performNext").onclick=function(){game.performNext(2,2);}
        //document.getElementById("checkClear").onclick=function(){game.checkClear();}
        //document.getElementById("checkGameOver").onclick=function(){game.checkGameOver();}
        //document.getElementById("setTime").onclick=function(){game.setTime(20);}
        //document.getElementById("addScore").onclick=function(){game.addScore(1);}
        //document.getElementById("gameover").onclick=function(){game.gameover(true);}
        //document.getElementById("addTailLines").onclick=function(){game.addTailLines([[1,0,1,1,1,1,0,0,0,0]]);}
    }

    var start=function(type,dir){
        var doms={
            gameDiv:document.getElementById("remote_game"),
            nextDiv:document.getElementById("remote_next"),
            timeDiv:document.getElementById("remote_time"),
            scoreDiv:document.getElementById("remote_score"),
            resultDiv:document.getElementById("remote_gameOver")

        }

        game=new Game();
        game.init(doms,type,dir);
    }
    bindEvents();

}