package com.springboot.mapper;

import com.springboot.entity.UserEO;

public interface UserMapper {
    UserEO getLoginUserByUserId(String userId);
}