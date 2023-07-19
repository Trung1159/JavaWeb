<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    /* CSS for CHECKBOX  */
    input[type="checkbox"]{
    -webkit-appearance: initial;
    appearance: initial;
    width: 60px;
    height: 60px;
    border: none;
    background: gray;
    position: relative;
    border-radius: 6px;
    
    box-shadow: -9px 6px 6px lightblue;
}
input[type="checkbox"]:checked {
    background: red;
}
input[type="checkbox"]:checked:after {
    content: "\2713";
    color: #fff;
    position: absolute;
    left: 50%;
    top: 50%;
    -webkit-transform: translate(-50%,-50%);
    -moz-transform: translate(-50%,-50%);
    -ms-transform: translate(-50%,-50%);
    transform: translate(-50%,-50%);
}
input[type=checkbox][disabled]{
  /*    outline:1px solid black;    */
  background: pink;
}

    /* CSS for SELECT OPTION */
.custom-select {
  position: relative;
  font-family: Arial;
  display: inline-block;
  margin-left: calc(50% - 50px);
}
.custom-select select {
  display: none;
}
.select-selected {
  background-color: DodgerBlue;
}
.select-selected:after {
  position: absolute;
  content: "";
  top: 14px;
  right: 10px;
  width: 0;
  height: 0;
  border: 6px solid transparent;
  border-color: #fff transparent transparent transparent;
}
.select-selected.select-arrow-active:after {
  border-color: transparent transparent #fff transparent;
  top: 7px;
}
.select-items div,.select-selected {
  color: #ffffff;
  padding: 8px 16px;
  border: 1px solid transparent;
  border-color: transparent transparent rgba(0, 0, 0, 0.1) transparent;
  cursor: pointer;
  user-select: none;
}
.select-items {
  position: absolute;
  background-color: DodgerBlue;
  top: 100%;
  left: 0;
  right: 0;
  z-index: 99;
}
.select-hide {
  display: none;
}
.select-items div:hover, .same-as-selected {
  background-color: rgba(0, 0, 0, 0.1);
}

    /* CSS for DATE */
#input-container input {position: relative;}
::-webkit-datetime-edit { padding: 10px; background: DodgerBlue; border-radius: 2px;} 
::-webkit-datetime-edit-fields-wrapper { background: DodgerBlue;}
::-webkit-datetime-edit-text { color: red; padding: 0 0.3em; font-family: monospace;}
::-webkit-datetime-edit-month-field { color: white; }
::-webkit-datetime-edit-day-field { color: white; }
::-webkit-datetime-edit-year-field { color: white; }
::-webkit-inner-spin-button { display: none; }
::-webkit-calendar-picker-indicator { background: transparent; position: absolute; cursor: pointer;
                                      bottom: 0; left: 0; right: 0; top: 0;
                                      width: auto; height: auto;
}

#datePicker:focus{                    /* Prevent SELECT CAN USE FOR ANY TAG*/
  -webkit-user-select: none;    /* Safari */
  -ms-user-select: none;        /* IE 10 and IE 11 */
  -user-select: none;           /* Standard syntax */
}

    /* HIDE select-selected select-arrow-active */
.select-selected::after, .select-arrow-active::after{visibility: hidden;}

    /* Modal Payment */
#sp:hover{cursor:pointer}

    /** bt book **/
#bt-book:hover{
    background: rgba(49, 177, 64, 0.8) !important;
}
</style>
<script src="<c:url value="/js/payment.js" />"></script>

