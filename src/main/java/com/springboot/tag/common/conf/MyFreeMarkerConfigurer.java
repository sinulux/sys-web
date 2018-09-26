package com.springboot.tag.common.conf;

import com.springboot.common.busi.BaseRunTimeException;
import com.springboot.common.busi.SpringContextHolder;
import com.springboot.tag.common.db.JdbcUtil;
import freemarker.template.TemplateException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

@Slf4j
public class MyFreeMarkerConfigurer extends FreeMarkerConfigurer {

    @Override
    public void afterPropertiesSet() throws IOException, TemplateException {
        JdbcUtil util = null;
        String url = "jdbc:mysql://localhost:3306/zhpt?useUnicode=true&characterEncoding=UTF-8&useSSL=false";
        try {
            util = new JdbcUtil(url, "root", "root");
        } catch (Exception e) {
            e.printStackTrace();
        }
        List<Map<String, Object>> eos = util.getJdbcTemplate().queryForList(
                "select id as labelId,label_name as labelName from sys_label");
        if (eos == null || eos.size() == 0) {
            throw new BaseRunTimeException("注入标签失败，无法获取标签数据！");
        }
        Map model = new HashMap();
        for (Map<String, Object> eo : eos) {
            log.info("注入自定义标签：" + eo.get("labelName"));
            model.put(eo.get("labelName").toString(), SpringContextHolder.getBean("labelService"));
        }
        model.put("xml_escape", SpringContextHolder.getBean("fmXmlEscape"));  // xml解析
        model.put("mine_test", SpringContextHolder.getBean("labelDirective"));// 测试
        super.setFreemarkerVariables(model);
        super.setTemplateLoaderPath("/WEB-INF/freemarker/");
        Properties properties = new Properties();
        properties.load(new FileInputStream(System.getProperty("user.dir")+"/src/main/resources/freemarkerSettings.properties"));
        super.setFreemarkerSettings(properties);
        super.afterPropertiesSet();
    }

    public static void main(String[] args) throws IOException {
        Properties properties = new Properties();
        properties.load(new FileInputStream(System.getProperty("user.dir")+"/src/main/resources/freemarkerSettings.properties"));
        System.out.println(properties);
    }

}
