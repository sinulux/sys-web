package com.springboot.dao.hibernate.impl;

import com.springboot.common.busi.BaseRunTimeException;
import com.springboot.common.busi.RecordsException;
import com.springboot.common.util.ThreadUtil;
import com.springboot.dao.hibernate.IBaseDao;
import com.springboot.entity.hibernate.IBaseEntity;
import com.springboot.entity.hibernate.IMockEntity;
import com.springboot.entity.hibernate.ParamUtil;
import com.springboot.entity.hibernate.Pagination;
import org.apache.commons.lang3.StringUtils;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.transform.Transformers;
import org.hibernate.type.StandardBasicTypes;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.io.Serializable;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * 数据库访问层实现
 *
 * @param <T>
 */
@Repository("baseDao")
@Transactional
public class BaseDao<T extends IBaseEntity> implements IBaseDao<T> {

    @Autowired
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public Session getCurrentSession() {
        return sessionFactory.getCurrentSession();
    }

    /**
     * 根据hql获取Entity对象
     *
     * @param hql
     * @return
     */
    public T getEntityByHql(final String hql, final Object[] values) {
        List<T> entities = getEntitiesByHql(hql, values);
        T entity = null;
        if (entities != null && entities.size() > 0) {
            if (entities.size() == 1) {
                entity = entities.get(0);
            } else {
                throw new BaseRunTimeException();
            }
        }
        return entity;
    }

    @Override
    public Long save(final T t) {
        if (t.getCreateDate() == null) {
            Date date = new Date();
            t.setCreateDate(date);
            t.setUpdateDate(date);
        }
        if (t.getCreateUserId() == null) {
            Long userId = ThreadUtil.getLong(ThreadUtil.LocalParamsKey.UserId);
            t.setCreateUserId(userId);
            t.setUpdateUserId(userId);
        }
        if (t.getCreateOrganId() == null) {
            t.setCreateOrganId(ThreadUtil.getLong(ThreadUtil.LocalParamsKey.OrganId));
        }
        Serializable seralizable = getCurrentSession().save(t);
        return Long.valueOf(seralizable.toString());
    }

    @Override
    public void save(final Collection<T> ts) {
        if (ts != null && ts.size() > 0) {
            for (T t : ts) {
                save(t);
            }
        }
    }

    @Override
    public void save(final T[] ts) {
        if (ts != null && ts.length > 0) {
            for (T t : ts) {
                save(t);
            }
        }
    }

    @Override
    public void update(final T t) {
        if (t != null) {
            t.setUpdateDate(new Date());
            t.setUpdateUserId(ThreadUtil.getLong(ThreadUtil.LocalParamsKey.UserId));
            getCurrentSession().update(t);
        }
    }

    @Override
    public void updateProperties(Class<IMockEntity> clazz,
                                 Map<String, Object> items, Map<String, Object> properties) {
        StringBuffer hql = new StringBuffer("update ").append(
                clazz.getSimpleName()).append(" set 1=1");
        Set<String> keys = properties.keySet();
        for (String key : keys) {
            hql.append(" , ").append(key).append("=")
                    .append(properties.get(key));
        }
        hql.append(" where 1=1 ");
        Set<String> itemKeys = items.keySet();
        for (String key : itemKeys) {
            hql.append(" and ").append(key).append("=").append(items.get(key));
        }
        Query query = getCurrentSession().createQuery(hql.toString());
        query.executeUpdate();
    }

    @Override
    public void update(final Collection<T> ts) {
        if (ts != null && ts.size() > 0) {
            for (T t : ts) {
                update(t);
            }
        }
    }

    @Override
    public void update(final T[] ts) {
        if (ts != null && ts.length > 0) {
            for (T t : ts) {
                update(t);
            }
        }

    }

    @Override
    public void saveOrUpdate(final T t) {
        if (t != null) {
            getCurrentSession().saveOrUpdate(t);
        }
    }

    @Override
    public void saveOrUpdate(final Collection<T> ts) {
        if (ts != null && ts.size() > 0) {
            for (T t : ts) {
                saveOrUpdate(t);
            }
        }
    }

    @Override
    public void saveOrUpdate(final T[] ts) {
        if (ts != null && ts.length > 0) {
            for (T t : ts) {
                saveOrUpdate(t);
            }
        }
    }

