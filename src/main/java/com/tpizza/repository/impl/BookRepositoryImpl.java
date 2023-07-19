package com.tpizza.repository.impl;

import com.tpizza.pojos.Bookingg;
import com.tpizza.pojos.TestApi;
import com.tpizza.repository.BookRepository;
import java.util.List;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class BookRepositoryImpl implements BookRepository {

    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public List<Bookingg> getBooks() {
        Session session = this.sessionFactory.getObject().getCurrentSession();

        CriteriaBuilder b = session.getCriteriaBuilder();
        CriteriaQuery<Bookingg> q = b.createQuery(Bookingg.class);
        Root root = q.from(Bookingg.class);
        q = q.select(root);

        Query query = session.createQuery(q);
        return query.getResultList();
    }

    @Override
    public TestApi getApi(int n) {
        Session session = this.sessionFactory.getObject().getCurrentSession();

        TestApi t = session.get(TestApi.class, n);

        return t;
    }

    @Override
    public Boolean putBooking(int id, List<Integer> tn, int ts) {
        try {
            Session session = this.sessionFactory.getObject().getCurrentSession();
            Bookingg p = session.get(Bookingg.class, id);
            int n = tn.size();
            if(n == 0)  return false;
            switch (ts) {
                case 1:
                    for(int i=0; i<n; i++){
                        p.getBanNum(tn.get(i)).setMorning(!p.getBanNum(tn.get(i)).isMorning());
                    }
                    break;
                case 2:
                    for(int i=0; i<n; i++){
                        p.getBanNum(tn.get(i)).setNoon(!p.getBanNum(tn.get(i)).isNoon());
                    }
                    break;
                case 3:
                    for(int i=0; i<n; i++){
                        p.getBanNum(tn.get(i)).setAfternoon(!p.getBanNum(tn.get(i)).isAfternoon());
                    }
                    break;
                default:
                    return false;
            }
            

            session.update(p);
            return true;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false;
        }
    }

}
