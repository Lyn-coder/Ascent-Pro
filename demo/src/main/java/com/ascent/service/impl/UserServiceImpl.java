package com.ascent.service.impl;

import com.ascent.dao.UserMapper;
import com.ascent.pojo.User;
import com.ascent.service.UserService;
import com.ascent.utils.MybatisUtils;
import com.ascent.vo.UserVo;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.ArrayList;
import java.util.List;

/**
 * @ClassName UserServiceImpl
 * @Author Levin
 * @Date 2022/11/8 15:10
 * @Version 1.0
 **/
@Service
public class UserServiceImpl implements UserService {

    @Override
    public boolean login(User user) {
        if (StringUtils.isEmpty(user.getUsername()) ||
                StringUtils.isEmpty(user.getPassword())) {
            return false;
        }
        SqlSession session = MybatisUtils.getSession();
        UserMapper userMapper = session.getMapper(UserMapper.class);
        try {
            User resUser = userMapper.selectUserByUsername(user.getUsername(), user.getPassword());
            session.commit();
            return resUser != null;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return false;
    }

    /**
     * 用户注册
     * @param user
     * @return
     */
    @Override
    public boolean register(User user) {
        if (StringUtils.isEmpty(user.getUsername()) ||
                StringUtils.isEmpty(user.getPassword())) {
            return false;
        }
        SqlSession session = MybatisUtils.getSession();
        UserMapper userMapper = session.getMapper(UserMapper.class);
        int res = 0;
        try {
            res = userMapper.addUser(user);
            session.commit();
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            session.close();
        }
        return res!=0;
    }

    /**
     * 用户列表查询
     * @return
     */
    @Override
    public List<UserVo> userList() {
        SqlSession session = MybatisUtils.getSession();
        UserMapper userMapper = session.getMapper(UserMapper.class);
        List<User> userList = new ArrayList<>();
        List<UserVo> userVoList = new ArrayList<>();
        try {
            userList = userMapper.selectUserList();
            userList.forEach((user) -> {
                UserVo userVo = new UserVo();
                BeanUtils.copyProperties(user, userVo);
                switch (user.getRole()) {
                    case 1:
                        userVo.setRole("高权用户");
                        break;
                    case 2:
                        userVo.setRole("管理员");
                        break;
                    default:
                        userVo.setRole("普通用户");
                        break;
                }
                userVoList.add(userVo);
            });
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            session.close();
        }
        return userVoList;
    }

    /**
     * 修改角色权限
     * @param username
     * @param role
     * @return
     */
    @Override
    public boolean changeRole(String username, int role) {
        SqlSession session = MybatisUtils.getSession();
        UserMapper userMapper = session.getMapper(UserMapper.class);
        int res = 0;
        try {
            res = userMapper.changeRole(username, role);
            session.commit();
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            session.close();
        }
        return res != 0;
    }

    /**
     * 修改用户信息
     * @param user
     * @return
     */
    @Override
    public boolean changeUserInfo(User user) {
        if (user == null) {
            return false;
        }
        SqlSession session = MybatisUtils.getSession();
        UserMapper userMapper = session.getMapper(UserMapper.class);
        int res = 0;
        try {
            String username = user.getUsername();
            String email = user.getEmail();
            String phone = user.getPhone();
            String company = user.getCompany();
            System.out.println(email);
            res = userMapper.updateUserInfo(username, email, phone, company);
            System.out.println(res);
            session.commit();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return res != 0;
    }

    /**
     * 删除用户
     * @param username
     * @return
     */
    @Override
    public boolean deleteUser(String username) {
        if (StringUtils.isEmpty(username)) {
            return false;
        }
        SqlSession session = MybatisUtils.getSession();
        UserMapper userMapper = session.getMapper(UserMapper.class);
        int res = 0;
        try {
            res = userMapper.deleteUser(username);
            session.commit();
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            session.close();
        }
        return res != 0;
    }

}
