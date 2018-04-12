package com.thoughtWorks.entity;

public class User {
    private String username;
    private String password;
    private Integer roleId;
    private Integer available;
    private String name;
    private String staff;

    public User() {
    }

    public User(String username, String password, Integer roleId, Integer available, String name, String staff) {
        this.username = username;
        this.password = password;
        this.roleId = roleId;
        this.available = available;
        this.name = name;
        this.staff = staff;
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
