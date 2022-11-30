package com.ascent.pojo;


public class User {

    private int id;
    private String username;
    private String password;
    private String phone;
    private String email;
    private String company;
    // 0--普通用户，1--高权用户，2--管理员
    private int role;
    // 1表示删除
    private int deleted;
    // private int status;

    public User() {
    }

    public User(String username, String password) {
        this.username = username;
        this.password = password;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public String getPhone() {
        return this.phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return this.email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCompany() {
        return this.company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public int getRole() {
        return this.role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public int getDeleted() {
        return this.deleted;
    }

    public void setDeleted(int deleted) {
        this.deleted = deleted;
    }

    // public int getStatus() {
    //     return this.status;
    // }

    // public void setStatus(int status) {
    //     this.status = status;
    // }

    public void setUsername(String username) {
        this.username = username;
    }


    public int getId() {
        return id;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
