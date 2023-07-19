<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    
    <style>
        ::-webkit-scrollbar {
        width: 0px;
    }
    </style>
        
        
    <div style=" margin-bottom: 320px;">
        
        <div class="container justify-content-center" style="transform: translateY(35%); background: #FCFAEC;">
            
            <div class="row shadow shadow-lg">
                <!-- LEFT -  -->
                <div class="col-md-5">
                    <img src="<c:url value="/images/Home/home6.jpg" />" class="img-fluid" alt="logo" style="margin:116px 10px 196px 10px; height:280px;">
                </div>
                
                <!-- RIGHT -->
                <div class="col-md-7">
                    <div>
                        <img src="<c:url value="/images/index/logo3.png" />" style="margin-bottom: 25px;"/>
                        <h3 class="text-center">WELCOME TO MY RESTAURANT</h3>
                    </div>
                    <p class="text-center text-danger">
                        <c:if test="${param.error != null}">
                            Tên đăng nhập hoặc mật khẩu không đúng!!!
                        </c:if>
                    </p>
                    <div class="">   

                        <c:url value="/login" var="action" />

                        <form method="post" action="${action}">
                            <div class="form-group m-4">
                                <label for="email" class="h5">Email</label>
                                <input type="text" class="form-control" id="email" name="email" placeholder="Email">
                            </div>
                            <div class="form-group m-4">
                                <label for="password" class="h5">Mật khẩu</label>
                                <input type="password" class="form-control" id="password" name="password"
                                    placeholder="Mật khẩu">
                            </div>
                            <div class="form-group m-4 d-flex align-self-center justify-content-center">
                                <input type="submit" value="ĐĂNG NHẬP" class="btn btn-success w-75" />
                            </div>

                            <p class="mx-4" align="center">Bạn chưa có tài khoản? <a style="text-decoration: none" href="<c:url value="/" />">Về Trang Chủ</a>
                                <span class="text-success"><a class="nav-link" href="<c:url value="/register" />">Đăng ký ngay</a></span></p>
                        </form>
                    </div>
                </div>
            </div>
        </div>
                        
    </div>
                        
                        
<script>
    window.onload = function () { 
    window.scrollTo(0, document.body.scrollHeight);
    console.log("scroll finnish!");
    }
</script>