/* コマンド選択 要jQuelly */

'use strict';

(function () {

  sangoku.namespace('player.mypage.controllCommand');

  sangoku.player.mypage.controllCommand = function () {
    this.keyHit = 0;
    this.mouseHit = 0;
    this.beforeId = null;
    this.checkId = null;
  };

  var PROTOTYPE = sangoku.player.mypage.controllCommand.prototype;

  PROTOTYPE.changeUserSelect = function (type) {
    $("#user-select-text").toggle();
    $("#user-select-none").toggle();
    $("#commandlist").css("user-select", type).css("-moz-user-select", type).css("-webkit-user-select", type).css("-ms-user-select", type);
  };
  
  PROTOTYPE.addCheck = function () {
    var box = document.getElementById(this.checkId);
    box.style.backgroundColor = "#4682B4";
    box.style.color = "#ffffff";
    $("#commandlist input[value=" + this.checkId + "]").prop('checked', true);
  };
  
  PROTOTYPE.removeCheck = function () {
    var box = document.getElementById(this.checkId);
    box.style.backgroundColor = "#ffffff";
    box.style.color = "#000000";
    $("#commandlist input[value=" + this.checkId + "]").prop('checked', false); 
  };
  
  PROTOTYPE.pushShiftSelect = function (checkFunc) {
    if (this.keyHit) {
      if (this.beforeId > this.checkId) {
        if (!this.beforeId < this.checkId) {
          var tmp = this.beforeId;
          this.beforeId = this.checkId;
          this.checkId = tmp;
        }
      }
      var n = 0;
      for (var i = this.beforeId; i <= this.checkId ;i++) {
        checkFunc(i);
        n++;
      }
    }
  };

  PROTOTYPE.selectList = function () {
    var select;
    var dom = document.getElementsByName("no");
    var start = parseInt(document.select.start.value) - 1;
    var interval = parseInt(document.select.interval.value);
    var domLength = dom.length;
    for (select = 0; select < domLength; select++) {
      dom[select].checked = false;
      var box = document.getElementById(select);
      box.style.backgroundColor = "#ffffff"; 
      box.style.color = "#000000"; 
    }
    for (select = start; select < domLength; select += interval) {
      dom[select].checked = true;
      var box = document.getElementById(select);
      box.style.backgroundColor = "#4682B4"; 
      box.style.color = "#ffffff"; 
    }
  };

  PROTOTYPE.registFunctions = function () {
    var self = this;

    $("#remove_allcheck").mouseup(function(){
      $("#commandlist input").prop('checked', false);
      $("#commandlist tr").css("background", "#FFFFFF").css("color", "#000000");
    });
  
    $("#user-select-text").mouseup(function () { self.changeUserSelect("text"); });
    $("#user-select-none").mouseup(function () { self.changeUserSelect("none"); });
  
    $(window).keydown(function (e) {
      if (e.keyCode === 16) { self.keyHit = 1; }
    });
    $(window).keyup(function (e) {
      if (e.keyCode === 16) { self.keyHit = 0; }
    });

    $("#result").on('mousedown', '#commandlist tr', function () {
      self.checkId = $(this).attr("id");
      if (!$("#commandlist input[value=" + self.checkId + "]").prop('checked')) {
        self.addCheck(self.checkId);
        self.pushShiftSelect(self.addCheck);
      } else {
        var box = document.getElementById(self.checkId);
        self.removeCheck(self.checkId);
        self.pushShiftSelect(self.removeCheck);
      }
      self.beforeId = self.checkId;
    });
  
    $("#result").on('mousedown', '#commandlist', function () { self.mouseHit = 1; });
    $("#result").on('mouseup', '#commandlist', function () { self.mouseHit = 0; });
    $("#result").on('mouseover', '#commandlist tr', function () {
      if (self.mouseHit) {
        self.checkId = $(this).attr("id");
        !$("#commandlist input[value=" + self.checkId + "]").prop('checked') ? self.addCheck(self.checkId) : self.removeCheck(self.checkId);
      }
    });
    
    document.getElementById('select').addEventListener('click', self.selectList, false);
  
  };

}());
