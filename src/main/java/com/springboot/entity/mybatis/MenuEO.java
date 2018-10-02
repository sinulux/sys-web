package com.springboot.entity.mybatis;

import java.util.List;

public class MenuEO {

    private Integer id;

    private Integer rid;

    private Integer pid;

    private String code;

    private String name;

    private String reqUrl;

    private String status;

    private String type;

    private Integer ord;

    private Integer createUser;

    private List<MenuEO> children;

    private String queryFlag;

    private String iconClass;

    public String getIconClass() {
        return iconClass;
    }

    public void setIconClass(String iconClass) {
        this.iconClass = iconClass;
    }

    public String getQueryFlag() {
        return queryFlag;
    }

    public void setQueryFlag(String queryFlag) {
        this.queryFlag = queryFlag;
    }

    public List<MenuEO> getChildren() {
        return children;
    }

    public void setChildren(List<MenuEO> children) {
        this.children = children;
    }

    public Integer getRid() {
        return rid;
    }

    public void setRid(Integer rid) {
        this.rid = rid;
    }

    public Integer getCreateUser() {
        return createUser;
    }

    public void setCreateUser(Integer createUser) {
        this.createUser = createUser;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getReqUrl() {
        return reqUrl;
    }

    public void setReqUrl(String reqUrl) {
        this.reqUrl = reqUrl;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Integer getOrd() {
        return ord;
    }

    public void setOrd(Integer ord) {
        this.ord = ord;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }
}
