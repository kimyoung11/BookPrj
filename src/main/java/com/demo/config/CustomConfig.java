package com.demo.config;

import javax.annotation.PostConstruct;
import javax.servlet.ServletContext;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;

@Configuration
@MapperScan("com.demo.mapper")
public class CustomConfig {

	@Value("${aws.accessKeyId}")
	private String accessKeyId;
	
	@Value("${aws.secretAccessKey}")
	private String secretAccessKey;
	
	
	@Value("${aws.s3.file.url.prefix}")
	private String imgUrl;
	
	@Autowired
	private ServletContext servletContext;
	
	@PostConstruct
	public void init() {
		servletContext.setAttribute("imgUrl", imgUrl);
	}
}

