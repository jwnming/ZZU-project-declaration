package com.jwnming.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.jwnming.dao.UserDAO;
import com.jwnming.entity.Rotation;
import com.jwnming.entity.User;
import com.jwnming.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Service
@Transactional
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDAO userDAO;


    @Override
    public User getUserByNameAndPassword(String name, String password) {
        return userDAO.selectUserByNameAndPassword(name, password);
    }

    @Override
    public User getUserById(Integer id) {
        return userDAO.selectUserById(id);
    }

    @Override
    public List<User> getByName(String name) {
        return userDAO.selectByName(name);
    }

    //获取所有
    @Override
    public Map<String, Object> getAllUser(Integer pageNum, Integer pageSize) {
        Page<Object> pageObject = PageHelper.startPage(pageNum, pageSize);
        List<User> list = userDAO.selectAllUser();

        Map<String, Object> map = new HashMap<String, Object>();
        map.put("total", pageObject.getTotal());
        map.put("rows", list);
        return map;

    }

    //获取所有在前台展示的用户
    @Override
    public List<User> getUserExhibition() {
        return userDAO.selectUserExhibition();
    }

    @Override
    public boolean addUser(User user) {
        userDAO.insertUser(user);
        return true;
    }

    @Override
    public boolean removeUserById(Integer id) {
        userDAO.deleteUserById(id);
        return true;
    }

    @Override
    public boolean changeUser(User user) {
        userDAO.updateUser(user);
        return true;
    }

    @Override
    public boolean changeUserStatus(Integer status, Integer id) {
        userDAO.updateUserStatus(status, id);
        return true;
    }

    @Override
    public boolean changeUserExhibition(Integer exhibition, Integer id) {
        userDAO.updateUserExhibition(exhibition, id);
        return true;
    }

    @Override
    public void changeUserPassword(String password, Integer id) {
        userDAO.updateUserPassword(password, id);
    }
}