<h2 align="center" style="color: #300919; text-shadow: 0 0 4px #FF0000;">ĐẶT BÀN ONLINE NHÀ HÀNG Ý, ĐẶT TRƯỚC ĐẾN SAU KHỎI LO HẾT BÀN</h2>
<div style="min-height: 100vh;background-image: url(<c:url value="/images/background-order.jpg" />)">
    <!-- Ghi Chu -->
    <div class="position-fixed top-200 end-0">
        <div style="width:300px; height:360px; background-color: rgba(159, 226, 191, 0.4); border-radius: 4px; box-shadow: -10px 10px 5px lightblue;">
            <p style="font-family: monospace; width: auto; color: green;" align="center">Ghi Chú:<br/>
                <span style="color:#800080">
                Bạn được phép đặt trước trong khoảng 15 ngày trở lại.<br/>
                Mỗi một bàn, bạn phải đặt cọc 1.000.000'VND'
                </span>
            </p>
            <div style="height:60px; position: relative;">
                <span style="font-family: monospace; position: absolute; top:20px">Chưa Đặt: </span>
                <div style="width:40px; height:40px; background-color: gray; display: inline-block; margin-left: 125px; margin-top: 10px; border-radius: 3px;"></div>
            </div>
            <br/>
            <div style="height:60px; position: relative">
                <span style="font-family: monospace; position: absolute; top:20px">Đã Đặt: </span>
                <div style="width:40px; height:40px; background-color: pink; display: inline-block; margin-left: 125px; margin-top: 10px; border-radius: 3px;"></div>                
            </div>
            <br/>
            <div style="height:60px; position: relative">
                <span style="font-family: monospace; position: absolute; top:20px">Đang Chọn: </span>
                <div style="width:40px; height:40px; background-color: red; display: inline-block; margin-left: 125px; margin-top: 10px; border-radius: 3px;"></div>                
            </div>
        </div>
    </div>
    <!--  DATE_PICKER and TIME-SLOT_PICKER and BOOKING -->
    <form action="">
        <div style="border:1px solid green; display: inline-block; border-radius: 6px; margin-left: 33%">
            <label for="birthday" style="font-family: monospace; margin-left: 17px">Chọn Ngày</label>
            <div id="input-container">
                <input style="border:none; outline: none;" type="date" id="datePicker" name="birthday" onclick="document.getElementById('datePicker').blur();" onchange="updateShow1()">
            </div>
        </div>
        <input class="btn btn-success" id="bt-book" type="button" value="ĐẶT" onclick="document.getElementById('id02').style.display='block'; fillModal(1); /*putBooking();*/" style="margin-left: 50px; background-color: #d63838; padding: 10px 30px; border-radius: 6px; border: none;"/>
        <div class="custom-select" style="width:150px; border: 1px solid green; border-radius: 6px; margin-left: 50px">
            <label for="timeslot" style="font-family: monospace; margin-left: 11px">Chọn Khung Giờ</label>
            <select name="timeslot" id="time_slot" onchange="updateShow1()">
                <option value="null">CHOOSE</option>
                <option value="morning">7h - 11h</option>
                <option value="noon">11h30 - 15h30</option>
                <option value="afternoon">16h - 20h</option>
            </select>
        </div>
    </form>
    <!--    SHOW TABLE  -->
    <div id="show_api container">
        <c:forEach var="num" begin="1" end="16" step="2">
            <div class="row justify-content-around" style="margin-left: 250px">
                <div class="col-4">
                    <input id='check${num}' type="checkbox" name="ban${num}" value="table${num}"><br>
                    <span>Bàn ${num}</span>
                </div>
                <div class="col-4">
                    <input id='check${num+1}' type="checkbox" name="ban${num+1}" value="table${num+1}"><br>
                    <span>Bàn ${num+1}</span>
                </div>
            </div>
            <br/>

        </c:forEach>
    </div>

    <!--    Modal Payment   -->
    <div id="id02" class="w3-modal">
        <div class="w3-modal-content w3-animate-top w3-card-4" style="width:500px;">
            <header class="w3-container w3-teal"> 
                <span onclick="document.getElementById('id02').style.display='none'" 
                      class="w3-button w3-display-topright">&times;</span>
                <h2>Điền thông tin thanh toán</h2>
            </header>
            <div class="w3-container">
                <p>
                    Giao Dịch: <span id="gd" style="color: #00bcd4; font-size: calc(100% + 5px);"></span>
                    <br>
                    Thời Gian: <span id="tg"></span>
                </p>
                <hr style="border: 1px solid rgba(255, 0, 0, .3);"/>
                
                <p>Ghi Chú: <textarea id="ghichu" name="story" rows="3" cols="33" placeholder="Mời bạn nhập ghi chú"></textarea></p>
                <hr style="border: 1px solid rgba(255, 0, 0, .3);"/>

                <p>
                    Phương Thức Thanh Toán: 
                    <select class="form-select" style="width:192px; display: inline;">
                        <option value="1" disabled>MOMO</option>
                        <option value="2" selected>VNPAY</option>
                        <option value="3" disabled>PAYPAL</option>
                        <option value="4" disabled>ZALOPAY</option>
                    </select>
                </p>
                <hr style="border: 1px solid rgba(255, 0, 0, .3);"/>
                
                <p>Ngân Hàng: 
                    <select id="bank" class="form-select" style="width:300px; display: inline;">
                        <option selected value="">Danh Sach Ngan Hang</option>
                        <option value="JCB">JCB</option>
                        <option value="Vietinbank">Vietinbank</option>
                        <option value="Vietcombank">Vietcombank</option>
                        <option value="BIDV">BIDV</option>
                        <option value="Agribank">Agribank</option>
                        <option value="Sacombank">Sacombank</option>
                        <option value="Techcombank">Techcombank</option>
                        <option value="ACB">ACB</option>
                        <option value="TPBank">TPBank</option>
                        <option value="SeABank">SeABank</option>
                        <option value="ABBANK">ABBANK</option>
                        <option value="VietCapitalBank" dese>VietCapitalBank</option>
                        <option value="KienLongBank">KienLongBank</option>
                        <option value="MSB">MSB</option>
                        <option value="Vpbank">Vpbank</option>
                        <option value="NCB">NCB</option>
                        <option value="HDBank">HDBank</option>
                        <option value="OCB">OCB</option>
                        <option value="VIB">VIB</option>
                        <option value="PVcombank">PVcombank</option>
                        <option value="VDB">VDB</option>
                        <option value="CB">CB</option>
                        <option value="EXIMBANK">EXIMBANK</option>
                    </select>
                </p>
                <hr style="border: 1px solid rgba(255, 0, 0, .3);"/>
                <p align="center">Số Tiền: <span id="sotien"></span></p>
            </div>
            <footer class="w3-container w3-teal" align="center">
                <a class="btn btn-success" href="#" role="button" onclick="payment_vnpay(1); putBooking();">Thanh Toán</a>
                <a class="btn btn-warning" href="#" role="button" onclick="document.getElementById('id02').style.display='none'" style="margin-left: 200px;">Hủy</a>
            </footer>
        </div>
    </div>
