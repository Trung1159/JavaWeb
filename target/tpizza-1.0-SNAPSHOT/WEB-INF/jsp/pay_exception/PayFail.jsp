<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    hr{
        margin-left: 40px;
        width: 400px !important;
    }
</style>

<script>
    window.onload = function(){
        var tg = ${vnp_PayDate};
        var date_return = new Date(new Date(Math.floor(tg/10000000000) + "-" + Math.floor(tg/100000000)%100 + "-" + Math.floor(tg/1000000)%100 + " " + Math.floor(tg/10000)%100 + ":" + Math.floor(tg/100)%100 + ":" + Math.floor(tg/1)%100)).toLocaleString();
        document.getElementById('tg').innerHTML = date_return;
        document.getElementById('sotien').innerHTML = toPrice( ${vnp_Amount}, " 'VND'");
        document.getElementById('dv').innerHTML = "Tai Cua Hang T-RESTAURANT";
    };

    function toPrice(n, currency) {
        return String(n + '.').replace(/(\d)(?=(\d{3})+\.)/g, '$1,').replace('.', '') + currency; //.toFixed(2) | /(\d)(?=(\d{3})+\.)/g | +\.
    }
</script>

<body>

            <div class="container" style="background: #D8E5DF; width: 500px; font-family: monospace;">
                <p class="my-5 mx-5" style="font-size: 30px; margin-bottom: 0px !important;">Thanh Toán Thất Bại!</p>
                <c:if test="${err_code == 24}">
                    <p style="color: #E01AC4;">Bạn đã hủy thanh toán.<p>
                </c:if>
                <c:if test="${err_code != 0 && err_code != 24}">
                    <p style="color: #E01AC4;">Thanh toán thất bại do thông tin tài khoản.<p>
                </c:if>
                <div class="row">
                    <ul class="list-unstyled">
                        <li class="text-black">&#160&#160&#160Name: ${pageContext.request.userPrincipal.name}</li>
                        <li class="text-muted mt-1"><span class="text-black">Invoice: </span> #${vnp_TxnRef}</li>
                        <li class="text-black mt-1">&#160&#160&#160Time: <span id="tg"></span></li>
                    </ul>
                    <hr>
                    <div class="col-xl-10">
                        <p>Dich Vu:</p>
                    </div>
                    <div class="col-xl-2">
                        <p class="float-end" style="width:210px"><span id="dv"></span>
                        </p>
                    </div>
                    <hr>
                </div>
                <div class="row">
                    <div class="col-xl-10">
                        <p>Ghi Chu:</p>
                    </div>
                    <div class="col-xl-2">
                        <p class="float-end" style="width:80px;">code: ${err_code}
                        </p>
                    </div>
                    <hr>
                </div>
                <div class="row">
                    <div class="col-xl-10">
                        <p>&#160&#160&#160&#160VAT:</p>
                    </div>
                    <div class="col-xl-2">
                        <p class="float-end">0%
                        </p>
                    </div>
                    <hr style="border: 2px solid black; width: 450px;">
                </div>
                <div class="row text-black">

                    <div class="col-xl-12">
                        <p class="float-end fw-bold"><span id="sotien"></span><i style="color:#FF8941; font-size: 30px; margin-left: 12px;" class="fas fa-exclamation-triangle"></i>
                        </p>
                    </div>

                </div>
            </div>


</body>
