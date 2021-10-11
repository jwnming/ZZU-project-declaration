package com.jwnming.dao;

import com.jwnming.entity.News;

import java.util.List;

public interface NewsDAO {

    //查询所有
    List<News> selectAll();

    //查询
    List<News> selectAllNewsExhibition();


    //查询单个
    News selectNews(Integer id);

    //添加
    void insertNews(News news);

    //删除
    void deleteNews(Integer id);

    //修改
    void updateNews(News news);

}
