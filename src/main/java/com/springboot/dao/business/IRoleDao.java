package com.springboot.dao.business;

import com.springboot.entity.business.RoleEO;
import com.springboot.vo.QueryRoleVO;
import com.springboot.dao.hibernate.IMockDao;
import com.springboot.entity.hibernate.Pagination;

public interface IRoleDao extends IMockDao<RoleEO> {

    /**
     * 分页查询
     */
    Pagination getPage(QueryRoleVO queryRoleVO);
}
