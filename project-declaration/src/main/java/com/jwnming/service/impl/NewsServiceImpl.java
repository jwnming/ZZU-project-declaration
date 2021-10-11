package com.jwnming.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.jwnming.dao.NewsDAO;
import com.jwnming.entity.News;
import com.jwnming.service.CategoryService;
import com.jwnming.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Service
@Transactional
public class NewsServiceImpl implements NewsService {

    @Autowired
    private NewsDAO newsDAO;

    @Override
    public Map<String, Object> getAll(Integer pageNum, Integer pageSize) {
        Page<Object> pageObject = PageHelper.startPage(pageNum, pageSize);
        List<News> list = newsDAO.selectAll();

        Map<String, Object> map = new HashMap<String, Object>();
        map.put("total", pageObject.getTotal());
        map.put("rows", list);
        return map;
    }

    //前台展示
    @Override
    public List<News> getAllNewsExhibition() {
        return newsDAO.selectAllNewsExhibition();
    }

    @Override
    public News getNews(Integer id) {
        return newsDAO.selectNews(id);
    }

    @Override
    public void addNews(News news) {
        newsDAO.insertNews(news);
    }

    @Override
    public void removeNews(Integer id) {
        newsDAO.deleteNews(id);
    }

    @Override
    public void changeNews(News news) {
        newsDAO.updateNews(news);
    }

}
