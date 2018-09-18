package com.springboot.dao.business;

import com.springboot.dao.business.entity.RoleEO;
import com.springboot.dao.business.vo.QueryRoleVO;
import com.springboot.dao.hibernate.dao.IMockDao;
import com.springboot.dao.hibernate.entity.Pagination;

public interface IRoleDao extends IMockDao<RoleEO> {

    /**
     * 分页查询
     */
    Pagination getPage(QueryRoleVO queryRoleVO);
}
