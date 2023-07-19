<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:url var="cate" value="/order"/>

<link rel="stylesheet" href="<c:url value="/css/modal.css" />"/>
<style>
    
    /* Bar MENU */
.dropbtn {
    border: none;
    background: none;
    cursor: pointer;
    margin: 8px;
    padding: 0;
    border-radius: 4px;
}
.dropdown {
  position: relative;
  display: inline-block;
}
.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f1f1f1;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}
.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}
.dropdown-content a:hover {background-color: pink;}
.dropdown:hover .dropdown-content {display: block;}
.dropdown:hover .dropbtn {background-color: rgba(196, 149, 173, 0.4);}

    /* Tooltip */
.tooltipp {
  position: relative;
  display: inline-block;
  border-bottom: 1px dotted black;
}
.tooltipp .tooltiptext {
  visibility: hidden;
  width: 120px;
  background-color: #F7F0EE;
  color: #777C09;
  text-align: center;
  border-radius: 6px;
  padding: 5px 0;
  
  position: absolute;
  z-index: 1;
  top: 0px;
  right: 170px;
}
.tooltipp:hover .tooltiptext {
  visibility: visible;
}

    /** CSS for LOGO */
#logo:hover #logo2{
    background-color: rgba(208, 156, 103, 0.5) !important;
}

#hv-book:hover{
    background-color: rgba(196, 149, 173, 0.4);
}
</style>

<div class="header">
    <header>
        <nav class="navbar navbar-expand-sm navbar-light bg-white shadow-lg" style="padding:0px;">
            <div class="container-fluid d-flex" style="padding-left: 11px;">
                
                    <div class="navbar-brand flex-grow-1">
                        <div>
                            <a id="logo" class="" style="padding:0px; height:50px;" href="<c:url value="/"/>">
                                <img id="logo2" src="<c:url value="/images/logo2.png" />" alt="logo" class="logo image-logo" style="zoom:150%; background-color: rgba(208, 156, 103, 0.2); border-radius: 6px;">
                            </a>            
                        </div>
                    </div>
                <ul class="navbar-nav me-auto">
                    <c:if test="${pageContext.request.userPrincipal.name == null}">
                        <li class="nav-item">
                        <a class="nav-link text-danger" href="<c:url value="/login" />" onclick="document.getElementById('id01').style.display='block'; return false">
                            <div id="hv-book" style="border-radius: 4px;">
                                <span class="text-dark">ĐẶT BÀN</span>
                            </div>
                        </a>
                        </li>
                    </c:if>
                    <c:if test="${pageContext.request.userPrincipal.name != null}">
                        <li class="nav-item" style="">
                            <a class="nav-link text-danger" href="<c:url value="/book" />" style="padding:0px; margin-top: 8px;">
                                <div id="hv-book" style="border-radius: 4px;">
                                    <span class="text-dark" >ĐẶT BÀN</span>
                                </div>
                            </a>
                        </li>
                    </c:if>
                    
                    <li class="nav-item">
                        <div class="dropdown">
                            <button class="dropbtn">MENU</button>
                            <div class="dropdown-content">
                                <a href="${cate}/starter">Khai Vị</a>
                                <a href="${cate}/miy">Mì Ý</a>
                                <a href="${cate}/pizza">Pizza</a>
                                <a href="${cate}/salads">Salads</a>
                                <a href="${cate}/soups">Soups</a>
                                <a href="${cate}/trangmieng">Tráng Miệng</a>
                                <a href="${cate}/drink">Drink</a>
                            </div>
                        </div>
                    </li>
                    <span class="border-start p-3"></span>
                    <li class="nav-item">
                        <a class="nav-link text-dark" href="javascript:void(0)">
                            <i class="fa-regular fa-bell"></i></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link fw-bolder text-danger language" href="javascript:void(0)">EN</a>
                    </li>
                    <c:if test="${pageContext.request.userPrincipal.name == null}">
                        <li class="nav-item">
                            <a class="nav-link text-danger" href="<c:url value="/login" />">
                                <i class="fa-solid fa-user"></i>
                                <span class="fw-bolder text-dark">Thành viên</span>
                            </a>
                        </li>
                    </c:if>
                    <c:if test="${pageContext.request.userPrincipal.name != null}">
                        <sec:authorize access="hasRole('ROLE_ADMIN')">
                            <li class="nav-item tooltipp">
                                <span class="tooltiptext">Back Admin</span>
                                <a class="nav-link text-danger" href="<c:url value="/admin/#!"/>">
                                    <i class="fa-solid fa-user"></i>
                                    <span class="fw-bolder text-dark">${pageContext.request.userPrincipal.name}</span>
                                </a>
                            </li>
                        </sec:authorize>
                        <sec:authorize access="hasAnyRole('ROLE_CUSTOMER', 'ROLE_USER', 'ROLE_STAFF')">
                            <li class="nav-item">
                                <a class="nav-link text-danger" href="javascript:void(0)">
                                    <i class="fa-solid fa-user"></i>
                                    <span class="fw-bolder text-dark">${pageContext.request.userPrincipal.name}</span>
                                </a>
                            </li>

                        </sec:authorize>
                        <li class="nav-item">
                            <a class="nav-link text-danger" href="<c:url value="/logout" />">
                                <span class="fw-bolder text-dark">Đăng xuất</span>
                            </a>
                        </li>
                    </c:if>
                    <li class="nav-item">
                        <a class="nav-link text-danger" href="<c:url value="/tracking" />">
                            <span class="border-start p-3"></span>
                            <i class="fa-solid fa-magnifying-glass-location"></i>
                            <span class="fw-bolder text-dark">Theo dõi đơn hàng</span>
                        </a>
                    </li>
                </ul>
            </div>
        </nav>
    </header>
</div>

<div id="id01" class="w3-modal">
    <div class="w3-modal-content w3-animate-top w3-card-4" style="width:300px">
        <header class="w3-container w3-teal"> 
            <span onclick="document.getElementById('id01').style.display='none'" 
                  class="w3-button w3-display-topright">&times;</span>
            <h2 align="center">thông báo</h2>
        </header>
        <div class="w3-container">
            <p>Bạn chưa đăng nhập, để thực hiện chức năng đặt bàn đầu tiên bạn phải đăng nhập.</p>
            <p>Bạn có muốn tiếp tục không!</p>
        </div>
        <footer class="w3-container w3-blue-grey" align="center">
            <a class="btn btn-success" href="<c:url value="/login" />" role="button">Tiếp tục</a>
            <a class="btn btn-warning" href="#" role="button" onclick="document.getElementById('id01').style.display='none'">Hủy</a>
        </footer>
    </div>
</div>