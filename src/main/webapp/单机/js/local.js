/**
 * Created by Administrator on 2017/9/19.
 */
var Local=function(){
    var game;
    var INTERVAL=500;
    var timer=null;
    var timeCount=0;
    var time=0;
    var  myTime=null;
    var bindKeyEvent=function(){
        document.onkeydown=function(e){
            switch (e.keyCode){
                case 38://up
                    game.rotate();
                    break;
                case 39://right
                    game.right();
                    break;
                case 40://down
                    game.down();
                    break;
                case 37://left
                    game.left();
                    break;
                case 32://space
                    game.fall();
                    break;


            }
        }
    }

    //移动
    var move=function(){
        if(!game.down()){
            game.fixed();
            var line=game.checkClear();
            if(line){
                game.addScore(line);
            }
           var gameOver= game.checkGameOver();
            if(gameOver){
                game.gameover(false);
                stop();
            }else {
                game.performNext(generateType(), generateDir());
            }

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
    var start= function () {
        var doms={
            gameDiv:document.getElementById("local_game"),
            nextDiv:document.getElementById("local_next"),
            timeDiv:document.getElementById("local_time"),
            scoreDiv:document.getElementById("local_score"),
            resultDiv:document.getElementById("local_gameOver")
        }

        game=new Game();
        game.init(doms,generateType(),generateDir());
        bindKeyEvent();
        game.performNext(generateType(),generateDir());
        timer=setInterval(move,INTERVAL);
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

    //导出API
    this.start=start;
}