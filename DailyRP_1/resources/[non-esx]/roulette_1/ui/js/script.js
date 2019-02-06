

var options = ["0", "0.5", "0", "0", "1", "0", "0", "2", "0.5", "0", "0", "0", "0", "3", "0", "0", "0", "0", "4", "0", "0", "1", "0", "0", "5", "0", "0", "0", "2", "0"];

var startAngle = 0;
var arc = Math.PI / (options.length / 2);
var spinTimeout = null;

var spinArcStart = 10;
var spinTime = 0;
var spinTimeTotal = 0;
var  betvalue = 100;
var winnings =0;
var ctx;


window.addEventListener('message', function(event){


	 var eData = event.data;

	 if(eData.show == true) {
      $(".page").addClass("show");
      $(".page").removeClass("hide");
	  drawRouletteWheel();
		var c = document.getElementById("myCanvas");
		var ctx = c.getContext("2d");

		ctx.font = "20px Impact, Charcoal, sans-serif";
		ctx.fillText(betvalue+"$", 10, 50);


		var b = document.getElementById("victory");
		var ctx = b.getContext("2d");

		ctx.font = "20px Impact, Charcoal, sans-serif";
		ctx.fillText(winnings+"$", 10, 50);
        
      
    }else if(eData.show == false) {
      $(".page").addClass("hide");
      $(".page").removeClass("show");
    }


	
	if(eData.canspin == true) {
		
			spin();
	}

});



  $(document).ready(function() {
   
    $(".page").addClass("hide");
    
    $('*').on('click', function(event) {
      var id = event.target.id;
      if(id.includes("listElem_")) {
        copyToClipboard("#"+id);
     }
         
    });
  });
 

function byte2Hex(n) {
  var nybHexString = "0123456789ABCDEF";
  return String(nybHexString.substr((n >> 4) & 0x0F,1)) + nybHexString.substr(n & 0x0F,1);
}

function RGB2Color(r,g,b) {
	return '#' + byte2Hex(r) + byte2Hex(g) + byte2Hex(b);
}

function getColor(item, maxitem) {
  var phase = 0;
  var center = 128;
  var width = 127;
  var frequency = Math.PI*2/maxitem;
  
  red   = Math.sin(frequency*item+2+phase) * width + center;
  green = Math.sin(frequency*item+0+phase) * width + center;
  blue  = Math.sin(frequency*item+4+phase) * width + center;
  
  return RGB2Color(red,green,blue);
}

function drawRouletteWheel() {
  var canvas = document.getElementById("canvas");
  if (canvas.getContext) {
    var outsideRadius = 205;
    var textRadius = 170;
    var insideRadius = 125;

    ctx = canvas.getContext("2d");
    ctx.clearRect(0,0,500,500);

    ctx.strokeStyle = "black";
    ctx.lineWidth = 0;

    ctx.font = 'bold 18px Impact, Charcoal, sans-serif';

    for(var i = 0; i < options.length; i++) {
      var angle = startAngle + i * arc;
      //ctx.fillStyle = colors[i];
      ctx.fillStyle = getColor(i, options.length);

      ctx.beginPath();
      ctx.arc(250, 250, outsideRadius, angle, angle + arc, false);
      ctx.arc(250, 250, insideRadius, angle + arc, angle, true);
      ctx.stroke();
      ctx.fill();

      ctx.save();
      ctx.shadowOffsetX = -1;
      ctx.shadowOffsetY = -1;
      ctx.shadowBlur    = 0;
      
      ctx.fillStyle = "black";
      ctx.translate(250 + Math.cos(angle + arc / 2) * textRadius, 
                    250 + Math.sin(angle + arc / 2) * textRadius);
      ctx.rotate(angle + arc / 2 + Math.PI / 2);
      var text = options[i];
      ctx.fillText(text, -ctx.measureText(text).width / 2, 0);
      ctx.restore();
    } 

    //Arrow
    ctx.fillStyle = "black";
    ctx.beginPath();
   
    ctx.fill();
  }
}

function spin() {
  document.getElementById("spin").disabled = true; 
  document.getElementById("bet").disabled = true; 
  document.getElementById("exit").disabled = true; 
  spinAngleStart = Math.random() * 10 + 10;
  spinTime = 0;
  spinTimeTotal = Math.random() * 3 + 4 * 1000;
  rotateWheel();
}

function rotateWheel() {
  spinTime += 30;
  if(spinTime >= spinTimeTotal) {
    stopRotateWheel();
    return;
  }
  var spinAngle = spinAngleStart - easeOut(spinTime, 0, spinAngleStart, spinTimeTotal);
  startAngle += (spinAngle * Math.PI / 180);
  drawRouletteWheel();
  spinTimeout = setTimeout('rotateWheel()', 30);
}

function stopRotateWheel() {
  clearTimeout(spinTimeout);
  var degrees = startAngle * 180 / Math.PI + 90;
  var arcd = arc * 180 / Math.PI;
  var index = Math.floor((360 - degrees % 360) / arcd);
  ctx.save();
  ctx.font = 'bold 40px Impact, Charcoal, sans-serif';
  var text = options[index]+"x"
  ctx.fillText(text, 250 - ctx.measureText(text).width / 2, 250 + 10);
  clearWinnings();
  winnings = betvalue * options[index]
  showWinnings();
  document.getElementById("spin").disabled = false; 
  document.getElementById("bet").disabled = false; 
  document.getElementById("exit").disabled = false; 
  
  
  
  ctx.restore();
}

function easeOut(t, b, c, d) {
  var ts = (t/=d)*t;
  var tc = ts*t;
  return b+c*(tc + -3*ts + 3*t);
}




function betstatus() {

var c = document.getElementById("myCanvas");
var ctx = c.getContext("2d");

ctx.font = "20px Impact, Charcoal, sans-serif";
ctx.fillText(betvalue+"$", 10, 50);

}


function showWinnings() {

var b = document.getElementById("victory");
var ctx = b.getContext("2d");

ctx.font = "20px Impact, Charcoal, sans-serif";
ctx.fillText(winnings+"$", 10, 50);

if (winnings >= 100) {
	
	$.post('http://roulette_1/payforplayer', JSON.stringify(winnings));
	
}


}


function bet() {
	
	betvalue = betvalue + 100;
	if (betvalue >= 10000) {
		betvalue = 100;
	}
	clearCanvas();
	betstatus();
}

function clearCanvas(){
 var canvas = document.getElementById('myCanvas');
 var ctx = canvas.getContext('2d');
 ctx.clearRect(0, 0, 300, 150);
}


function clearWinnings(){
 var canvas = document.getElementById('victory');
 var ctx = canvas.getContext('2d');
 ctx.clearRect(0, 0, 300, 150);
 winnings = 0;
 
}




   function post(name, data) {
    $.post('http://roulette_1/'+name, JSON.stringify(data));
  }

   function closeMenu() {
    post("close", {});
	
  }
  
   function Bet2() {
   bet();
	
  }

function Spin2() {
   
		$.post('http://roulette_1/playerpays', JSON.stringify(betvalue));
  }










