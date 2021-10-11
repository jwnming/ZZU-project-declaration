package com.jwnming.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.jwnming.dao.DocumentsDAO;
import com.jwnming.entity.Documents;
import com.jwnming.service.CategoryService;
import com.jwnming.service.DocumentsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Service
@Transactional
public class DocumentsServiceImpl implements DocumentsService {

    @Autowired
    private DocumentsDAO documentsDAO;

    @Override
    public Map<String, Object> getAll(Integer pageNum, Integer pageSize){
        Page<Object> pageObject = PageHelper.startPage(pageNum, pageSize);
        List<Documents> list = documentsDAO.selectAll();
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("total", pageObject.getTotal());
        map.put("rows", list);
        return map;
    }

    @Override
    public void addDocuments(Documents documents) {
        documentsDAO.insertDocuments(documents);
    }

    @Override
    public Documents getDocuments(Integer id) {
        return documentsDAO.selectDocuments(id);
    }

    @Override
    public void removeDocuments(Integer id) {
        documentsDAO.deleteDocuments(id);
    }
}
