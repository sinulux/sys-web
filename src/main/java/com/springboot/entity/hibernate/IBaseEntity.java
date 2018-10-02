package com.springboot.entity.hibernate;

import java.io.Serializable;
import java.util.Date;

/**
 * 框架基本实体的接口
 */
public interface IBaseEntity extends Serializable {

    public Long getCreateUserId();

    public void setCreateUserId(Long createUserId);

    public Long getCreateOrganId();

    public void setCreateOrganId(Long createOrganId);

    public Long getUpdateUserId();

    public void setUpdateUserId(Long updateUserId);

    public Date getCreateDate();

    public void setCreateDate(Date createDate);

    public Date getUpdateDate();

    public void setUpdateDate(Date updateDate);
}
