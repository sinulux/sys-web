package com.springboot.entity.mybatis;


import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.sql.Date;

/**
 * mapper的实体类
 */
public class UserEO implements Serializable {

    private static final long serialVersionUID = 1L;
    private Long id;
    private String userId;
    private String userName;
    private String passWord;
    private String status;
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createDate;
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date updateDate;

    public enum Sex {Male, FeMale}

    public enum Status {Normal, Removed, Locked, Disabled}

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassWord() {
        return passWord;
    }

    public void setPassWord(String passWord) {
        this.passWord = passWord;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }
}