package com.shixin.entity;

import java.util.Date;

/**
 * @author 今何许
 * @date 2020/5/20 11:04
 */
public class Lend {
    private Integer id;
    private Integer bid;
    private String lender;
    private String ltime;
    private String rtime;
    private String name;
    private Integer lend;
    private Integer day;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getBid() {
        return bid;
    }

    public void setBid(Integer bid) {
        this.bid = bid;
    }

    public String getLender() {
        return lender;
    }

    public void setLender(String lender) {
        this.lender = lender;
    }

    public String getLtime() {
        return ltime;
    }

    public void setLtime(String ltime) {
        this.ltime = ltime;
    }

    public String getRtime() {
        return rtime;
    }

    public void setRtime(String rtime) {
        this.rtime = rtime;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getLend() {
        return lend;
    }

    public void setLend(Integer lend) {
        this.lend = lend;
    }

    public Integer getDay() {
        return day;
    }

    public void setDay(Integer day) {
        this.day = day;
    }
}
