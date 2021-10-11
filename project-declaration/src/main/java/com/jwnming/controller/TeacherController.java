package com.jwnming.controller;

import com.jwnming.entity.Teacher;
import com.jwnming.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/teacher")
public class TeacherController {

    @Autowired
    private TeacherService teacherService;

    //获取所有
    @RequestMapping("/getAll")
    @ResponseBody
    public Object getAll(Integer page, Integer rows) {
        if (page == null || rows == null ) {
            page = 1;
            rows = 10;
        }
        Map<String, Object> all = teacherService.getAll(page, rows);
        return all;
    }
    //添加
    @RequestMapping("/addTeacher")
    public @ResponseBody Object addTeacher(Teacher teacher) {
        //System.out.println("添加：" + teacher);

        Map<String, Object> map = new HashMap<String, Object>();
        try {
            if (teacher.getJob().equals("") || teacher.getMobile().equals("") || teacher.getName().equals("")) {
                map.put("code", 201);
                map.put("msg", "存在不允许空值");
                return map;
            }

            teacherService.addTeacher(teacher);
            map.put("code", 200);
            map.put("msg", "添加成功");
            return map;
        } catch (Exception e) {
            map.put("code", 201);
            map.put("msg", "添加失败");
            return map;
        }
    }

    //删除
    @RequestMapping("/deleteTeacher/{id}")
    public @ResponseBody Object deleteTeacher(@PathVariable("id") Integer id) {
        //System.out.println("删除：" + id);
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            teacherService.removeTeacher(id);

            map.put("code", 200);
            map.put("msg", "删除成功");
            return map;
        } catch (Exception e) {
            map.put("code", 201);
            map.put("msg", "删除失败");
            return map;
        }
    }


}