package com.jwnming.dao;

import com.jwnming.entity.Teacher;

import java.util.List;

public interface TeacherDAO {

    //查询所有
    List<Teacher> selectAll();

    //单个查询
    Teacher selectTeacher(Integer id);

    void insertTeacher(Teacher teacher);

    void deleteTeacher(Integer id);
}
