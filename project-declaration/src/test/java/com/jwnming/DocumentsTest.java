package com.jwnming;

import com.jwnming.entity.Documents;
import com.jwnming.entity.Teacher;
import com.jwnming.service.DocumentsService;
import com.jwnming.service.TeacherService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
public class DocumentsTest {
    @Autowired
    @Qualifier("documentsServiceImpl")
    private DocumentsService documentsService;

    @Test
    public void test() {
        /*ist<Documents> list = documentsService.getAll();
        list.forEach(System.out::println);*/
        Documents documents = new Documents(null, "x", "x/x", 1001, 1002);
        documentsService.addDocuments(documents);
        System.out.println(documents);






    }

}
