package com.jwnming;

import com.alibaba.fastjson.serializer.SerializerFeature;
import com.alibaba.fastjson.support.config.FastJsonConfig;
import com.alibaba.fastjson.support.spring.FastJsonHttpMessageConverter;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.web.HttpMessageConverters;
import org.springframework.context.annotation.Bean;
import org.springframework.http.converter.HttpMessageConverter;

@SpringBootApplication
@MapperScan("com.jwnming.dao")          //扫描dao
public class ProjectDeclarationApplication {

    public static void main(String[] args) {
        SpringApplication.run(ProjectDeclarationApplication.class, args);
    }

    //阿里巴巴-fastjson配置文件
    @Bean
    public HttpMessageConverters fastJsonHttpMessageConverters() {
        // 1需要定义一个converter转换消息的对象
        FastJsonHttpMessageConverter
                fasHttpMessageConverter = new FastJsonHttpMessageConverter();
        // 2添加fastjson的配置信息，比如:是否需要格式化返回的json的数据
        FastJsonConfig fastJsonConfig = new FastJsonConfig();
        fastJsonConfig.setSerializerFeatures(SerializerFeature.PrettyFormat);
        // 3在converter中添加配置信息
        fasHttpMessageConverter.setFastJsonConfig(fastJsonConfig);
        HttpMessageConverter<?> converter = fasHttpMessageConverter;
        return new HttpMessageConverters(converter);
    }
}
