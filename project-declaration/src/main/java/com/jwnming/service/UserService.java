package com.jwnming.service;

import com.jwnming.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface UserService {

    //根据用户名和密码查询
    User getUserByNameAndPassword(String name, String password);

    //根据id获得
    User getUserById(Integer id);

    //根据用户名获得
    List<User> getByName(String name);

    //获得所有
    Map<String, Object> getAllUser(Integer pageNum, Integer pageSize);

    //获得所有要在前台展示的用户
    List<User> getUserExhibition();



    //添加
    boolean addUser(User user);

    //删除
    boolean removeUserById(Integer id);

    //修改
    boolean changeUser(User user);

    //修改状态
    boolean changeUserStatus(Integer status, Integer id);

    //修改状态
    boolean changeUserExhibition(Integer exhibition, Integer id);

    //修改用户密码
    void changeUserPassword(String password, Integer id);

}
