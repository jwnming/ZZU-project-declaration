package com.jwnming;

import com.jwnming.entity.News;
import com.jwnming.entity.Teacher;
import com.jwnming.service.NewsService;
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
public class NewsTest {
    @Autowired
    @Qualifier("newsServiceImpl")
    private NewsService newsService;

    @Test
    public void test() {
        /*List<News> list = newsService.getAll();
        list.forEach(System.out::println);*/

        //System.out.println(newsService.getNews(1001));

        //newsService.addNews(new News(null, "xx", "xxx", new Date()));

        //newsService.removeNews(1003);



    }

}
