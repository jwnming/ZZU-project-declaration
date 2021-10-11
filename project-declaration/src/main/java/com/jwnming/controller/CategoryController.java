package com.jwnming.controller;

import com.jwnming.entity.Category;
import com.jwnming.entity.User;
import com.jwnming.service.CategoryService;
import com.jwnming.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;


@Controller
@RequestMapping("/category")
public class CategoryController {

    @Autowired
    @Qualifier("categoryServiceImpl")
    private CategoryService categoryService;

    //获取所有
    @RequestMapping("/getAll")
    @ResponseBody
    public List<Category> getAll(Integer page, Integer rows) {
        return categoryService.getAll();
    }

    //添加
    @RequestMapping("/addCategory")
    @ResponseBody
    public Map<String, Object> add(Category category) {
        //System.out.println(category);
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            if(category.getName().equals("")||category.getDistinguish().equals("")){
                map.put("code", 201);
                map.put("msg", "存在不允许的空值");
                return map;
            }
            categoryService.addCategory(category);

            map.put("code", 200);
            map.put("msg", "添加成功");

            return map;
        } catch (Exception e) {
            map.put("code", 201);
            map.put("msg", "修改失败");
            return map;
        }
    }

    //删除
    @RequestMapping("/deleteCategory/{id}")
    public @ResponseBody Object deleteNews(@PathVariable("id") Integer id) {
        categoryService.removeCategory(id);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("code", 200);
        map.put("msg", "删除成功");
        return map;
    }
}