    @Override
    public int saveOrUpdate(final String hql, final Map<String, Object> params) {
        if (StringUtils.isEmpty(hql) || "".equals(hql)) {
            return 0;
        }
        Query query = getCurrentSession().createQuery(hql);
        setParameters(params, query);
        return query.executeUpdate();
    }


    @Override
    public void delete(final T t) {
        if (t != null) {
            getCurrentSession().delete(t);
        }
    }

    @Override
    public void delete(final Collection<T> ts) {
        if (ts != null && ts.size() > 0) {
            for (T t : ts) {
                delete(t);
            }
        }
    }

    @Override
    public void delete(final T[] ts) {
        if (ts != null && ts.length > 0) {
            for (T t : ts) {
                delete(t);
            }
        }
    }

    @SuppressWarnings("unchecked")
    @Override
    public void delete(final Class<T> clazz, final Long id) {
        if (id != null && clazz != null) {
            T entity = (T) getCurrentSession().get(clazz, id);
            if (entity != null) {
                // 假删除
                delete(entity);
            }
        }
    }

    @Override
    public void delete(final Class<T> clazz, final Collection<Long> ids) {
        if (ids != null && ids.size() > 0) {
            for (Long id : ids) {
                delete(clazz, id);
            }
        }
    }

    @Override
    public void delete(final Class<T> clazz, final Long[] ids) {
        if (ids != null && ids.length > 0) {
            for (Long id : ids) {
                delete(clazz, id);
            }
        }
    }

    /**
     * 根据hql获取Object对象
     *
     * @param hql
     * @param values
     * @return
     */
    @Override
    public Object getObject(final String hql, final Object[] values) {
        List<?> entities = getEntitiesByHql(hql, values);
        Object object = null;
        if (entities != null) {
            if (entities.size() == 1) {
                object = entities.get(0);
            } else {
                throw new RuntimeException();
            }
        }
        return object;
    }

    @Override
    public Object getBean(final String hql, final Object[] values, Class<?> convertBean) {
        List<?> entities = getBeansByHql(hql, values, convertBean);
        Object object = null;
        if (entities != null) {
            if (entities.size() == 1) {
                object = entities.get(0);
            } else {
                throw new RuntimeException();
            }
        }
        return object;
    }

    @Override
    public Object getBeanBySql(final String sql, final Object[] values, Class<?> convertBean) {

        return getBeanBySql(sql, values, convertBean, null);
    }

    @Override
    public Object getBeanBySql(final String sql, final Object[] values, Class<?> convertBean, String[] queryFields) {
        List<?> entities = getBeansBySql(sql, values, convertBean, queryFields);
        Object object = null;
        if (entities != null) {
            if (entities.size() == 1) {
                object = entities.get(0);
            } else {
                throw new RuntimeException();
            }
        }
        return object;
    }

    @Override
    public List<T> getEntitiesByHql(final String hql, final Object[] values) {
        if (hql == null || "".equals(hql)) {
            return null;
        }
        Query query = getCurrentSession().createQuery(hql);
        setParameters(values, query);
        return query.list();
    }

    /**
     * 根据params(Map<String,Object>)获取对象列表,支持  = 和  in 两种关键字
     * @param clazz
     * @param params key:属性，value：属性值,支持  = 和  in 两种关键字
     */
    public List<T> getEntities(final Class<T> clazz, final Map<String, Object> params) {
        StringBuffer hql = new StringBuffer("from ");
        hql.append(clazz.getSimpleName()).append(" t where 1=1");
        Map<String, Object> values1 = null;
        List<Object> values2 = null;
        StringBuffer subHql = null;
        ParamUtil paramUtil = new ParamUtil(params, hql, values1, values2, subHql).invoke();
        values1 = paramUtil.getValues1();
        values2 = paramUtil.getValues2();
        subHql = paramUtil.getSubHql();
        if (subHql != null) {
            hql = hql.append(subHql);
        }
        Query query = getCurrentSession().createQuery(hql.toString());
        if (values2 != null) {
            setParameters(values2.toArray(), query);
        }
        if (values1 != null) {
            setParameters(values1, query);
        }
        return (List<T>) query.list();
    }

