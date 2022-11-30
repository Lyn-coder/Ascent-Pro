package com.ascent.vo;

/**
 * @ClassName UserVo
 * @Author Levin
 * @Date 2022/11/15 1:04
 * @Version 1.0
 **/
public class UserVo {

    private int id;
    private String username;
    private String password;
    private String phone;
    private String email;
    private String company;
    // 0--普通用户，1--高权用户，2--管理员
    private String role;
    // 1表示删除
    private int deleted;

    public UserVo() {
    }

    public UserVo(int id, String username,
                  String password, String phone,
                  String email, String company,
                  String role, int deleted) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.phone = phone;
        this.email = email;
        this.company = company;
        this.role = role;
        this.deleted = deleted;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public int getDeleted() {
        return deleted;
    }

    public void setDeleted(int deleted) {
        this.deleted = deleted;
    }
}
