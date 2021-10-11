package com.jwnming;

import com.jwnming.entity.Category;
import com.jwnming.entity.User;
import com.jwnming.service.CategoryService;
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
public class CategoryTest {
    @Autowired
    @Qualifier("categoryServiceImpl")
    private CategoryService categoryService;

    @Test
    public void test() {
       /* List<Category> list = categoryService.getAll();
        list.forEach(System.out::println);*/
        categoryService.addCategory(new Category(null, "c", 5423));

        //categoryService.removeCategory(1001);

    }

}
