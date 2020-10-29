function clock() {
  var nowTime = new Date();
  var nowHour = nowTime.getHours();
  var nowMin  = nowTime.getMinutes();
  var nowSec  = nowTime.getSeconds();
  var msg = "現在時刻は、" + nowHour + ":" + nowMin + ":" + nowSec + " です。";
  document.getElementById("RealtimeClockArea").innerHTML = msg;
}
setInterval(clock,1000);