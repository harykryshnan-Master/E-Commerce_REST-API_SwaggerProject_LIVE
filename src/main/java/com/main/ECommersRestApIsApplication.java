// package com.main;

// import org.springframework.boot.SpringApplication;
// import org.springframework.boot.autoconfigure.SpringBootApplication;

// @SpringBootApplication
// public class ECommersRestApIsApplication {

// 	public static void main(String[] args) {
// 		SpringApplication.run(ECommersRestApIsApplication.class, args);
// 	}

// }


package com.main;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication
public class EcommersRestApisApplication extends SpringBootServletInitializer {

    public static void main(String[] args) {
        SpringApplication.run(EcommersRestApisApplication.class, args);
        System.out.println("========= EcommersRestApisApplication started successfully! =========");
    }

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(EcommersRestApisApplication.class);
    }
}


