package com.ascent.service;

import com.ascent.pojo.User;
import com.ascent.vo.UserVo;

import java.util.List;

public interface UserService {

    boolean login(User user);

    boolean register(User user);

    boolean deleteUser(String username);

    List<UserVo> userList();

    boolean changeRole(String username, int role);

    boolean changeUserInfo(User user);
}
