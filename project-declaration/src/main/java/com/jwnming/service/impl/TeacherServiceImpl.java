package com.jwnming.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.jwnming.dao.TeacherDAO;
import com.jwnming.entity.Teacher;
import com.jwnming.service.CategoryService;
import com.jwnming.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Service
@Transactional
public class TeacherServiceImpl implements TeacherService {

    @Autowired
    private TeacherDAO teacherDAO;


    @Override
    public Map<String, Object> getAll(Integer pageNum, Integer pageSize) {
        Page<Object> pageObject = PageHelper.startPage(pageNum, pageSize);
        List<Teacher> list = teacherDAO.selectAll();

        Map<String, Object> map = new HashMap<String, Object>();
        map.put("total", pageObject.getTotal());
        map.put("rows", list);
        return map;
    }

    @Override
    public Teacher getTeacher(Integer id) {
        return teacherDAO.selectTeacher(id);
    }

    @Override
    public void addTeacher(Teacher teacher) {
        teacherDAO.insertTeacher(teacher);
    }

    @Override
    public void removeTeacher(Integer id) {
        teacherDAO.deleteTeacher(id);
    }


}
