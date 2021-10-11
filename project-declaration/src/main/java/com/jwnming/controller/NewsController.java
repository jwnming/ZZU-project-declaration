package com.jwnming.controller;


import com.jwnming.entity.News;
import com.jwnming.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/news")
public class NewsController {
    @Autowired
    private NewsService newsService;


    //首页单个查询
    @RequestMapping("/getNewsByIdExhibition/{id}")
    public String getNewsByIdExhibition(@PathVariable("id") Integer id, HttpSession session) {
        News news = newsService.getNews(id);
        session.setAttribute("getNewsByIdExhibition", news);
        //System.out.println(news);
        return "redirect:/user/index_news.jsp";
    }

    //前台展示的放入session
    @RequestMapping("/newsExhibition")
    @ResponseBody
    public String newsExhibition(HttpSession session) {
        List<News> list = newsService.getAllNewsExhibition();
        session.setAttribute("newsExhibition", list);
        return "ok";
    }


    //获取所有
    @RequestMapping("/getAll")
    @ResponseBody
    public Object getAll(Integer page, Integer rows) {
        if (page == null || rows == null ) {
            page = 1;
            rows = 5;
        }
        Map<String, Object> all = newsService.getAll(page, rows);

        return all;
    }

    //添加
    @RequestMapping("/add")
    @ResponseBody
    public Map<String, Object> add(News news, HttpSession session) {
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            news.setUpload_time(new Date());
            newsService.addNews(news);
            //前台展示
            List<News> list = newsService.getAllNewsExhibition();
            session.setAttribute("newsExhibition", list);

            map.put("code", 200);
            map.put("msg", "添加成功");
            return map;
        } catch (Exception e) {
            map.put("code", 201);
            map.put("msg", "添加失败");
            //e.printStackTrace();
            return map;
        }

    }

    //修改-查询单个
    @RequestMapping("/getById/{id}")
    public @ResponseBody News getById(@PathVariable("id") Integer id) {
        News news = newsService.getNews(id);
        return news;
    }

    //修改
    @RequestMapping("/changeNews")
    public @ResponseBody Object changeNews(News news, HttpSession session) {
        //System.out.println("修改:" + news);
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            newsService.changeNews(news);

            //前台展示
            List<News> list = newsService.getAllNewsExhibition();
            session.setAttribute("newsExhibition", list);
            map.put("code", 200);
            map.put("msg", "修改成功");
            return map;
        } catch (Exception e) {
            map.put("code", 201);
            map.put("msg", "修改失败");
            return map;
        }
    }

    //删除
    @RequestMapping("/deleteNews/{id}")
    public @ResponseBody Object deleteNews(@PathVariable("id") Integer id) {
        //System.out.println("删除：" + id);

        Map<String, Object> map = new HashMap<String, Object>();
        try {
            newsService.removeNews(id);

            map.put("code", 200);
            map.put("msg", "删除成功");
            return map;
        } catch (Exception e) {
            map.put("code", 201);
            map.put("msg", "删除失败");
            return map;
        }
    }

}
