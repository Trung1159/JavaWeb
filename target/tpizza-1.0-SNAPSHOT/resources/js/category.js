var Promise;
var cate;

function loadCategoryAndProduct(endpointCate, endpointProduct, endpointDiscount) {
    // full-endpointProduct
    let pe = location.pathname.split("/")[3];
    if (pe !== 'undefined')
        endpointProduct += "/" + pe;
                            //document.getElementById('test').innerHTML = endpointProduct;

    // fetch 3 api common
    Promise.all([fetch(endpointCate), fetch(endpointProduct), fetch(endpointDiscount)]).then(function (responses) {
            console.log(responses);
            return Promise.all(responses.map(function (response) {
                    return response.json();
                }));
        }).then(function (data) {
        console.log(data);
        cate = data;
                            //document.getElementById('test').innerHTML = data[1][1].name + ' | ' + data[0][1].name;

        let dProduct = document.getElementById("productByCategory");
        let msgProduct = "";
        for (let i = 0; i < data[1].length; i++){
            msgProduct += `<div class="col-3 p-1">
            <div class="card" style="width:175px; box-shadow: 15px 15px 7px lightblue;">
                <img class="card-img-top" src="http://localhost:8080/tpizza${data[1][i].image}" alt="Card image" style="width:100%; height:119.21px">
                <div class="p-2">
                  <h5 class="card-title" style="height: 48px">${data[1][i].name}</h5>
                  <div class="position-relative" style="height: 48px; overflow: hidden;">
                    <p class="card-text fs-6" >${data[1][i].content}</p>
                    <p class="position-absolute bottom-0 end-0 m-0 px-2 bg-white text-danger">...Xem thêm</p>
                  </div>
                    <hr>
                    `;
            if(data[1][i].amount>0){
                msgProduct += `<a class="btn btn-success w-100" style="height:37.6px;" href="javascript:void(0)" onClick="addToCart(${data[1][i].id}, '${data[1][i].name}', ${data[1][i].price})" >
                     <div class="d-flex justify-content-between" style="align:center">
                    
                    <span>`;
                msgProduct   += formatNumber(data[1][i].price, '.', ',') + ` VNĐ`;

                msgProduct += `</span>
                        </div>
                    </a>`;
            }else{
                msgProduct += `<a class="btn btn-danger w-100" href="javascript:void(0)" >
                <div class="d-flex justify-content-between">
                    <span>HẾT HÀNG</span>
                </div>
            </a>`;
            }
            msgProduct +=`
                </div>
                </div>
            </div>`;
        }
        
        dProduct.innerHTML = msgProduct;

        var msgDiscount = "";
        msgDiscount += `<select class="form-select" aria-label="Default select example" id="selectDiscount" onChange="addDiscountSession()">`;
        msgDiscount += `<option value="0" selected>SỬ DỤNG VOUCHER</option>`;
        for(var i = 0; i < data.length; i++){
            if(data[2][i].status === "Enable"){
                msgDiscount += "<option onClick value='" + data[2][i].id + "'>" + data[2][i].name + `</option>`;
                msgDiscount += `<option class="d-none" value="${data[2][i].percentageReduction}">${data[2][i].percentageReduction}</option>`;
            }
        }
        msgDiscount += "</select>";
        document.getElementById("listDiscountEnable").innerHTML = msgDiscount;

    });
}