var fetch;
var res;


getBooking();

async function getBooking() {
    fetch('http://localhost:8080/tpizza/api/books', {
        method: "get",
        headers: {
            "Content-Type": "application/json"
        }
    }).then(function (res) {
        console.info(res);
        return res.json();
    }).then(function (data) {
        res = data;
        console.info(data);
        /*  Show all Time 15 day
         for(let i=0; i<res.length; i++){
         let d = new Date(res[i].dateTime);
         document.getElementById('show_api').innerHTML += d.getFullYear() + '-' + String(parseInt(d.getMonth() + 1)).padStart(2, '0') + '-' + String(d.getDate()).padStart(2, '0')
         + ' _ ' + String(d.getHours()).padStart(2, '0') + ':' + String(d.getMinutes()).padStart(2, '0') + ':' + String(d.getSeconds()).padStart(2, '0')
         + '<br>';   //+ ' | ' + res[i]['ban'+`1`].morning + ', ' + res[i]['ban'+`1`].noon + ', ' + res[i]['ban'+`1`].afternoon + '<br>';
         //how to use properties as string javascript    ###############
         for(let j=1; j<=5; j++)
         document.getElementById('show_api').innerHTML += 'Ban ' + j + ' | ' + res[i]['ban'+`${j}`].morning + ', ' + res[i]['ban'+`${j}`].noon + ', ' + res[i]['ban'+`${j}`].afternoon + '<br>';
         }*/

        // Show Time 1 day had Select
        updateShow();

    });
}



function showapi() {
    document.getElementById('show_api').innerHTML = res[0].dateTime + '_';
}

function putBooking() {
    let listCheck = [];
    let dem = 0;
    for (i = 1; i <= 15; i++)
        if (document.getElementById('check' + i).checked === true)
            listCheck[dem++] = i;
    //console.log(listCheck);
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

    
    if (listCheck.length > 0) {
        fetch(`/tpizza/api/booking`, {
            method: "put",
            body: JSON.stringify({
                //"amountProduct" : document.getElementById(`product-${id}`).value
                "id": res[n].id,
                "tn": JSON.stringify(listCheck),
                "ts": ts
            }),
            headers: {
                "Content-Type": "application/json"
            }

        }).then(function (res) {
            //console.info(res);
            return res.json();
        }).then(function (data) {
            console.info(data);
            res = data;
            updateShow1();
        });
    }

}