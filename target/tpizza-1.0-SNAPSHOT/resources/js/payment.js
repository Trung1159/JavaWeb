var fetch, sotien_datban, totalPrice;

function payment_vnpay(num) {
    let select = document.getElementById('bank'), content, tongtien;
    switch (num){
        case 1:
            content = "Dat Ban";
            tongtien = sotien_datban;
            break;
        case 2:
            content = "Dat Mon";
            tongtien = totalPrice;
            break;
    }
    
    fetch("/tpizza/api/payment", {
        method: "post",
        body: JSON.stringify({
            "soTienDatBan": tongtien,
            "content": content + "|" + document.getElementById("ghichu").value,
            "bankcode": select.options[select.selectedIndex].value
        }),
        headers: {
            "Content-Type": "application/json"
        }
    }).then(res => res.json()).then(function (data) {
        location.href = data;
        //alert(data);
    });
}

function toPrice(n, currency) {
    return String(n + '.').replace(/(\d)(?=(\d{3})+\.)/g, '$1,').replace('.', '') + currency; //.toFixed(2) | /(\d)(?=(\d{3})+\.)/g | +\.
}

function fillModal(num){
    switch (num){
        case 1:
            var soBanChon = 0;
            for(let i=1; i<=16; i++){
                if(document.getElementById("check" + i).checked === true)
                    soBanChon++;
            }
            sotien_datban = soBanChon*1000000;
            document.getElementById("sotien").innerHTML = toPrice(sotien_datban, " 'VND'");
            document.getElementById('gd').innerHTML = "Đặt Bàn";
            break;
        case 2:
            if(totalPrice === undefined)
                totalPrice = 0;
            document.getElementById("sotien").innerHTML = toPrice(totalPrice, " 'VND'");
            document.getElementById('gd').innerHTML = "Đặt Món";
            break;
        default:
            break;
    }
    document.getElementById('tg').innerHTML = calTime();
}

function calTime(){
    let d = new Date();
    return d.getDate() + "-" + (d.getMonth()+1) + "-" + d.getFullYear() + " " + d.getHours() + ":" + d.getMinutes() + ":" + d.getMilliseconds()%60;
}

function saveBook(){
    let listCheck = [];
    let dem = 0;
    for (i = 1; i <= 15; i++)
        if (document.getElementById('check' + i).checked === true)
            listCheck[dem++] = i;
    let t_s = document.getElementById('time_slot').value;
    ts = 0;
    switch(t_s){
        case 'morning':
            ts = 1;
            break;
        case 'noon':
            ts = 2;
            break;
        case 'afternoon':
            ts = 3;
            break;
        default:
            break;
    }
}