package com.springboot.dao.jpa.impl;

import com.springboot.dao.jpa.ICustomerRepository;
import com.springboot.entity.mongo.CustomerEO;
import org.springframework.data.mongodb.repository.MongoRepository;

import java.util.List;

/**
 * 写一个接口，继承MongoRepository，这个接口有了基本的CURD的功能。
 * 如果你想自定义一些查询，比如根据firstName来查询，获取根据lastName来查询，
 * 只需要定义一个方法即可。注意firstName严格按照存入的mongodb的字段对应。
 * 在典型的java的应用程序，写这样一个接口的方法，需要自己实现，
 * 但是在springboot中，你只需要按照格式写一个接口名和对应的参数就可以了，因为springboot已经帮你实现了。
 */
public interface CustomerRepository extends MongoRepository<CustomerEO, String>,ICustomerRepository {

    public CustomerEO findByFirstName(String firstName);

    public List<CustomerEO> findByLastName(String lastName);

}