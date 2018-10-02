package com.springboot.dao.business.impl;

import com.springboot.dao.business.IRoleDao;
import com.springboot.entity.business.RoleEO;
import com.springboot.vo.QueryRoleVO;
import com.springboot.dao.hibernate.impl.MockDao;
import com.springboot.entity.hibernate.Pagination;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.Map;

@Repository("RoleDao")
public class RoleDaoImpl extends MockDao<RoleEO> implements IRoleDao {

    @Override
    public Pagination getPage(QueryRoleVO queryRoleVO) {
        StringBuffer hql = new StringBuffer("from RoleEO where recordStatus =:recordStatus");
        Map<String,Object> map = new HashMap<>();
        map.put("recordStatus",RoleEO.RecordStatus.Normal.name());
        if(!StringUtils.isEmpty(queryRoleVO.getSearchKey())){
            hql.append(" and roleCode=:roleCode");
            map.put("roleCode",queryRoleVO.getSearchKey());
            hql.append(" or roleName like concat(concat('%',:roleName),'%')");
            map.put("roleName",queryRoleVO.getSearchKey());
        }
        if(queryRoleVO.getOrganId() != null){
            hql.append(" and createOrganId=:organId");
            map.put("organId",queryRoleVO.getOrganId());
        }
        hql.append(" order by createDate desc");
        return getPagination(queryRoleVO.getPageIndex(),queryRoleVO.getPageSize(),hql.toString(),map);
    }
}
