package com.ascent.dao;

import com.ascent.pojo.User;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface UserMapper {

    User selectUserByUsername(@Param("username") String username, @Param("password") String password);

    int addUser(User user);

    User selectUserByUsername(@Param("username") String username);

    int deleteUser(@Param("username") String username);

    List<User> selectUserList();

    int changeRole(@Param("username") String username, @Param("role") int role);

    int updateUserInfo(@Param("username") String username, @Param("email") String email, @Param("phone") String phone, @Param("company") String company);
}
