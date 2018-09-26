package com.springboot.tag.generate;

import com.alibaba.fastjson.JSONObject;
import com.springboot.tag.common.AbstractLabelService;
import org.springframework.stereotype.Component;

@Component
public class DemoBeanService extends AbstractLabelService {

    @Override
    public Object getObject(JSONObject paramObj){
        String clazzName = paramObj.getString("param");
        return clazzName;
    }
}
