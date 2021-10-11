package com.jwnming.service.impl;

import com.jwnming.dao.CategoryDAO;
import com.jwnming.entity.Category;
import com.jwnming.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Service
@Transactional
public class CategoryServiceImpl implements CategoryService {

    @Autowired
    private CategoryDAO categoryDAO;

    @Override
    public List<Category> getAll() {
        return categoryDAO.selectAll();
    }

    @Override
    public void addCategory(Category category) {
        categoryDAO.insertCategory(category);
    }

    @Override
    public void removeCategory(Integer id) {
        categoryDAO.deleteCategory(id);
    }
}
