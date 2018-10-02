package com.springboot.entity.hibernate;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class ParamUtil {
    private Map<String, Object> params;
    private StringBuffer hql;
    private Map<String, Object> values1;
    private List<Object> values2;
    private StringBuffer subHql;

    public ParamUtil(Map<String, Object> params, StringBuffer hql, Map<String, Object> values1, List<Object> values2, StringBuffer subHql) {
        this.params = params;
        this.hql = hql;
        this.values1 = values1;
        this.values2 = values2;
        this.subHql = subHql;
    }

    public Map<String, Object> getValues1() {
        return values1;
    }

    public List<Object> getValues2() {
        return values2;
    }

    public StringBuffer getSubHql() {
        return subHql;
    }

    public ParamUtil invoke() {
        if (params != null && params.size() > 0) {
            Set<String> keys = params.keySet();
            for (String key : keys) {
                Object value = params.get(key);
                // 参数为null
                if (value == null) {
                    hql.append(" and t.").append(key).append(" is null");
                } else {
                    // 如果参数是集合或者数组
                    if (value instanceof Collection
                            || value instanceof Object[]) {
                        // 集合或数组参数容器初始化
                        if (values1 == null) {
                            values1 = new HashMap<String, Object>();
                        }
                        if (values1 == null || subHql == null) {
                            subHql = new StringBuffer();
                        }
                        String newKey = key.concat("s");
                        subHql.append(" and t.").append(key).append(" in (:").append(newKey).append(") ");
                        values1.put(newKey, value);
                    } else {
                        if (values2 == null) {
                            values2 = new ArrayList<Object>();
                        }
                        hql.append(" and t.").append(key).append(" = ?");
                        values2.add(value);
                    }
                }
            }
        }
        return this;
    }
}