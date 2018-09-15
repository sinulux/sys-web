package com.springboot.common.util;

import java.util.Map;

public abstract class ThreadUtil {
    public static final ThreadLocal<Map<String, Object>> session = new ThreadLocal();

    private ThreadUtil() {
        throw new Error();
    }

    public static void set(Map<String, Object> map) {
        if (map != null && map.size() > 0) {
            session.set(map);
        }

    }

    public static Object get(ThreadUtil.LocalParamsKey key) {
        if (key != null && !"".equals(key.toString())) {
            Map<String, Object> map = (Map) session.get();
            Object value = null;
            if (map != null && map.size() > 0) {
                value = map.get(key.toString());
            }

            return value;
        } else {
            return null;
        }
    }

    public static Long getLong(ThreadUtil.LocalParamsKey key) {
        Object object = get(key);
        return object == null ? null : Long.valueOf(object.toString());
    }

    public static Integer getInteger(ThreadUtil.LocalParamsKey key) {
        Object object = get(key);
        return object == null ? null : Integer.valueOf(object.toString());
    }

    public static String getString(ThreadUtil.LocalParamsKey key) {
        Object object = get(key);
        return object == null ? null : object.toString();
    }

    public static enum LocalParamsKey {
        UserId,
        Uid,
        PersonName,
        OrganId,
        OrganName,
        Callback,
        DataFlag,
        IP,
        ConvertCN,
        OP_MenuId,
        OP_ColumnId,
        OP_OrganId,
        OP_CatId;

        private LocalParamsKey() {
        }
    }
}
