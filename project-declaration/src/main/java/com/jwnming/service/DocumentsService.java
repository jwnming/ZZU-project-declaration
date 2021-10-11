package com.jwnming.service;

import com.jwnming.entity.Documents;

import java.util.List;
import java.util.Map;

public interface DocumentsService {

    //查询所有
    Map<String, Object> getAll(Integer pageNum, Integer pageSize);

    //添加
    void addDocuments(Documents documents);

    //查询
    Documents getDocuments(Integer id);

    //删除
    void removeDocuments(Integer id);

}
