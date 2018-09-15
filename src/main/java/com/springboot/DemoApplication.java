package com.springboot;

import com.springboot.activemq.producer.Producer;
import org.apache.activemq.command.ActiveMQQueue;
import org.apache.coyote.http11.AbstractHttp11Protocol;
import org.hibernate.SessionFactory;
import org.hibernate.jpa.HibernateEntityManagerFactory;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.context.embedded.tomcat.TomcatConnectorCustomizer;
import org.springframework.boot.context.embedded.tomcat.TomcatEmbeddedServletContainerFactory;
import org.springframework.boot.web.support.SpringBootServletInitializer;
import org.springframework.context.annotation.Bean;
import org.springframework.jms.annotation.EnableJms;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import javax.annotation.Resource;
import javax.jms.Destination;
import javax.jms.Queue;

// 它组合了@Configuration、@EnableAutoConfiguration、@ComponentScan
// 可以使用这三个注解替代@SpringBootApplication注解
@SpringBootApplication
@MapperScan("com.springboot.mapper")
@EnableTransactionManagement
@EnableJms
public class DemoApplication extends SpringBootServletInitializer {

    @Resource
    private Producer producer;

    @Bean
    public Queue queue() {

        Destination activeMQQueue = new ActiveMQQueue("sample.queue");
        producer.sendMessage(activeMQQueue,"1-初始化模拟队列消息输送完成！");
        activeMQQueue = new ActiveMQQueue("sample.queue2");
        producer.sendMessage(activeMQQueue,"2-初始化模拟队列消息输送完成！");
        return (Queue) activeMQQueue;
    }

    /**
     * 注入hibernate的SessionFactory
     * @param hibernateEntityManagerFactory
     * @return
     */
    @Bean
    public SessionFactory sessionFactory(HibernateEntityManagerFactory hibernateEntityManagerFactory){
        return hibernateEntityManagerFactory.getSessionFactory();
    }

    /**
     * 启动方法：
     * 1、如下main方法直接运行
     * 2、进入到项目的根目录后执行 mvn spring-boot:run
     * 3、进入到项目根目录 执行 mvn install 编译项目 然后 cd target 执行dir 再利用 java -jar 项目名.jar启动
     * @param args
     */
    public static void main(String[] args) {
        SpringApplication.run(DemoApplication.class, args);
    }


    // Tomcat large file upload connection reset
    // 设置tomcat的长传文件最大限制为不限制
    // tomcatEmbedded这段代码是为了解决，上传文件大于10M出现连接重置的问题。此异常内容GlobalException也捕获不到
    // 可以将容量限制放在业务中处理,方便异常处理
    @Bean
    public TomcatEmbeddedServletContainerFactory tomcatEmbedded() {
        TomcatEmbeddedServletContainerFactory tomcat = new TomcatEmbeddedServletContainerFactory();
        tomcat.addConnectorCustomizers((TomcatConnectorCustomizer) connector -> {
            if ((connector.getProtocolHandler() instanceof AbstractHttp11Protocol<?>)) {
                //-1 means unlimited
                ((AbstractHttp11Protocol<?>) connector.getProtocolHandler()).setMaxSwallowSize(-1);
            }
        });
        return tomcat;
    }

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(DemoApplication.class);
    }
}
