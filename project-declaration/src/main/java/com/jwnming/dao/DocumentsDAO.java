package com.jwnming.dao;

import com.jwnming.entity.Documents;

import java.util.List;

public interface DocumentsDAO {

    //查询所有
    List<Documents> selectAll();

    //添加
    void insertDocuments(Documents documents);

    //查询
    Documents selectDocuments(Integer id);

    //删除
    void deleteDocuments(Integer id);

}
