package com.springboot.entity.mybatis;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class OrganEO {

    private Integer id;//ID

    public enum Type {
        directory,// 组织机构目录
        organ,// 机构
        unit, // 单位
        dept,//部门
        leader,//领导
        personal,//个体经营者
        group, // 社团
        school // 学校
    }

    private String organType;// 组织机构类型

    private String organId ;//组织机构编码

    private String organName; // 组织机构名称

    private String leader; //领导

    private String address;//地址

    private String addressPhone;//办公电话

    private String organDesc;//描述信息

    private String phone; // 联系方式

    private Integer parentId;//上级目录

    @JsonFormat(timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;//创建日期

    @JsonFormat(timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date updateTime; //更新时间

    private Integer updateUser;// 更新人

    private Integer createUser;// 创建人

    private Integer isEffect = Status.Yes.getStatus();

    private enum Status{
        Yes(1),// 有效
        No(0); // 无效
        private Integer status;
        private Status(Integer status){
            this.status=status;
        }
        public Integer getStatus(){
            return status;
        }
    }

    private String recordState = RecordState.Normal.name();

    private enum RecordState{
        Normal,//正常记录
        Removed// 删除
    }

    private String linkUrl;//跳转地址

    private String organIcon;// 图标

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getOrganId() {
        return organId;
    }

    public void setOrganId(String organId) {
        this.organId = organId;
    }

    public String getOrganName() {
        return organName;
    }

    public void setOrganName(String organName) {
        this.organName = organName;
    }

    public String getLeader() {
        return leader;
    }

    public void setLeader(String leader) {
        this.leader = leader;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getAddressPhone() {
        return addressPhone;
    }

    public void setAddressPhone(String addressPhone) {
        this.addressPhone = addressPhone;
    }

    public String getOrganDesc() {
        return organDesc;
    }

    public void setOrganDesc(String organDesc) {
        this.organDesc = organDesc;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public Integer getUpdateUser() {
        return updateUser;
    }

    public void setUpdateUser(Integer updateUser) {
        this.updateUser = updateUser;
    }

    public Integer getCreateUser() {
        return createUser;
    }

    public void setCreateUser(Integer createUser) {
        this.createUser = createUser;
    }

    public String getLinkUrl() {
        return linkUrl;
    }

    public void setLinkUrl(String linkUrl) {
        this.linkUrl = linkUrl;
    }

    public String getOrganIcon() {
        return organIcon;
    }

    public void setOrganIcon(String organIcon) {
        this.organIcon = organIcon;
    }

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    public String getOrganType() {
        return organType;
    }

    public void setOrganType(String organType) {
        this.organType = organType;
    }
}
