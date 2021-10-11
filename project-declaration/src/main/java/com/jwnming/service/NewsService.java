package com.jwnming.service;

import com.jwnming.entity.News;

import java.util.List;
import java.util.Map;

public interface NewsService {

    //查询所有
    Map<String, Object> getAll(Integer pageNum, Integer pageSize);

    //查询所有前台展示
    List<News> getAllNewsExhibition();

    //查询单个
    News getNews(Integer id);

    //添加
    void addNews(News news);

    //删除
    void removeNews(Integer id);

    //修改
    void changeNews(News news);


}
