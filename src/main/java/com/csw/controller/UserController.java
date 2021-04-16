package com.csw.controller;

import com.csw.entity.User;
import com.csw.service.UserService;
import com.csw.util.ImageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.IOException;

/**
 * Created by HIAPAD on 2019/10/29.
 */
@Controller
@RequestMapping("user")
public class UserController {


    @Autowired
    private UserService userService;


    //处理登录
    @RequestMapping("login")
    public String login(String code, User user, HttpServletRequest request) {
        try {
            //获取session中验证码
            String sessionCode = (String) request.getSession().getAttribute("code");
            //比较验证码 忽略大小写比较
            if (sessionCode.equalsIgnoreCase(code)) {
                //进行登录
                User userDB = userService.login(user);
                //登录成功保存用户
                request.getSession().setAttribute("user", userDB);
                return "redirect:/back/main/main.jsp";
            } else {
                throw new RuntimeException("验证码错误!!!");
            }
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/back/login.jsp";
        }
    }

    //验证码
    @RequestMapping("getImageCode")
    public void imageCode(HttpServletRequest request, HttpServletResponse response) throws IOException {
        //获取验证码字符串
        char[] randomChar = ImageUtil.getRandomChar();
        //放入session中
        request.getSession().setAttribute("code", new String(randomChar));
        //根据随机字符串获取验证码
        BufferedImage image = ImageUtil.getImage(randomChar);
        //输出验证码
        ImageIO.write(image, "png", response.getOutputStream());
    }
}
