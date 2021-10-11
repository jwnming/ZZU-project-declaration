package com.jwnming;

import com.jwnming.entity.Teacher;
import com.jwnming.entity.User;
import com.jwnming.service.TeacherService;
import com.jwnming.service.UserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
public class TeacherTest {
    @Autowired
    @Qualifier("teacherServiceImpl")
    private TeacherService teacherService;

    @Test
    public void test() {
       /* List<Teacher> list = teacherService.getAll();
        list.forEach(System.out::println);

        System.out.println(teacherService.getTeacher(1001));*/
        teacherService.removeTeacher(1003);

    }

}
