
package com.springboot.dao.impl;

import com.springboot.dao.MongoDbBaseDao;
import com.springboot.entity.ContentMongoEO;
import org.springframework.stereotype.Repository;

@Repository(value="contentMongoDao")
public class ContentMongoDaoImpl extends MongoDbBaseDao<ContentMongoEO> {

    @Override
    protected Class<ContentMongoEO> getEntityClass() {
        return ContentMongoEO.class;
    }
}