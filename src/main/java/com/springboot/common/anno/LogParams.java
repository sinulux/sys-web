package com.springboot.common.anno;

import java.lang.annotation.*;

@Target({ ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
@Documented
@Inherited
public @interface LogParams {

    public Class value();// class

    public String type();// busi type

    public String desc() default "";// busi desc

    public String method();// method
}
