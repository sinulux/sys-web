package com.springboot.dao.business.impl;

import com.springboot.dao.business.IBaseContentDao;
import com.springboot.dao.hibernate.impl.MockDao;
import com.springboot.entity.business.BaseContentEO;
import org.hibernate.Query;
import org.springframework.stereotype.Repository;

@Repository("baseContentDao")
public class BaseContentDaoImpl extends MockDao<BaseContentEO> implements IBaseContentDao {
    @Override
    public Long getLastVersion() {
        String hql = "select max(id) from BaseContentEO";
        Query query = getCurrentSession().createQuery(hql);
        Long maxid = (Long)query.uniqueResult();
        return maxid;
    }
}
