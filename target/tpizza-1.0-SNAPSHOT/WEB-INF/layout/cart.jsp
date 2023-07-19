<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="<c:url value="/js/payment.js" />"></script>
<div class="container-fluid p-2">
    <div class="fs-4 text-center">----- GIỎ HÀNG -----</div>
    <c:if test="${carts == null}">
        <div class="alert alert-info">
            <strong>Không có sản phẩm trong giỏ hàng!</strong>
        </div>
    </c:if>
    <c:if test="${carts != null}">
        <table class="table">
            <tbody>
                <script>
                    var totalPrice = 0;
                </script>
                <c:forEach items="${carts}" var="c">
                    <tr>
                        <th scope="row"><strong>${c.quantity}</strong></th>
                        <td><strong>${c.name}</strong></td>
                        <td><strong id="${c.productId}"></strong></td>
                        <script>
                            var total = ${c.quantity} * ${c.price};
                            totalPrice += total;
                            document.getElementById("${c.productId}").innerHTML = formatNumber(total,'.',',') + ' đ';
                        </script>
                        <td><button type="button" onclick="deleteItemCart(${c.productId})" class="btn btn-danger">X</button></td>
                    </tr>
                </c:forEach>
        </table>
    </c:if>
    <div id="listDiscountEnable">
    </div>
    <div>
        <table class="table">
            <tbody>
                <tr>
                    <th scope="row">Tổng</th>
                    <c:if test="${carts == null}">
                        <td class="text-end" id="totalPrice">0 đ</td>
                    </c:if>
                    <c:if test="${carts != null}">
                        <td class="text-end" id="totalPrice"></td>
                        <script>
                            document.getElementById("totalPrice").innerHTML = formatNumber(totalPrice,'.',',') + ' đ';
                        </script>
                    </c:if>
                    
                </tr>
                <tr>
                    <th scope="row">Giảm T.Viên</th>
                    <td class="text-end">0 đ</td>
                </tr>
                <tr>
                    <th scope="row">Giảm K.Mại</th>
                    <c:if test="${carts == null}">
                        <td class="text-end">0 đ</td>
                    </c:if>
                    <c:if test="${carts != null}">
                        
                        <td class="text-end" id="totalDiscount">0 đ</td>
                    </c:if>
                    
                </tr>
                <tr>
                    <th scope="row">Phí Giao Hàng</th>
                    <td class="text-end">0 đ</td>
                </tr>

            </tbody>
        </table>
        <a href="#" class="btn btn-success w-100" onclick="document.getElementById('id02').style.display='block'; fillModal(2); return false;">THANH TOÁN</a>
    </div>

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
                <a class="btn btn-success" href="#" role="button" onclick="payment_vnpay(2)">Thanh Toán</a>
                <a class="btn btn-warning" href="#" role="button" onclick="document.getElementById('id02').style.display='none'" style="margin-left: 200px;">Hủy</a>
            </footer>
        </div>
    </div>