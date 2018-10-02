
package com.springboot.dao.mongo.impl;

import com.springboot.dao.mongo.MongoDbBaseDao;
import com.springboot.entity.mongo.ContentMongoEO;
import org.springframework.stereotype.Repository;

@Repository(value="contentMongoDao")
public class ContentMongoDaoImpl extends MongoDbBaseDao<ContentMongoEO> {

    @Override
    protected Class<ContentMongoEO> getEntityClass() {
        return ContentMongoEO.class;
    }
}