    @Override
    public T getEntity(final Class<T> clazz, final Map<String, Object> params) {
        List<T> ts = getEntities(clazz, params);
        T t = null;
        if (ts != null && ts.size() > 0) {
            if (ts.size() != 1) {
                throw new RecordsException();
            }
            t = ts.get(0);
        }
        return t;
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<T> getEntitiesByHql(final String hql, final Map<String, Object> values) {
        if (hql == null || "".equals(hql)) {
            return null;
        }
        Query query = getCurrentSession().createQuery(hql);
        setParameters(values, query);
        return query.list();
    }


    @Override
    public List<?> getBeansByHql(final String hql, final Object[] values,
                                 Class<?> convertBean) {
        Query query = getCurrentSession().createQuery(hql);
        setParameters(values, query);
        query.setResultTransformer(Transformers.aliasToBean(convertBean));
        return query.list();
    }

    @Override
    public List<?> getBeansByHql(final String hql, final Object[] values, Class<?> convertBean, Integer limit) {
        Query query = getCurrentSession().createQuery(hql);
        setParameters(values, query);
        query.setResultTransformer(Transformers.aliasToBean(convertBean));
        return query.list();
    }

    /**
     * 根据hql获取Entity对象集合
     *
     * @param hql
     * @param params
     * @param convertBean
     * @param limit
     * @return convertBean
     */
    @Override
    public List<?> getBeansByHql(String hql, Map<String, Object> params, Class<?> convertBean, Integer limit) {
        Query query = getCurrentSession().createQuery(hql);
        setParameters(params, query);
        if (null != limit) {
            query.setMaxResults(limit);
        }
        query.setResultTransformer(Transformers.aliasToBean(convertBean));
        return query.list();
    }

    @Override
    public List<?> getBeansBySql(final String sql, final Object[] values, Class<?> convertBean) {

        return getBeansBySql(sql, values, convertBean, null);

    }

    @Override
    public List<?> getBeansBySql(final String sql, final Object[] values, Class<?> convertBean, String[] queryFields) {
        if (sql == null || "".equals(sql)) {
            return null;
        }
        SQLQuery q = getCurrentSession().createSQLQuery(sql);
        addSclar(q, convertBean, queryFields);
        setParameters(values, q);
        q.setResultTransformer(Transformers.aliasToBean(convertBean));
        return q.list();
    }

    @Override
    public List<?> getBeansBySql(final String sql, final Object[] values, Class<?> convertBean, String[] queryFields, Integer limit) {
        if (sql == null || "".equals(sql)) {
            return null;
        }
        SQLQuery q = getCurrentSession().createSQLQuery(sql);
        addSclar(q, convertBean, queryFields);
        setParameters(values, q);
        if (null != limit) {
            q.setMaxResults(limit);
        }
        q.setResultTransformer(Transformers.aliasToBean(convertBean));
        return q.list();
    }

    @Override
    public List<?> getObjectsBySql(String sql, final Object[] values) {
        if (sql == null || "".equals(sql)) {
            return null;
        }
        if (!sql.startsWith("select")) {
            sql = "select * ".concat(sql);
        }
        SQLQuery q = getCurrentSession().createSQLQuery(sql);
        setParameters(values, q);
        q.setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
        return q.list();
    }

    @Override
    public List<?> getObjectsBySql(final String sql, final Map<String, Object> values) {
        if (sql == null || "".equals(sql)) {
            return null;
        }
        SQLQuery q = getCurrentSession().createSQLQuery(sql);
        setParameters(values, q);
        return q.list();
    }

    /**
     * 为Query设置查询参数
     *
     * @param values
     * @param q
     */
    private void setParameters(final Object[] values, final Query q) {
        if (null != values && values.length > 0) {
            for (Integer i = 0; i < values.length; ++i) {
                q.setParameter(i, values[i]);
            }
        }
    }

    /**
     * 为Query设置查询参数
     *
     * @param params
     * @param q
     */
    private void setParameters(final Map<String, Object> params, final Query q) {
        if (null != params && params.size() > 0) {
            Set<String> keys = params.keySet();
            for (String key : keys) {
                Object value = params.get(key);
                if (value instanceof Object[]) {
                    q.setParameterList(key, (Object[]) value);
                } else if (value instanceof Collection<?>) {
                    q.setParameterList(key, (Collection<?>) value);
                } else if (value instanceof List<?>) {
                    q.setParameterList(key, (List<?>) value);
                } else {
                    q.setParameter(key, value);
                }
            }
        }
    }

    @SuppressWarnings("unchecked")
    @Override
    public T getEntity(final Class<?> clazz, final Long id) {
        if (clazz == null || id == null) {
            return null;
        }
        return (T) getCurrentSession().get(clazz, id);
    }

    @Override
    @Deprecated
    public List<T> getEntities(final Class<?> clazz, final List<Long> ids) {
        if (clazz == null || ids == null || ids.size() <= 0) {
            throw new NullPointerException("One of the arguments is null.");
        }
        List<T> entities = new ArrayList<T>(ids.size());
        for (Long id : ids) {
            T entity = getEntity(clazz, id);
            entities.add(entity);
        }
        return entities;
    }

    @Override
    @Deprecated
    public List<T> getEntities(final Class<?> clazz, final Long[] ids) {
        if (clazz == null || ids == null || ids.length <= 0) {
            throw new NullPointerException("One of the arguments is null.");
        }
        List<T> entities = new ArrayList<T>(ids.length);
        for (Long id : ids) {
            T entity = getEntity(clazz, id);
            entities.add(entity);
        }
        return entities;
    }

    @Override
    public List<?> getObjects(final String hql, final Object[] values) {
        if (hql == null || "".equals(hql)) {
            return null;
        }
        Query query = getCurrentSession().createQuery(hql);
        setParameters(values, query);
        return query.list();
    }

    @Override
    public Pagination getPagination(final Long pageIndex, final Integer pageSize,
                                    String hql, final Object[] values) {
        //分页数量边界控制
        if (pageSize <= 0 || pageSize > Pagination.MAX_SIZE) {
            throw new BaseRunTimeException();
        }
        List<?> results = getPaginationRecores(hql,
                Pagination.getStartNumber(pageIndex, pageSize).intValue(),
                Pagination.getPageSize(pageSize), values);
        Long count = getCount(hql, values);
        Pagination page = new Pagination(results, count, pageSize, pageIndex);
        return page;
    }

    @Override
    public Pagination getPagination(final Long pageIndex, final Integer pageSize,
                                    String hql, final Map<String, Object> values) {
        //分页数量边界控制
        if (pageSize <= 0 || pageSize > Pagination.MAX_SIZE) {
            throw new BaseRunTimeException();
        }
        List<?> results = getPaginationRecores(hql,
                Pagination.getStartNumber(pageIndex, pageSize).intValue(),
                Pagination.getPageSize(pageSize), values);
        Long count = getCount(hql, values);
        Pagination page = new Pagination(results, count, pageSize,
                pageIndex);
        return page;
    }

    @Override
    public Pagination getPagination(final Long pageIndex,
                                    final Integer pageSize, String hql, final Object[] values,
                                    final Class<?> convertBean) {
        // 分页数量边界控制
        if (pageSize <= 0 || pageSize > Pagination.MAX_SIZE) {
            throw new BaseRunTimeException();
        }
        List<Object> results = getPaginationRecores(hql, Pagination
                        .getStartNumber(pageIndex, pageSize).intValue(),
                Pagination.getPageSize(pageSize), values, convertBean);
        Long count = getCount(hql, values);
        Pagination page = new Pagination(results, count, pageSize, pageIndex);
        return page;
    }

    @Override
    public Pagination getPaginationBySql(final Long pageIndex,
                                         final Integer pageSize, String sql, final Object[] values,
                                         final Class<?> convertBean) {
        return getPaginationBySql(pageIndex, pageSize, sql, values, convertBean, null);
    }

    @Override
    public Pagination getPaginationBySql(final Long pageIndex,
                                         final Integer pageSize, String sql, final Object[] values,
                                         final Class<?> convertBean, String[] queryFields) {
        // 分页数量边界控制
        if (pageSize <= 0 || pageSize > Pagination.MAX_SIZE) {
            throw new BaseRunTimeException();
        }
        List<?> results = getPaginationRecoresBySql(sql, Pagination
                        .getStartNumber(pageIndex, pageSize).intValue(),
                Pagination.getPageSize(pageSize), values, convertBean, queryFields);
        Long count = getCountBySql(sql, values);
        Pagination page = new Pagination(results, count, pageSize, pageIndex);
        return page;
    }


    @Override
    public List<?> getPaginationRecores(final String hql, final int first,
                                        final int max, final Map<String, Object> values) {
        if (hql == null || first < 0 || max <= 0) {
            return null;
        }
        Query q = getCurrentSession().createQuery(hql.toString());
        setParameters(values, q);
        q.setFirstResult(first);
        q.setMaxResults(max);
        return q.list();
    }

    @Override
    public List<?> getPaginationRecores(final String hql, final int first,
                                        final int max, final Object[] values) {
        if (hql == null || first < 0 || max <= 0) {
            return null;
        }
        Query q = getCurrentSession().createQuery(hql);
        setParameters((Object[]) values, q);
        q.setFirstResult(first);
        q.setMaxResults(max);
        return q.list();
    }

    @Override
    public List<?> getPaginationRecoresBySql(final String sql, final int first,
                                             final int max, final Object[] values, final Class<?> convertBean, final String[] queryFields) {
        if (sql == null || first < 0 || max <= 0) {
            return null;
        }
        String fullSql = null;
        if (!sql.startsWith("select")) {
            fullSql = "select * ".concat(sql);
        } else {
            fullSql = sql;
        }
        SQLQuery q = getCurrentSession().createSQLQuery(fullSql);
        addSclar(q, convertBean, queryFields);
        setParameters((Object[]) values, q);
        q.setFirstResult(first);
        q.setMaxResults(max);
        q.setResultTransformer(Transformers.aliasToBean(convertBean));
        return q.list();
    }

    @Override
    public List<?> getPaginationRecoresBySql(final String sql, final int first,
                                             final int max, final Object[] values) {
        if (sql == null || first < 0 || max <= 0) {
            return null;
        }
        String fullSql = null;
        if (!sql.startsWith("select")) {
            fullSql = "select * ".concat(sql);
        } else {
            fullSql = sql;
        }
        Query q = getCurrentSession().createSQLQuery(fullSql);
        setParameters((Object[]) values, q);
        q.setFirstResult(first);
        q.setMaxResults(max);
        q.setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
        return q.list();
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<Object> getPaginationRecores(final String hql, final int first,
                                             final int max, final Object[] values, final Class<?> convertBean) {
        if (StringUtils.isEmpty(hql) || first < 0 || max <= 0) {
            return null;
        }
        Query q = getCurrentSession().createQuery(hql.toString());
        setParameters((Object[]) values, q);
        q.setFirstResult(first);
        q.setMaxResults(max);
        q.setResultTransformer(Transformers.aliasToBean(convertBean));
        return q.list();
    }

    /**
     * 通用的查询语句返回结果数的实现
     */
    @Override
    public Long getCount(String hql, final Object[] values) {
        if (StringUtils.isEmpty(hql)) {
            return Long.valueOf(0);
        }
        Long count = Long.valueOf(0);
        if (hql.trim().startsWith("select")) {
            Query query = getCurrentSession().createQuery(hql);
            setParameters(values, query);
            count = Long.valueOf(query.list().size());
        } else {
            hql = "select count(*) ".concat(hql);
            Query query = getCurrentSession().createQuery(hql);
            setParameters(values, query);
            List<?> list = query.list();

            if (list != null && list.size() == 1) {
                count = Long.valueOf(list.get(0).toString());
            }
        }
        return count;
    }

    @Override
    public Long getCountBySql(String sql, final Object[] values) {
        if (StringUtils.isEmpty(sql)) {
            return Long.valueOf(0);
        }
        Long count = Long.valueOf(0);
        if (sql.trim().startsWith("select")) {
            Query query = getCurrentSession().createSQLQuery(sql);
            setParameters(values, query);
            count = Long.valueOf(query.list().size());
        } else {
            sql = "select count(*) ".concat(sql);
            Query query = getCurrentSession().createSQLQuery(sql);
            setParameters(values, query);
            List<?> list = query.list();

            if (list != null && list.size() == 1) {
                count = Long.valueOf(list.get(0).toString());
            }
        }
        return count;
    }

    /**
     * 通用的查询语句返回结果数的实现
     */
    @Override
    public Long getCount(String hql, final Map<String, Object> values) {
        if (hql == null) {
            return Long.valueOf(0);
        }
        hql = "select count(*) ".concat(hql);
        Query query = getCurrentSession().createQuery(hql);
        setParameters(values, query);
        List<?> list = query.list();
        Long count = Long.valueOf(0);
        if (list != null && list.size() == 1) {
            count = Long.valueOf(list.get(0).toString());
        }
        return count;
    }

    @Override
    public int executeUpdateByHql(String hql, Object[] values) {
        Query query = getCurrentSession().createQuery(hql);
        setParameters((Object[]) values, query);
        return query.executeUpdate();
    }

    @Override
    public int executeUpdateBySql(String sql, Object[] values) {
        SQLQuery query = getCurrentSession().createSQLQuery(sql);
        setParameters(values, query);
        return query.executeUpdate();
    }

    private void addSclar(SQLQuery sqlQuery, Class<?> clazz, String[] queryFields) {
        if (clazz == null) {
            throw new NullPointerException("[clazz] could not be null!");
        }
        Field[] fields = clazz.getDeclaredFields();
        if (null == queryFields) {
            for (Field field : fields) {
                if ((field.getType() == long.class) || (field.getType() == Long.class)) {
                    sqlQuery.addScalar(field.getName(), StandardBasicTypes.LONG);
                } else if ((field.getType() == int.class) || (field.getType() == Integer.class)) {
                    sqlQuery.addScalar(field.getName(), StandardBasicTypes.INTEGER);
                } else if ((field.getType() == char.class) || (field.getType() == Character.class)) {
                    sqlQuery.addScalar(field.getName(), StandardBasicTypes.CHARACTER);
                } else if ((field.getType() == short.class) || (field.getType() == Short.class)) {
                    sqlQuery.addScalar(field.getName(), StandardBasicTypes.SHORT);
                } else if ((field.getType() == double.class) || (field.getType() == Double.class)) {
                    sqlQuery.addScalar(field.getName(), StandardBasicTypes.DOUBLE);
                } else if ((field.getType() == float.class) || (field.getType() == Float.class)) {
                    sqlQuery.addScalar(field.getName(), StandardBasicTypes.FLOAT);
                } else if ((field.getType() == boolean.class) || (field.getType() == Boolean.class)) {
                    sqlQuery.addScalar(field.getName(), StandardBasicTypes.BOOLEAN);
                } else if (field.getType() == String.class) {
                    sqlQuery.addScalar(field.getName(), StandardBasicTypes.STRING);
                } else if (field.getType() == Date.class) {
                    sqlQuery.addScalar(field.getName(), StandardBasicTypes.TIMESTAMP);
                }
            }
        } else {
            for (String fieldName : queryFields) {
                for (Field field : fields) {
                    if (fieldName.equals(field.getName())) {
                        if ((field.getType() == long.class) || (field.getType() == Long.class)) {
                            sqlQuery.addScalar(field.getName(), StandardBasicTypes.LONG);
                        } else if ((field.getType() == int.class) || (field.getType() == Integer.class)) {
                            sqlQuery.addScalar(field.getName(), StandardBasicTypes.INTEGER);
                        } else if ((field.getType() == char.class) || (field.getType() == Character.class)) {
                            sqlQuery.addScalar(field.getName(), StandardBasicTypes.CHARACTER);
                        } else if ((field.getType() == short.class) || (field.getType() == Short.class)) {
                            sqlQuery.addScalar(field.getName(), StandardBasicTypes.SHORT);
                        } else if ((field.getType() == double.class) || (field.getType() == Double.class)) {
                            sqlQuery.addScalar(field.getName(), StandardBasicTypes.DOUBLE);
                        } else if ((field.getType() == float.class) || (field.getType() == Float.class)) {
                            sqlQuery.addScalar(field.getName(), StandardBasicTypes.FLOAT);
                        } else if ((field.getType() == boolean.class) || (field.getType() == Boolean.class)) {
                            sqlQuery.addScalar(field.getName(), StandardBasicTypes.BOOLEAN);
                        } else if (field.getType() == String.class) {
                            sqlQuery.addScalar(field.getName(), StandardBasicTypes.STRING);
                        } else if (field.getType() == Date.class) {
                            sqlQuery.addScalar(field.getName(), StandardBasicTypes.TIMESTAMP);
                        }
                    }
                }
            }
        }


    }

}
