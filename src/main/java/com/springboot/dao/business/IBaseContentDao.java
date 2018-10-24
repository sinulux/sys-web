package com.springboot.dao.business;

import com.springboot.dao.hibernate.IMockDao;
import com.springboot.entity.business.BaseContentEO;

public interface IBaseContentDao extends IMockDao<BaseContentEO> {
    public Long getLastVersion();
}