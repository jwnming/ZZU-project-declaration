package com.jwnming.service;

import com.jwnming.entity.Category;

import java.util.List;

public interface CategoryService {

    //查询所有
    List<Category> getAll();

    //添加
    void addCategory(Category category);

    //删除
    void removeCategory(Integer id);


}
