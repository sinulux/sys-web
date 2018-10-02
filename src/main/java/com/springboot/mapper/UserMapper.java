package com.springboot.mapper;

import com.springboot.entity.mybatis.UserEO;

public interface UserMapper {
    UserEO getLoginUserByUserId(String userId);
}