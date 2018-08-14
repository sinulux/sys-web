package com.springboot.service.system;

import com.springboot.common.busi.ResponseData;

public interface IUserService {
    ResponseData selectByUserAccount(String userAccount);
}
