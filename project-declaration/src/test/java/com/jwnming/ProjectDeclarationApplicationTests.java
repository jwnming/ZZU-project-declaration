package com.jwnming;

import com.jwnming.entity.Rotation;
import com.jwnming.service.NewsService;
import com.jwnming.service.RotationService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;
import java.util.Map;

@RunWith(SpringRunner.class)
@SpringBootTest
public class ProjectDeclarationApplicationTests {

    @Autowired
    private RotationService rotationService;
    @Autowired
    private NewsService newsService;

    @Test
    public void contextLoads() {

        /*Map<String, Object> map = rotationService.getAllRotationExhibition(1, 6);
        ((List<Rotation>)map.get("rows")).forEach(System.out::println);*/
        newsService.getAllNewsExhibition().forEach(System.out::println);
    }

}
