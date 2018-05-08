package com.thoughtWorks.entity;

public class User {
    private String username;
    private String password;
    private Integer roleId;
    private Integer available;
    private String name;
    private String staff;
    private String phone;
    private String email;

    public User() {
    }

    public User(String username, String password, Integer roleId, Integer available, String name, String staff, String phone) {
        this.username = username;
        this.password = password;
        this.roleId = roleId;
        this.available = available;
        this.name = name;
        this.staff = staff;
        this.phone = phone;
    }

    public User(String username, String password, Integer roleId, Integer available, String name, String staff, String phone, String email) {
        this.username = username;
        this.password = password;
        this.roleId = roleId;
        this.available = available;
        this.name = name;
        this.staff = staff;
        this.phone = phone;
        this.email = email;
    }

    public User(String username,String name, String staff, String phone, String email) {
        this.username = username;
        this.name = name;
        this.staff = staff;
        this.phone = phone;
        this.email = email;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
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

    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

    public Integer getAvailable() {
        return available;
    }

    public void setAvailable(Integer available) {
        this.available = available;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getStaff() {
        return staff;
    }

    public void setStaff(String staff) {
        this.staff = staff;
    }
}
