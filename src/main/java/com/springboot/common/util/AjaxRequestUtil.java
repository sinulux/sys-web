package com.springboot.common.util;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;

import com.alibaba.fastjson.JSON;

/**
 * ajax请求判断 <br/>
 *
 * @date 2016年6月22日 <br/>
 * @author wangshibao <br/>
 * @version v1.0 <br/>
 */
public class AjaxRequestUtil {

    /**
     * 判断是否ajax请求
     *
     * @author wangshibao
     * @param request
     * @return
     */
    public static boolean isAjax(ServletRequest request) {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        String requestType = httpRequest.getHeader("X-Requested-With");
        return !StringUtils.isEmpty(requestType) && "XMLHttpRequest".equals(requestType);
    }

    /**
     * 输出内容
     *
     * @author wangshibao
     * @param response
     * @param object
     */
    public static boolean printAjax(ServletResponse response, Object object) {
        PrintWriter out = null;
        try {
            HttpServletResponse httpResponse = (HttpServletResponse) response;
            httpResponse.setHeader("Content-type", "application/json;charset=UTF-8");
            httpResponse.setCharacterEncoding("UTF-8");
            out = httpResponse.getWriter();
            out.write(JSON.toJSONString(object));
            return false;
        } catch (IOException e) {
            return false;
        } finally {
            if (out != null) {
                out.close();
            }
        }
    }

    /**
     * 输出内容
     *
     * @author wangshibao
     * @param response
     * @param string
     */
    public static boolean printString(ServletResponse response, String string) {
        PrintWriter out = null;
        try {
            HttpServletResponse httpResponse = (HttpServletResponse) response;
            httpResponse.setHeader("Content-type", "text/html;charset=UTF-8");
            httpResponse.setCharacterEncoding("UTF-8");
            out = httpResponse.getWriter();
            out.write(string);
            return false;
        } catch (IOException e) {
            return false;
        } finally {
            if (out != null) {
                out.close();
            }
        }
    }
}