</div>


<script src="<c:url value="/js/book.js" />"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script>
        /*
         function sleep(ms) {
         return new Promise(resolve => setTimeout(resolve, ms));
         }
         async function demo() {
         await sleep(2000);
         document.getElementById('test_res').innerHTML += res;
         }
         demo();*/

        document.getElementById('check16').disabled = true;
        document.getElementById('time_slot').value = "morning";
        var dpk = document.getElementById('datePicker');
        d = new Date();
        // Add day to current day
        var tday = new Date(d.setDate(d.getDate() + 1));
        var minday = tday.getFullYear() + '-' + String(parseInt(tday.getMonth() + 1)).padStart(2, '0') + '-' + String(tday.getDate()).padStart(2, '0');
        // Add day to current day
        var td_15 = new Date(tday.setDate(tday.getDate() + 14));
        var maxday = td_15.getFullYear() + '-' + String(parseInt(td_15.getMonth() + 1)).padStart(2, '0') + '-' + String(td_15.getDate()).padStart(2, '0');
        dpk.setAttribute('min', minday);
        dpk.setAttribute('max', maxday);

        function getToday() {
            var now = new Date();
            var day = ("0" + parseInt(now.getDate() + 1)).slice(-2);
            var month = ("0" + (now.getMonth() + 1)).slice(-2);
            today = now.getFullYear() + "-" + (month) + "-" + (day);
            $('#datePicker').val(today);
            document.getElementById('show_date_picker').innerHTML = today;
        }
        getToday();

        var n;
        function updateShow() {
            let d = new Date(document.getElementById('datePicker').value).getDate();
            for (n = 0; n < res.length; n++) {
                if (d === new Date(res[n].dateTime).getDate())
                    break;
                if (n === res.length - 1) {
                    n = -1;
                    break;
                }
            }
            for (k = 1; k <= 15; k++)
                //document.getElementById('show_api').innerHTML += 'Ban ' + k + ' | ' + res[n]['ban'+k].morning + ', ' + res[n]['ban'+k].noon + ', ' + res[n]['ban'+k].afternoon + '<br>';
                if (res[n]['ban' + k].morning === false)
                    //document.getElementById('show_date_picker').innerHTML = document.getElementById('check' + k).checked = true;
                    document.getElementById('check' + k).disabled = false;
                else
                    document.getElementById('check' + k).disabled = true;
        }

        function updateShow1() {
            
            tslot = document.getElementById('time_slot').value;
            var show = document.getElementById('show_date_picker');
            show.innerHTML = tslot + ' | ' + document.getElementById('datePicker').value;
            
            let d = new Date(document.getElementById('datePicker').value).getDate();
            for (n = 0; n < res.length; n++) {
                if (d === new Date(res[n].dateTime).getDate())
                    break;
                if (n === res.length - 1) {
                    n = -1;
                    break;
                }
            }

            if (tslot === "morning") {
                show.innerHTML += "_ ";
                for (k = 1; k <= 15; k++)
                    if (res[n]['ban' + k].morning === true){
                        document.getElementById('check' + k).checked = false;
                        document.getElementById('check' + k).disabled = true;
                    }
                    else 
                        document.getElementById('check' + k).disabled = false;
            } else if (tslot === "noon") {
                show.innerHTML += "_ ";
                for (k = 1; k <= 15; k++)
                    if (res[n]['ban' + k].noon === true){
                        document.getElementById('check' + k).checked = false;
                        document.getElementById('check' + k).disabled = true;
                    }
                    else 
                        document.getElementById('check' + k).disabled = false;
            } else if (tslot === "afternoon") {
                show.innerHTML += "_ ";
                for (k = 1; k <= 15; k++){
                    if (res[n]['ban' + k].afternoon === true){
                        document.getElementById('check' + k).checked = false;
                        document.getElementById('check' + k).disabled = true;
                    }
                    else
                        document.getElementById('check' + k).disabled = false;
                }
            }

        }

