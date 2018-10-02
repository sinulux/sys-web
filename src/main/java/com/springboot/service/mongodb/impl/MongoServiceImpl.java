package com.springboot.service.mongodb.impl;

import com.springboot.dao.mongo.impl.ContentMongoDaoImpl;
import com.springboot.entity.mongo.ContentMongoEO;
import com.springboot.service.mongodb.IMongoService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Service;

import java.util.List;

@Service(value = "mongoService")
@Slf4j
public class MongoServiceImpl implements IMongoService {
    @Autowired
    private ContentMongoDaoImpl contentMongoDao;

    public MongoServiceImpl() {
        log.info("contentMongoDao init...");
    }

    @Override
    public void save(ContentMongoEO o) {
        contentMongoDao.save(o);
    }

    @Override
    public List<ContentMongoEO> queryList(Query query) {
        return contentMongoDao.queryList(query);
    }

    @Override
    public ContentMongoEO queryById(Long id) {
        return contentMongoDao.queryById(id);
    }

    @Override
    public ContentMongoEO queryOne(Query query) {
        return contentMongoDao.queryOne(query);
    }
}
