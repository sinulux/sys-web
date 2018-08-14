package com.springboot.service.common;

import com.springboot.common.busi.ResponseData;

public interface ILoginService {

    public ResponseData login(String userAccount, String userPassword);
}
