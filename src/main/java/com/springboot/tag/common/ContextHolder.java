
package com.springboot.tag.common;

/**
 * 上下文环境<br/>
 */
public class ContextHolder {

    private static final ThreadLocal<Context> contextHolder = new ThreadLocal<Context>();

    public static void setContext(Context context) {
        contextHolder.set(context);
    }

    public static Context getContext() {
        return contextHolder.get();
    }

    public static void clearContext() {
        contextHolder.remove();
    }
}