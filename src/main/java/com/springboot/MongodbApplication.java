//package com.springboot;
//
//import com.springboot.dao.jpa.impl.CustomerRepository;
//import com.springboot.entity.mongo.ContentMongoEO;
//import com.springboot.entity.mongo.CustomerEO;
//import com.springboot.service.mongodb.impl.MongoServiceImpl;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.boot.CommandLineRunner;
//import org.springframework.boot.SpringApplication;
//import org.springframework.boot.autoconfigure.SpringBootApplication;
//import org.springframework.data.mongodb.core.query.Criteria;
//import org.springframework.data.mongodb.core.query.Query;
//
//import java.util.Date;
//import java.util.List;
//import java.util.regex.Pattern;
//
//@SpringBootApplication
//public class MongodbApplication implements CommandLineRunner {
//
//
//    @Autowired
//    private CustomerRepository repository;
//    @Autowired
//    private MongoServiceImpl mongoService;
//
//    public static void main(String[] args) {
//        SpringApplication.run(MongodbApplication.class, args);
//    }
//
//
//    @Override
//    public void run(String... args) throws Exception {
//        repository.deleteAll();
//
//        // save a couple of customers
//        repository.save(new CustomerEO("Alice", "Smith"));
//        repository.save(new CustomerEO("Bob", "Smith"));
//
//        // fetch all customers
//        System.out.println("Customers found with findAll():");
//        System.out.println("-------------------------------");
//        for (CustomerEO customer : repository.findAll()) {
//            System.out.println(customer);
//        }
//        System.out.println();
//
//        // fetch an individual customer
//        System.out.println("CustomerEO found with findByFirstName('Alice'):");
//        System.out.println("--------------------------------");
//        System.out.println(repository.findByFirstName("Alice"));
//
//        System.out.println("Customers found with findByLastName('Smith'):");
//        System.out.println("--------------------------------");
//        for (CustomerEO customer : repository.findByLastName("Smith")) {
//            System.out.println(customer);
//        }
//        // INSERT
//        ContentMongoEO eo = new ContentMongoEO();
//        eo.setId(new Date().getTime());
//        eo.setContent("测试数据132456");
//        eo.setType("test");
//        mongoService.save(eo);
//
//        // QUERY BY ID
//        ContentMongoEO eo1 = mongoService.queryById(1535529325847L);
//        System.out.println(eo1);
//
//        // QUERY LIST BY NAME
//        Pattern pattern = Pattern.compile("^.*" + "测试数据132456" + ".*$", Pattern.CASE_INSENSITIVE);
//        Query contentQuery = new Query(Criteria.where("content").is(pattern));
//        contentQuery.addCriteria(Criteria.where("_id").is(1535529325847L));
//        List<ContentMongoEO> list = mongoService.queryList(contentQuery);
//        System.out.println(list);
//
//        Criteria criteria = new Criteria();
//        criteria.and("id").is(1535529325847L);
//        List<ContentMongoEO> contentMongoEOS = mongoService.queryList(new Query(criteria));
//        System.out.println(contentMongoEOS);
//
//        ContentMongoEO eo2 = mongoService.queryOne(Query.query(criteria));
//        System.out.println(eo2);
//    }
//}
