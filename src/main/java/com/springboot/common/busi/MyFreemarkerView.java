package com.springboot.common.busi;

import org.springframework.web.servlet.view.freemarker.FreeMarkerView;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

public class MyFreemarkerView extends FreeMarkerView {

    @Override
    protected void exposeHelpers(Map<String, Object> model, HttpServletRequest request) throws Exception {
        model.put("ctx", getBasePath(request));
        model.put("ajaxUrl", request.getRequestURI());
        model.put("fullPath", getBasePath(request)+request.getRequestURI());
        super.exposeHelpers(model, request);
    }

    /**
     * 得到请求的根目录
     * @param request
     * @return basePath
     */
    public static String getBasePath(HttpServletRequest request) {
        String path = request.getContextPath();
        String basePath = request.getScheme() + "://" + request.getServerName()+ ":" + request.getServerPort() + path;
        return basePath;
    }
}