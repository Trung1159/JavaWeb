<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="<c:url value="/css/style.css" />"/>
        <script src="<c:url value="/js/jscript.js"/>"></script>
    </head>

    <body>

        <div class="text-center">
            <a href="<c:url value="/home/tour" />"><button class="pushable">
                    <span class="front">
                        HOME
                    </span>
                </button></a>
        </div>

<%--        <h1>Amount: ${amount} | Bill Info: id_${billInfo.id} | totalTicket_${billInfo.totalTicket} | createDate_${billInfo.createdDate} |
            idUser_${billInfo.idUser.id} | totalAmount_${billInfo.totalAmount}</h1>--%>



        <div class="card">
            <div class="card-header bg-black"></div>
            <div class="card-body">

                <div class="container">
                    <div class="row">
                        <div class="col-xl-12">
                            <i class="far fa-building text-danger fa-6x float-start"></i>
                        </div>
                    </div>


                    <div class="row spa_char_equal">
                        <div class="col-xl-12">
                            <ul class="list-unstyled float-end" style="color: #6610f2; letter-spacing: 1px; font-family: monospace;">
                                <li style="font-size: 30px; color: red; font-family: 'Lucida Handwriting';">Company &#169JUYN</li>
                                <li>BILL_ID:&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;<span class="">${billInfo.billCode}</span></li>
                                <li>BILL_CREATED_DATE: <span class="">${billInfo.createdDate}</span></li>
                                <li>CUSTOMER:&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;<span class="">${billInfo.idUser.fullName}</span></li>
                            </ul>
                        </div>
                    </div>

                    <div class="row text-center">
                        <h3 class="text-uppercase text-center mt-3" style="font-size: 40px;">BILL</h3>
                        <!--<p>123456789</p>-->
                    </div>

                    <div class="row mx-3">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">Tour</th>
                                    <th scope="col">Unit_Price</th>
                                    <th scope="col">Num_Ticket</th>
                                    <th scope="col">Time_Start</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="j" items="${billDetails}">
                                <tr>
                                    <td>${j.idTour.name}</td>
                                    <td>${j.unitPrice}</td>
                                    <td>${j.num}</td>
                                    <td>Null</td>
                                    <!--<td><i class="fas fa-dollar-sign"></i> 500,00</td>-->
                                </tr>
                                </c:forEach>
                            </tbody>
                        </table>

                    </div>
                    <div class="row">
                        <div class="col-xl-8">
                            <ul class="list-unstyled float-end me-0">
                                <li><span class="me-3 float-start">Total Amount:</span><i class="fas fa-dollar-sign"></i> ${billInfo.totalAmount}
                                </li>
                                <li> <span class="me-5">Total Ticket:</span><i class="fas fa-dollar-sign"></i> ${billInfo.totalTicket}</li>
                                <li> <span class="me-5">Discount:</span><i class="fas fa-dollar-sign"></i> No</li>
                                <!--                        <li><span class="float-start" style="margin-right: 35px;">Shippment: </span><i
                                                                class="fas fa-dollar-sign"></i> 500,00</li>-->
                            </ul>
                        </div>
                    </div>
                    <hr>
                    <div class="row">
                        <div class="col-xl-8" style="margin-left:60px">
                            <p class="float-end"
                               style="font-size: 30px; color: red; font-weight: 400;font-family: Arial, Helvetica, sans-serif;">
                                Total:
                                <span><i class="fas fa-dollar-sign"></i>${billInfo.totalAmount}</span></p>
                        </div>

                    </div>

                    <div class="row mt-2 mb-5">
                        <p class="fw-bold">DATE: <span class="text-muted " id="j_date_time">2022-2-22 22:22:22</span></p>
                        <p class="fw-bold mt-3">Signature:</p>
                    </div>

                </div>



            </div>
            <div class="card-footer bg-black"></div>
        </div>
    </body>
    <script>
        let today = new Date();
        let date = today.getFullYear() + '-' + (today.getMonth() + 1) + '-' + today.getDate();
        let time = today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();
        let dateTime = date + ' ' + time;
        document.getElementById("j_date_time").innerHTML = dateTime;
    </script>
</html>