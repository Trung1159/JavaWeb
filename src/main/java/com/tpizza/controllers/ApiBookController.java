package com.tpizza.controllers;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.tpizza.pojos.Bookingg;
import com.tpizza.pojos.TestApi;
import com.tpizza.service.BookService;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Map;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;

@RestController
@RequestMapping("/api")
public class ApiBookController {

    @Autowired
    private BookService bookService;

    @GetMapping(path = "/books", produces = {
        MediaType.APPLICATION_JSON_VALUE
    })
    public ResponseEntity<List<Bookingg>> getBooks() {

        try {
            List<Bookingg> book = this.bookService.getBooks();
            return new ResponseEntity<List<Bookingg>>(book, HttpStatus.OK);
        } catch (Exception ex) {
           // List<Bookingg> book = new ArrayList<>(Arrays.asList(new Bookingg(21, new Date()), new Bookingg(22, new Date())));
            //return new ResponseEntity<List<Bookingg>>(book, HttpStatus.OK);
        }
        return new ResponseEntity<>(HttpStatus.OK);
    }
    
    @PutMapping(path = "/booking", produces = {
        MediaType.APPLICATION_JSON_VALUE
    })
    public ResponseEntity<List<Bookingg>> updateBooking(@RequestBody Map<String, String> params) {
        try {
            //id
            int id = Integer.parseInt(params.get("id"));
            //tn
            String str = params.get("tn");
            str = str.substring(1, str.length() - 1);
            List<String> listStr = Arrays.asList(str.split("\\s*,\\s*"));
            List<Integer> tn = new ArrayList<>();
            for (String i : listStr){
                tn.add(Integer.parseInt(i));
            }
            //ts
            int ts = Integer.parseInt(params.get("ts"));
            
            Boolean kqBook = this.bookService.putBooking(id, tn, ts);
            List<Bookingg> dsBook = this.bookService.getBooks();
            
            //Map<String, Object> kq = new HashMap<>();
            //kq.put("kqBook", kq);
            //kq.put("dsBook", dsBook);
            return new ResponseEntity<>(dsBook, HttpStatus.OK);
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @GetMapping(path = "/getApi/{num}")
    public ResponseEntity<TestApi> getApi(@PathVariable("num") int n){
        try {
            TestApi book = this.bookService.getApi(n);
            return new ResponseEntity<TestApi>(book, HttpStatus.OK);
        } catch (Exception ex) {
            return new ResponseEntity<TestApi>(new TestApi(11, "Nguyen Duy Tan"), HttpStatus.OK);
        }
        //return new ResponseEntity<>(HttpStatus.OK);
    }

}
