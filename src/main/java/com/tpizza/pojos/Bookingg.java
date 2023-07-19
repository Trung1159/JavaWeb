package com.tpizza.pojos;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;


@Entity
@Table(name = "book")
public class Bookingg implements Serializable {

    private static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Column(name = "date_time")
    @Temporal(TemporalType.TIMESTAMP)
    private Date dateTime;
    
    @JoinColumn(name = "ban1", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private TimeSlot ban1;
    @JoinColumn(name = "ban2", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private TimeSlot ban2;
    @JoinColumn(name = "ban3", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private TimeSlot ban3;
    @JoinColumn(name = "ban4", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private TimeSlot ban4;
    @JoinColumn(name = "ban5", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private TimeSlot ban5;
    
    @JoinColumn(name = "ban6", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private TimeSlot ban6;
    @JoinColumn(name = "ban7", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private TimeSlot ban7;
    @JoinColumn(name = "ban8", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private TimeSlot ban8;
    @JoinColumn(name = "ban9", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private TimeSlot ban9;
    @JoinColumn(name = "ban10", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private TimeSlot ban10;
    @JoinColumn(name = "ban11", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private TimeSlot ban11;
    @JoinColumn(name = "ban12", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private TimeSlot ban12;
    @JoinColumn(name = "ban13", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private TimeSlot ban13;
    @JoinColumn(name = "ban14", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private TimeSlot ban14;
    @JoinColumn(name = "ban15", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private TimeSlot ban15;

    @Transient
    private String strDate = sdf.format(new Date());

    public Bookingg() {
    }

    public Bookingg(Integer id, Date dateTime) {
        this.id = id;
        this.dateTime = dateTime;
    }
    
    public TimeSlot getBanNum(int n){
        switch (n) {
            case 1:
                return ban1;
            case 2:
                return ban2;
            case 3:
                return ban3;
            case 4:
                return ban4;
            case 5:
                return ban5;
                
            case 6:
                return ban6;
            case 7:
                return ban7;
            case 8:
                return ban8;
            case 9:
                return ban9;
            case 10:
                return ban10;
            case 11:
                return ban11;
            case 12:
                return ban12;
            case 13:
                return ban13;
            case 14:
                return ban14;
            case 15:
                return ban15;
            default:
                return null;
        }
    }

    public TimeSlot getBan1() {
        return ban1;
    }

    public void setBan1(TimeSlot ban1) {
        this.ban1 = ban1;
    }

    public TimeSlot getBan2() {
        return ban2;
    }

    public void setBan2(TimeSlot ban2) {
        this.ban2 = ban2;
    }

    public TimeSlot getBan3() {
        return ban3;
    }

    public void setBan3(TimeSlot ban3) {
        this.ban3 = ban3;
    }

    public TimeSlot getBan4() {
        return ban4;
    }

    public void setBan4(TimeSlot ban4) {
        this.ban4 = ban4;
    }

    public TimeSlot getBan5() {
        return ban5;
    }

    public void setBan5(TimeSlot ban5) {
        this.ban5 = ban5;
    }

    public TimeSlot getBan6() {
        return ban6;
    }

    public void setBan6(TimeSlot ban6) {
        this.ban6 = ban6;
    }

    public TimeSlot getBan7() {
        return ban7;
    }

    public void setBan7(TimeSlot ban7) {
        this.ban7 = ban7;
    }

    public TimeSlot getBan8() {
        return ban8;
    }

    public void setBan8(TimeSlot ban8) {
        this.ban8 = ban8;
    }

    public TimeSlot getBan9() {
        return ban9;
    }

    public void setBan9(TimeSlot ban9) {
        this.ban9 = ban9;
    }

    public TimeSlot getBan10() {
        return ban10;
    }

    public void setBan10(TimeSlot ban10) {
        this.ban10 = ban10;
    }

    public TimeSlot getBan11() {
        return ban11;
    }

    public void setBan11(TimeSlot ban11) {
        this.ban11 = ban11;
    }

    public TimeSlot getBan12() {
        return ban12;
    }

    public void setBan12(TimeSlot ban12) {
        this.ban12 = ban12;
    }

    public TimeSlot getBan13() {
        return ban13;
    }

    public void setBan13(TimeSlot ban13) {
        this.ban13 = ban13;
    }

    public TimeSlot getBan14() {
        return ban14;
    }

    public void setBan14(TimeSlot ban14) {
        this.ban14 = ban14;
    }

    public TimeSlot getBan15() {
        return ban15;
    }

    public void setBan15(TimeSlot ban15) {
        this.ban15 = ban15;
    }

    

    
    
    public String getStrDate() {
        return strDate;
    }
    

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getDateTime() {
        return dateTime;
    }

    public void setDateTime(Date dateTime) {
        this.dateTime = dateTime;
        this.strDate = this.dateTime.toString(); //sdf.format(this.dateTime);
    }

}
