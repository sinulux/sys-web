package com.springboot;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.security.ProtectionDomain;

@RunWith(SpringRunner.class)
@SpringBootTest
public class DemoApplication {

    @Test
    public void contextLoads() {
        ProtectionDomain protectionDomain = Test.class.getProtectionDomain();
        System.out.println(protectionDomain);
    }

}
