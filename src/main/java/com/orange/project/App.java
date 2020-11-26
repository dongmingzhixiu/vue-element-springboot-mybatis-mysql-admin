package com.orange.project;

import org.mybatis.spring.annotation.MapperScan;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.web.client.RestTemplate;
import sun.misc.Signal;
import sun.misc.SignalHandler;

import java.lang.management.ManagementFactory;


@MapperScan({"com.orange.project.mapper"})
@SpringBootApplication
public class App {
    public static String pid;
    private static final Logger logger = LoggerFactory.getLogger(App.class);

    public static void main(String[] args) {
        // 在Spring Boot应用中通过监听信号量和注册关闭钩子来实现在进程退出之前执行收尾工作
        // 监听信号量
        Signal sg = new Signal("TERM");
        Signal.handle(sg, new SignalHandler() {
            @Override
            public void handle(Signal signal) {
                logger.info("do signal handle: {}", signal.getName());
                System.exit(0);
            }
        });

        // 注册关闭钩子
        Runtime.getRuntime().addShutdownHook(new Thread() {
            @Override
            public void run() {
                // 执行收尾工作
                logger.info("do something on shutdown hook");
            }
        });

        SpringApplication.run(App.class, args);
        logger.info("Start DONE.");
    }

    @Bean
    public RestTemplate getRestTemplate() {
        return new RestTemplate();
    }


    @Bean
    void getPid() {
        //获取pid
//        String dir = System.getProperty("user.dir");
//        SpringApplication application = new SpringApplication(App.class);
//        application.addListeners(new ApplicationPidFileWriter(dir + "/app.pid"));
        pid = ManagementFactory.getRuntimeMXBean().getSystemProperties().get("PID");
    }
}
