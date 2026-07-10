package com.example.demo;

import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import ch.qos.logback.classic.Logger;

@RestController
public class HelloController {
    Logger log = (Logger) LoggerFactory.getLogger(HelloController.class);

    @GetMapping("/health")
    public String health() {
        return "UP";
    }

    @GetMapping("/hello")
    public String hello() {
        log.info("Received request for /hello endpoint");
        return "Hello";
    }

    @GetMapping("/greet")
    public String greet() {
        log.info("Received request for /greet endpoint");
        return "Greetings!";
    }
}
