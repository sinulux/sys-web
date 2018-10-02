package com.springboot.entity.hibernate;

import java.io.Serializable;
import java.util.Date;

/**
 * 框架基本实体的接口
 */
public interface IMockEntity extends Serializable {

    public String getRecordStatus();

    public void setRecordStatus(String recordStatus);

    public Long getCreateUserId();

    public void setCreateUserId(Long createUserId);

    public Long getUpdateUserId();

    public void setUpdateUserId(Long updateUserId);

    public Date getCreateDate();

    public void setCreateDate(Date createDate);

    public Date getUpdateDate();

    public void setUpdateDate(Date updateDate);

    public Long getCreateOrganId();

    public void setCreateOrganId(Long createOrganId);
}
