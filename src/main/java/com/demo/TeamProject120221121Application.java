package com.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration;

@SpringBootApplication(exclude = SecurityAutoConfiguration.class)
public class TeamProject120221121Application {

	public static void main(String[] args) {
		SpringApplication.run(TeamProject120221121Application.class, args);
	}

}
