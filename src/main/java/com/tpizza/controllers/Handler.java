

package com.tpizza.controllers;

import com.google.gson.Gson;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.regex.Pattern;
import javax.servlet.http.HttpSession;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;


@Controller
public class Handler {
    private static final Gson gson = new Gson();
    
    @RequestMapping(value = "/api/savefile", method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<String> upload(@RequestParam CommonsMultipartFile file, @RequestParam(defaultValue = "0") String type, HttpSession session) {
        
        String path=session.getServletContext().getRealPath("/");
        //-------0 Get subpath and srcpath
        String[] subpath = path.split(Pattern.quote(File.separator));
        String srcpath = "";
        for (int i =0; i<subpath.length - 2; i++){
            srcpath += subpath[i] + "\\";
        }
        srcpath += "\\src\\main\\webapp\\";
        //--------0
        
        String filename=file.getOriginalFilename();
        int cate = Integer.parseInt(type) + 1;
        String stas;
        
        String mon = "";
        switch (cate) {
            case 1:
                mon = "starter";
                break;
            case 2:
                mon = "miy";
                break;
            case 3:
                mon = "pizza";
                break;
            case 4:
                mon = "salads";
                break;
            case 5:
                mon = "soups";
                break;
            case 6:
                mon = "trangmieng";
                break;
            case 7:
                mon = "drink";
                break;
            default:
                break;
        }
        
        //---------1 fullpath1
        String fullPath = path + "\\resources\\images\\products\\" + mon + "/" + filename;
        if (!new File(path + "resources").exists()) {
            new File(path + "resources").mkdir();
            if(! new File(path + "resources\\images").exists()){
                new File(path + "resources\\images").mkdir();
                if(! new File(path + "resources\\images\\products").exists()){
                    new File(path + "resources\\images\\products").mkdir();
                }
            }
        }
        {
            new File(path + "resources\\images").mkdir();
            new File(path + "resources\\images\\products").mkdir();
            new File(path + "resources\\images\\products\\starter").mkdir();
            new File(path + "resources\\images\\products\\miy").mkdir();
            new File(path + "resources\\images\\products\\pizza").mkdir();
            new File(path + "resources\\images\\products\\salads").mkdir();
            new File(path + "resources\\images\\products\\soups").mkdir();
            new File(path + "resources\\images\\products\\trangmieng").mkdir();
            new File(path + "resources\\images\\products\\drink").mkdir();
        }   //--------1
        
        //--------2 full-srcpath
        String fullSrcPath = srcpath + "\\resources\\images\\products\\" + mon + "/" + filename;
        if (!new File(srcpath + "resources").exists()) {
            new File(srcpath + "resources").mkdir();
            if(! new File(srcpath + "resources\\images").exists()){
                new File(srcpath + "resources\\images").mkdir();
                if(! new File(srcpath + "resources\\images\\products").exists()){
                    new File(srcpath + "resources\\images\\products").mkdir();
                }
            }
        }
        {
            new File(srcpath + "resources\\images").mkdir();
            new File(srcpath + "resources\\images\\products").mkdir();
            new File(srcpath + "resources\\images\\products\\starter").mkdir();
            new File(srcpath + "resources\\images\\products\\miy").mkdir();
            new File(srcpath + "resources\\images\\products\\pizza").mkdir();
            new File(srcpath + "resources\\images\\products\\salads").mkdir();
            new File(srcpath + "resources\\images\\products\\soups").mkdir();
            new File(srcpath + "resources\\images\\products\\trangmieng").mkdir();
            new File(srcpath + "resources\\images\\products\\drink").mkdir();
        } //--------2
        
        try{  
            byte barr[]=file.getBytes();
            try (BufferedOutputStream bout = new BufferedOutputStream(  
                    new FileOutputStream(fullPath))) {
                bout.write(barr);
                bout.flush();
            }
            
            try (BufferedOutputStream bout2 = new BufferedOutputStream(  
                    new FileOutputStream(fullSrcPath))) {
                bout2.write(barr);
                bout2.flush();
            }
            stas = "thanh Cong!";
        }catch(IOException e){System.out.println(e); stas = "that Bai!";}
        
        return new ResponseEntity<>(gson.toJson(path + " | " + mon + " | " + fullPath + " | " + stas), HttpStatus.OK);
    }

}
