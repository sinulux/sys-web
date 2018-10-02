package com.springboot.service.mongodb;

import com.springboot.entity.mongo.ContentMongoEO;
import org.springframework.data.mongodb.core.query.Query;

import java.util.List;

public interface IMongoService {

    public void save(ContentMongoEO o);

    public List<ContentMongoEO> queryList(Query query);

    public ContentMongoEO queryById(Long id);

    public ContentMongoEO queryOne(Query query);
}
