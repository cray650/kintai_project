function clock() {
  const nowTime = new Date();
  const nowHour = nowTime.getHours();
  const nowMin  = nowTime.getMinutes();
  const nowSec  = nowTime.getSeconds();
  const msg = "現在時刻は、" + nowHour + ":" + nowMin + ":" + nowSec + " です。";
  document.getElementById("RealtimeClockArea").innerHTML = msg;
}
setInterval(clock,1000);