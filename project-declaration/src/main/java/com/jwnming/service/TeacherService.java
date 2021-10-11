package com.jwnming.service;

import com.jwnming.entity.Teacher;

import java.util.List;
import java.util.Map;

public interface TeacherService {

    //查询所有
    Map<String, Object> getAll(Integer pageNum, Integer pageSize);

    //单个查询
    Teacher getTeacher(Integer id);

    void addTeacher(Teacher teacher);

    void removeTeacher(Integer id);
}
