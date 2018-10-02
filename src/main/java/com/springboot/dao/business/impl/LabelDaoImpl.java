package com.springboot.dao.business.impl;

import com.springboot.dao.business.ILabelDao;
import com.springboot.dao.hibernate.impl.BaseDao;
import com.springboot.tag.entity.LabelEO;
import org.springframework.stereotype.Repository;

@Repository("labelDao")
public class LabelDaoImpl extends BaseDao<LabelEO> implements ILabelDao {
}
