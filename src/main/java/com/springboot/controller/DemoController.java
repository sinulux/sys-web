package com.springboot.controller;

import com.springboot.service.DemoService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/test")
public class DemoController {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private DemoService demoService;

    @RequestMapping("/test")
    public String testMethod() {
        logger.debug("测试一下");
        List<Map<String, Object>> test = demoService.test();
        List<Map<String, Object>> map = demoService.test("1");
        logger.debug("当前日志：" + map.toString());
        return test.toString();
    }

    @RequestMapping(value = "/greeting")
    public ModelAndView test(ModelAndView mv) {
        mv.setViewName("/greeting");
        mv.addObject("title", "欢迎使用Thymeleaf!");
        List<Map<String, Object>> map = demoService.test("1");
        logger.debug("当前日志：" + map.toString());
        return mv;
    }

    /**
     * 上传文件跳转
     * @return
     */
    @GetMapping("/fileUpload")
    public ModelAndView index(ModelAndView mv) {
        mv.setViewName("/fileUpload");
        return mv;
    }

    /**
     * 文件上传
     * @param file
     * @param mv
     * @return
     */
    @PostMapping("/upload")
    public ModelAndView singleFileUpload(@RequestParam("file") MultipartFile file, ModelAndView mv) {
        logger.info("开始文件上传");
        if (file.isEmpty()) {
            logger.info("没有选择文件");
            mv.addObject("message", "Please select a file to upload");
            mv.setViewName("/uploadResult");
            return mv;
        }

        try {
            // Get the file and save it somewhere
            byte[] bytes = file.getBytes();
            Path path = Paths.get("D:\\workspace\\idea\\springboot-demo\\src\\main\\resources\\files\\upload",file.getOriginalFilename());
            Files.write(path, bytes);

            mv.addObject("message", "You successfully uploaded '" + file.getOriginalFilename() + "'");
            logger.info("文件上传成功");
        } catch (IOException e) {
            e.printStackTrace();
        }

        mv.setViewName("/uploadResult");
        return mv;
    }
}
