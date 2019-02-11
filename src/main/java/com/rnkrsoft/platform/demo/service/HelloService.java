package com.rnkrsoft.platform.demo.service;

import javax.web.doc.annotation.ApidocInterface;
import javax.web.doc.annotation.ApidocService;

/**
 * Created by rnkrsoft.com on 2018/10/6.
 */
@ApidocService(value = "Hello服务", channel = "test-channel", name = "010")
public interface HelloService {

    @ApidocInterface("Hello")
    HelloResponse hello(HelloRequest request);
}
