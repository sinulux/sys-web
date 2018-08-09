package com.springboot.controller;

import com.springboot.common.util.CodeUtil;
import com.springboot.common.util.GraphicHelper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.RenderedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/login")
public class LoginController {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @RequestMapping("/loginIn")
    public String toLogin(){
        logger.info("跳转登陆页面...");
        return "/pages/login";
    }

    @RequestMapping("/getCode")
    public void getValidCode(HttpServletRequest req, HttpServletResponse resp){
        // 调用工具类生成的验证码和验证码图片
        Map<String, Object> codeMap = CodeUtil.generateCodeAndPic();

        // 将四位数字的验证码保存到Session中。
        HttpSession session = req.getSession();
        session.setAttribute("code", codeMap.get("code").toString());

        // 禁止图像缓存。
        resp.setHeader("Pragma", "no-cache");
        resp.setHeader("Cache-Control", "no-cache");
        resp.setDateHeader("Expires", -1);

        resp.setContentType("image/jpeg");

        // 将图像输出到Servlet输出流中。
        ServletOutputStream sos;
        try {
            sos = resp.getOutputStream();
            ImageIO.write((RenderedImage) codeMap.get("codePic"), "jpeg", sos);
            sos.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    @RequestMapping("/getGhCode")
    public void getGhCode(HttpServletRequest request, HttpServletResponse response){
        // 获得 当前请求 对应的 会话对象
        HttpSession session = request.getSession();

        // 从请求中获得 URI ( 统一资源标识符 )
        String uri = request.getRequestURI();
        System.out.println("hello : " + uri);

        final int width = 120; // 图片宽度
        final int height = 36; // 图片高度
        final String imgType = "jpeg"; // 指定图片格式 (不是指MIME类型)
        OutputStream output = null; // 获得可以向客户端返回图片的输出流
        try {
            output = response.getOutputStream();
        } catch (IOException e) {
            e.printStackTrace();
        }
        // (字节流)
        // 创建验证码图片并返回图片上的字符串
        String code = GraphicHelper.create(width, height, imgType, output);
        System.out.println("验证码内容: " + code);

        // 建立 uri 和 相应的 验证码 的关联 ( 存储到当前会话对象的属性中 )
        session.setAttribute(uri, code);
    }

    @RequestMapping(value="/userLogin",method = RequestMethod.POST)
    @ResponseBody
    public Object userLogin(String username,String password,String validCode){
        logger.info(username + " " + password + " " + validCode);
        Map<String,Object> rtMap = new HashMap();
        rtMap.put("status","success");
        rtMap.put("desc","登陆成功");
        return rtMap;
    }
}
