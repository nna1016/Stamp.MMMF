document.addEventListener('turbolinks:load', () => {
    function twoDigit(num) {
        let ret;
        if (num < 10)
            ret = "0" + num;
        else
            ret = num;
        return ret;
    }
    function showClock() {
        let nowTime = new Date();
        let nowHour = twoDigit(nowTime.getHours());
        let nowMin = twoDigit(nowTime.getMinutes());
        let nowSec = twoDigit(nowTime.getSeconds());
        let msg = nowHour + ":" + nowMin + ":" + nowSec;
        document.getElementById("realtime").innerHTML = msg;
    }
    setInterval('showClock()', 1000);

    function date() {
        mydate = new Date();
        Ye = mydate.getFullYear() + "年";
        Mo = mydate.getMonth() + 1 + "月";
        Da = mydate.getDate() + "日";
        Day = mydate.getDay();
        Day2 = new Array(7);
        Day2[0] = "日"; Day2[1] = "月"; Day2[2] = "火";
        Day2[3] = "水"; Day2[4] = "木"; Day2[5] = "金";
        Day2[6] = "土";
        let msg2 = Ye + Mo + Da + "（" + Day2[Day] + "）";
        document.getElementById("realdate").innerHTML = msg2;
    };
    date();
});