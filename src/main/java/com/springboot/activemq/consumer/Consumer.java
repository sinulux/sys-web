package com.springboot.activemq.consumer;

import org.springframework.jms.annotation.JmsListener;
import org.springframework.stereotype.Component;

@Component
public class Consumer {
    // 使用JmsListener配置消费者监听的队列，其中text是接收到的消息
    @JmsListener(destination = "sample.queue")
    //@SendTo("out.queue") // 将返回值再发送到out.queue中
    public void receiveQueue(String text) {
        System.out.println("Consumer-1收到的报文为:" + text);
    }

    @JmsListener(destination = "sample.queue2")
    // @SendTo("out.queue") // 将返回值再发送到out.queue中
    public void receiveQueue2(String text) {
        System.out.println("Consumer-2收到的报文为:" + text);
    }
}