</script>

<script>
var x, i, j, l, ll, selElmnt, a, b, c;
x = document.getElementsByClassName("custom-select");
l = x.length;
for (i = 0; i < l; i++) {
  selElmnt = x[i].getElementsByTagName("select")[0];
  ll = selElmnt.length;
  a = document.createElement("DIV");
  a.setAttribute("class", "select-selected");
  a.innerHTML = selElmnt.options[selElmnt.selectedIndex].innerHTML;
  x[i].appendChild(a);
  b = document.createElement("DIV");
  b.setAttribute("class", "select-items select-hide");
  for (j = 1; j < ll; j++) {
    c = document.createElement("DIV");
    c.innerHTML = selElmnt.options[j].innerHTML;
    c.addEventListener("click", function(e) {
        var y, i, k, s, h, sl, yl;
        s = this.parentNode.parentNode.getElementsByTagName("select")[0];
        sl = s.length;
        h = this.parentNode.previousSibling;
        for (i = 0; i < sl; i++) {
          if (s.options[i].innerHTML == this.innerHTML) {
            s.selectedIndex = i;
            h.innerHTML = this.innerHTML;
            y = this.parentNode.getElementsByClassName("same-as-selected");
            yl = y.length;
            for (k = 0; k < yl; k++) {
              y[k].removeAttribute("class");
            }
            this.setAttribute("class", "same-as-selected");
            break;
          }
        }
        h.click();
    });
    b.appendChild(c);
  }
  x[i].appendChild(b);
  a.addEventListener("click", function(e) {
      e.stopPropagation();
      closeAllSelect(this);
      this.nextSibling.classList.toggle("select-hide");
      this.classList.toggle("select-arrow-active");
    });
}

function closeAllSelect(elmnt) {
  var x, y, i, xl, yl, arrNo = [];
  x = document.getElementsByClassName("select-items");
  y = document.getElementsByClassName("select-selected");
  xl = x.length;
  yl = y.length;
  for (i = 0; i < yl; i++) {
    if (elmnt == y[i]) {
      arrNo.push(i)
    } else {
      y[i].classList.remove("select-arrow-active");
    }
  }
  for (i = 0; i < xl; i++) {
    if (arrNo.indexOf(i)) {
      x[i].classList.add("select-hide");
    }
  }
}
document.addEventListener("click", closeAllSelect);
</script>

