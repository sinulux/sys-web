package com.springboot.common.busi;

/**
 * 相应数据
 * @author wangshibao
 */
public class ResponseData {

    private Integer status;

    private String desc;

    private Object data;

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

    public static ResponseData success() {
        ResponseData responseData = new ResponseData();
        responseData.setData(null);
        responseData.setStatus(1);
        responseData.setDesc("操作成功！");
        return responseData;
    }

    public static ResponseData success(String desc) {
        ResponseData responseData = new ResponseData();
        responseData.setData(null);
        responseData.setStatus(1);
        responseData.setDesc(desc);
        return responseData;
    }

    public static ResponseData success(Object data, String desc) {
        ResponseData responseData = new ResponseData();
        responseData.setData(data);
        responseData.setStatus(1);
        responseData.setDesc(desc);
        return responseData;
    }

    public static ResponseData fail() {
        ResponseData responseData = new ResponseData();
        responseData.setData(null);
        responseData.setStatus(0);
        responseData.setDesc("操作失败！");
        return responseData;
    }

    public static ResponseData fail(String desc) {
        ResponseData responseData = new ResponseData();
        responseData.setData(null);
        responseData.setStatus(0);
        responseData.setDesc(desc);
        return responseData;
    }

    public static ResponseData fail(Object data, String desc) {
        ResponseData responseData = new ResponseData();
        responseData.setData(data);
        responseData.setStatus(0);
        responseData.setDesc(desc);
        return responseData;
    }
}
