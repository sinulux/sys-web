package com.springboot.entity.mongo;

import org.springframework.data.mongodb.core.index.Indexed;

/**
 * 存储内容 <br/>
 */
public class ContentMongoEO {

    // 建立索引，提高查询效率
    @Indexed
    private Long id;// 业务实体对象id
    private String content;// 内容
    private String type;//业务类型

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
}