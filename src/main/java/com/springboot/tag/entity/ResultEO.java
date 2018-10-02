package com.springboot.tag.entity;

public class ResultEO {

    enum Type{
        text,
        list,
        grid
    }

    private Long userId;

    private String htmlStr;

    private String showType;

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getHtmlStr() {
        return htmlStr;
    }

    public void setHtmlStr(String htmlStr) {
        this.htmlStr = htmlStr;
    }

    public String getShowType() {
        return showType;
    }

    public void setShowType(String showType) {
        this.showType = showType;
    }
}
