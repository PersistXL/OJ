package com.thoughtWorks.entity;

import java.io.Serializable;
import java.util.List;

public class ActiveUser implements Serializable {
    private boolean available;
    private String userName;
    private String password;
    private int roleId;
    private List<Permission> menus;// 菜单
    private List<Permission> permissions;// 权限

    public boolean isAvailable() {
        return available;
    }

    public void setAvailable(boolean available) {
        this.available = available;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public List<Permission> getMenus() {
        return menus;
    }

    public void setMenus(List<Permission> menus) {
        this.menus = menus;
    }

    public List<Permission> getPermissions() {
        return permissions;
    }

    public void setPermissions(List<Permission> permissions) {
        this.permissions = permissions;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    @Override
    public String toString() {
        return "ActiveUser{" +
                "available=" + available +
                ", userName='" + userName + '\'' +
                ", password='" + password + '\'' +
                ", roleId=" + roleId +
                ", menus=" + menus +
                ", permissions=" + permissions +
                '}';
    }
}
