
package com.tpizza.service;


import com.tpizza.pojos.Bookingg;
import com.tpizza.pojos.TestApi;
import java.util.List;


public interface BookService {
    List<Bookingg> getBooks();
    TestApi getApi(int n);
    Boolean putBooking(int id, List<Integer> tn, int ts);
}
