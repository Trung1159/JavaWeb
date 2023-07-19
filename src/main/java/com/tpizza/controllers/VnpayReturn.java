package com.tpizza.controllers;

import java.util.Map;
import java.util.Set;
import java.util.regex.Pattern;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class VnpayReturn {
   
    
    @GetMapping("/returnUrl")
    public String pay(HttpSession session, Model model, @RequestParam Map<String, String> reqParam, @RequestParam("vnp_OrderInfo") String content) {
        Set<String> keys = reqParam.keySet();
        String info = "";
        for ( String key : keys ) {
            info += key + " : " + reqParam.get(key) + "<br>";
        }
        model.addAttribute("err_code", Integer.parseInt(reqParam.get("vnp_ResponseCode")));
        model.addAttribute("content", reqParam.get("vnp_OrderInfo"));
        model.addAttribute("vnp_OrderInfo", reqParam.get("vnp_OrderInfo").split(Pattern.quote("|"))[0]);
        model.addAttribute("vnp_TxnRef", reqParam.get("vnp_TxnRef"));
        model.addAttribute("vnp_Amount", Long.parseLong(reqParam.get("vnp_Amount"))/100);
        model.addAttribute("vnp_PayDate", Long.parseLong(reqParam.get("vnp_PayDate")));
        if (Integer.parseInt(reqParam.get("vnp_ResponseCode")) == 0) {
            return "pay_sucs";
        }
        return "pay_fail";       // new ResponseEntity<>(info + "<a href='localhost:8080/tpizza'>chu day click vo</a>", HttpStatus.OK); //"pay_sucs";
    }
    
    @RequestMapping("/returnKq")
    @Transactional
    public String show(Model model, @RequestParam(value = "billId") int billId) {
        return "/pay_exception/VnpayReturnUrl";
    }
    
}
