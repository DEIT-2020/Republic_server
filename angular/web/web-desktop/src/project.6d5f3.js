window.__require=function t(e,i,o){function n(r,a){if(!i[r]){if(!e[r]){var c=r.split("/");if(c=c[c.length-1],!e[c]){var u="function"==typeof __require&&__require;if(!a&&u)return u(c,!0);if(s)return s(c,!0);throw new Error("Cannot find module '"+r+"'")}r=c}var h=i[r]={exports:{}};e[r][0].call(h.exports,function(t){return n(e[r][1][t]||t)},h,h.exports,t,e,i,o)}return i[r].exports}for(var s="function"==typeof __require&&__require,r=0;r<o.length;r++)n(o[r]);return n}({game:[function(t,e,i){"use strict";cc._RF.push(e,"240caO11TFP/qmuRsnhIXov","game");var o=0,n=new Array;if(null!=window.localStorage[0])for(var s=0;s<10;s++){var r=s+10;n[s]={question:window.localStorage[s],answer:window.localStorage[r]}}else n=[{question:"\u6b32\u7a77\u5343\u91cc\u76ee",answer:"\u66f4\u4e0a\u4e00\u5c42\u697c"},{question:"\u591c\u9611\u5367\u542c\u98ce\u5439\u96e8",answer:"\u94c1\u9a6c\u51b0\u6cb3\u5165\u68a6\u6765"},{question:"\u6700\u7231\u6e56\u4e1c\u884c\u4e0d\u8db3",answer:"\u7eff\u6768\u9634\u91cc\u767d\u6c99\u5824"},{question:"\u6211\u81ea\u6a2a\u5200\u5411\u5929\u7b11",answer:"\u53bb\u7559\u809d\u80c6\u4e24\u6606\u4ed1"},{question:"\u6843\u82b1\u6f6d\u6c34\u4e09\u5343\u5c3a",answer:"\u4e0d\u53ca\u6c6a\u4f26\u9001\u6211\u60c5"},{question:"\u84b9\u846d\u82cd\u82cd",answer:"\u767d\u9732\u4e3a\u971c"},{question:"\u65e0\u4e1d\u7af9\u4e4b\u4e71\u8033",answer:"\u65e0\u6848\u724d\u4e4b\u52b3\u5f62"},{question:"\u9189\u5367\u6c99\u573a\u541b\u83ab\u7b11",answer:"\u53e4\u6765\u5f81\u6218\u51e0\u4eba\u56de"},{question:"\u5527\u5527\u590d\u5527\u5527",answer:"\u6728\u5170\u5f53\u6237\u7ec7"},{question:"\u5e8a\u524d\u660e\u6708\u5149",answer:"\u7591\u662f\u5730\u4e0a\u971c"}];cc.Class({extends:cc.Component,properties:{ballon:cc.Node,answerInput:cc.EditBox,question2:cc.Label,question:cc.Node,scoreDisplay:cc.Label,right:{type:cc.Label,default:null},overBG:cc.Node,overLabel:cc.Node,overbtnlb:cc.Node,overButton:cc.Button},onLoad:function(){this.question2.string=n[o].question,this.ballonLoad(),this.answerInputLoad(),this.scoreLoad(),this.questionLoad(n[o].question),this.overLoad()},overLoad:function(){this.overBG.x=1e4,this.overBG.y=1e4,this.overLabel.x=1e4,this.overLabel.y=1e4,this.overButton.x=1e4,this.overButton.y=1e4,this.overbtnlb.x=2e4,this.overbtnlb.y=2e4},rightLoad:function(t){this.right.x=5.992,this.right.y=250,this.right.string=t},fallingDown:function(){var t=cc.moveBy(10,0,-100);return cc.repeatForever(t)},ballonLoad:function(){this.ballon.x=8.988,this.ballon.y=290.612,this.ballon.active=!0,this.ballon.Action=this.fallingDown(),this.ballon.runAction(this.ballon.Action)},questionLoad:function(t){this.question.x=10.533,this.question.y=284,console.log(t),this.question.active=!0,this.question2.string=t,this.question.Action=this.fallingDown(),this.question.runAction(this.question.Action)},answerInputLoad:function(){this.answerInput.node.on("editing-did-ended",this.editEnd,this)},scoreLoad:function(){this.score=0},editEnd:function(t){if(this.answerInput.string==n[o].answer)return this.rightLoad("\u56de\u7b54\u6b63\u786e\uff01"),o++,this.answerInput.string="",this.gainScore(),this.ballon.active=!1,this.question.active=!1,this.ballonLoad(),void this.questionLoad(n[o].question);this.rightLoad("\u56de\u7b54\u9519\u8bef\uff01")},sleep:function(t){console.log("sl");for(var e=new Date,i=e.getTime()+t;;)if((e=new Date).getTime()>i)return},answerCorrect:function(){this.right.opacity=255},gainScore:function(){this.score+=1,this.scoreDisplay.string="Score: "+this.score},start:function(){},gameOver:function(){this.overBG.x=55,this.overBG.y=82,this.overLabel.x=31,this.overLabel.y=-30,this.overButton.x=169,this.overButton.y=474,this.overbtnlb.x=252.90613,this.overbtnlb.y=471,this.overbtnlb.string="",10==this.score?this.rightLoad("\u6e38\u620f\u80dc\u5229"):this.rightLoad("\u6e38\u620f\u5931\u8d25!"),sessionStorage.setItem("score",this.score),this.question.opacity=0,this.ballon.opacity=0,setTimeout(window.history.back(),1e4)},update:function(t){this.ballon.y<-140&&this.gameOver(),10==o&&this.gameOver()}}),cc._RF.pop()},{}]},{},["game"]);