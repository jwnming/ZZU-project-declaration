package com.jwnming.dao;

import com.jwnming.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserDAO {

    //根据用户名和密码查询
    User selectUserByNameAndPassword(@Param("name") String name, @Param("password") String password);

    //根据id获得
    User selectUserById(Integer id);

    //根据用户名获得
    List<User> selectByName(String name);

    //获得所有
    List<User> selectAllUser();

    //获得所有要在首页展示的页面
    List<User> selectUserExhibition();


    //添加
    void insertUser(User user);

    //删除
    void deleteUserById(Integer id);

    //修改
    void updateUser(User user);

    //修改状态
    void updateUserStatus(@Param("status") Integer status, @Param("id") Integer id);

    //修改首页展示
    void updateUserExhibition(@Param("exhibition") Integer exhibition, @Param("id") Integer id);

    //修改用户密码
    void updateUserPassword(@Param("password") String password, @Param("id") Integer id);
}
