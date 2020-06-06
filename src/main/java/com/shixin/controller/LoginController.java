package com.shixin.controller;

import com.alibaba.druid.util.StringUtils;
import com.shixin.entity.Result;
import com.shixin.entity.User;
import com.shixin.exception.SysException;
import com.shixin.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * @author 今何许
 * @date 2020/5/20 11:36
 */
@Controller
@RequestMapping("/user")
public class LoginController {
    @Autowired
    UserService userService;

    @RequestMapping("/index")
    public String index() {
        return "admin/index";
    }

    @RequestMapping("/login")
    public String login() {
        return "admin/login";
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login";
    }

    @RequestMapping("/register")
    public String register() {
        return "admin/register";
    }

    @RequestMapping("/login.json")
    @ResponseBody
    public Result login(HttpServletRequest request) throws SysException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        if (StringUtils.isEmpty(username) || StringUtils.isEmpty(password)) {
            throw new SysException("用户名或密码不能为空");
        }
        User user = userService.checkUser(username, password);
        if (user == null) {
            throw new SysException("用户名或密码不正确");
        }
        request.getSession().setAttribute("user", user);
        return Result.success();
    }

    @RequestMapping("/register.json")
    @ResponseBody
    public Result register(HttpServletRequest request) throws SysException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String pwd = request.getParameter("pwd");
        if (StringUtils.isEmpty(username) || StringUtils.isEmpty(password) || StringUtils.isEmpty(pwd)) {
            throw new SysException("用户名或密码不能为空");
        }
        User user = userService.isExist(username);
        if (user != null) {
            throw new SysException("用户已经存在");
        }
        userService.addUser(username, password);
        return Result.success();
    }
}
