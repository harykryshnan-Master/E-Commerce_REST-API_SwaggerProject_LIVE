// package com.main;

// import org.springframework.boot.SpringApplication;
// import org.springframework.boot.autoconfigure.SpringBootApplication;

// @SpringBootApplication
// public class ECommersRestApIsApplication {

// 	public static void main(String[] args) {
// 		SpringApplication.run(ECommersRestApIsApplication.class, args);
// 	}

// }


import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication
public class ECommersRestApisApplication extends SpringBootServletInitializer {

    public static void main(String[] args) {
        SpringApplication.run(ECommersRestApisApplication.class, args);
    }

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(ECommersRestApisApplication.class);
    }
}
