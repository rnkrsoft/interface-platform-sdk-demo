package com.rnkrsoft.platform.demo.service;

/**
 * Created by rnkrsoft.com on 2018/10/7.
 */
public class HelloServiceImpl implements HelloService {
    @Override
    public HelloResponse hello(HelloRequest request) {
        HelloResponse response = new HelloResponse();
        response.setText("hello, "+ request.getName());
        return response;
    }
}
