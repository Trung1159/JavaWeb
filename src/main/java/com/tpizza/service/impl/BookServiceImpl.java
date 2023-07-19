
package com.tpizza.service.impl;


import com.tpizza.pojos.Bookingg;
import com.tpizza.pojos.TestApi;
import com.tpizza.repository.BookRepository;
import com.tpizza.service.BookService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BookServiceImpl implements BookService{

    
    @Autowired
    private BookRepository bookRepo;
    @Override
    public List<Bookingg> getBooks() {
        return this.bookRepo.getBooks();
    }

    @Override
    public TestApi getApi(int n) {
        return this.bookRepo.getApi(n);
    }

    @Override
    public Boolean putBooking(int id, List<Integer> tn, int ts) {
        return this.bookRepo.putBooking(id, tn, ts);
    }

}
