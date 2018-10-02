package com.springboot.dao.business.impl;

import com.springboot.dao.business.IAdviceDao;
import com.springboot.entity.business.AdviceEO;
import com.springboot.dao.hibernate.impl.MockDao;
import org.springframework.stereotype.Repository;

@Repository("adviceDao")
public class AdviceDaoImpl extends MockDao<AdviceEO> implements IAdviceDao {

}
