package com.ascent.controller;

import com.ascent.pojo.User;
import com.ascent.service.UserService;

import com.ascent.vo.UserVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;


@Controller
public class UserController {

    @Autowired
    private UserService userService;

    /**
     * 登录页面
     * @return
     */
    @RequestMapping("/loginPage")
    public String loginPage() {
        return "login.html";
    }

    /**
     * 登录--提交表单
     * @param user
     * @return
     */
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(User user) {
        if (userService.login(user)) {
            return "background.html";
        } else {
            return "login.html";
        }
    }

    /**
     * 注册页面
     * @return
     */
    @RequestMapping("/registerPage")
    public String registerPage() {
        return "register.html";
    }

    /**
     * 注册--提交表单
     * @param user
     * @return
     */
    @RequestMapping(method = RequestMethod.POST, value = "/register")
    public String register(User user) {
        if (userService.register(user)) {
            return "login.html";
        } else {
            return "register.html";
        }
    }

    @RequestMapping("/logout")
    public String logout() {
        return "login.html";
    }

    /**
     * 后台主页面
     * @return
     */
    @RequestMapping(value = "/background", method = RequestMethod.GET)
    public String background() {
        return "background.html";
    }

    /**
     * 后台系统--用户列表
     * @param model
     * @return
     */
    @RequestMapping(value = "/list/user", method = RequestMethod.GET)
    public String userList(Model model) {
        List<UserVo> userList = userService.userList();
        model.addAttribute("userList", userList);
        return "userList.jsp";
    }

    @RequestMapping(value = "/user/info", method = RequestMethod.POST)
    public String changeUserInfo(User user, Model model) {
        System.out.println(user.getUsername());
        boolean res = userService.changeUserInfo(user);
        model.addAttribute("userInfoSuccess", !res ?"0":"1");
        return "redirect:/list/user";
    }

    @RequestMapping(value = "/user/role", method = RequestMethod.POST)
    public String changeUserRole(String username, String role, Model model) {
        boolean res = userService.changeRole(username, Integer.parseInt(role));
        model.addAttribute("userRoleSuccess", !res ?"0":"1");
        return "redirect:/list/user";
    }

    @RequestMapping(value = "/user/deleted", method = RequestMethod.POST)
    public String deleteUser(Model model, String username) {
        boolean res = userService.deleteUser(username);
        model.addAttribute("userDeleteSuccess", !res ?"0":"1");
        return "redirect:/list/user";
    }

    @RequestMapping(value = "/list/email", method = RequestMethod.GET)
    public String emailPage() {
        return "userList.jsp";
    }
}
