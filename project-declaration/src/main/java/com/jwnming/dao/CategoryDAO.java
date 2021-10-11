package com.jwnming.dao;

import com.jwnming.entity.Category;

import java.util.List;

public interface CategoryDAO {

    //查询所有
    List<Category> selectAll();

    //添加
    void insertCategory(Category category);

    //删除
    void deleteCategory(Integer id);

}
