package com.springboot.dao.business.impl;

import com.springboot.dao.business.IAdviceDao;
import com.springboot.dao.business.entity.AdviceEO;
import com.springboot.dao.hibernate.dao.impl.MockDao;
import org.springframework.stereotype.Repository;

@Repository("adviceDao")
public class AdviceDaoImpl extends MockDao<AdviceEO> implements IAdviceDao {

}
