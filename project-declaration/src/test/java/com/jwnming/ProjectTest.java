package com.jwnming;

import com.jwnming.entity.Project;
import com.jwnming.entity.Teacher;
import com.jwnming.service.ProjectService;
import com.jwnming.service.TeacherService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.Date;
import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
public class ProjectTest {
    @Autowired
    @Qualifier("projectServiceImpl")
    private ProjectService projectService;

    @Test
    public void test() {
        boolean b = projectService.addProject(new Project(null, "xxx", new Date(), 4.3, "xx", null, null, null, null, null, null, null, null, null));
        System.out.println(b);
        /*List<Project> list = projectService.getAllExhibition();
        list.forEach(System.out::println);*/

    }

}
