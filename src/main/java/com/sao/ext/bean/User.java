package com.sao.ext.bean;

/**
 * Created by navia on 2015/3/1.
 */
public class User {
    private int xid;
    private String name;

    public User() {
    }

    public User(int xid, String name) {
        this.xid = xid;
        this.name = name;
    }

    public int getXid() {
        return xid;
    }

    public void setXid(int xid) {
        this.xid = xid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
