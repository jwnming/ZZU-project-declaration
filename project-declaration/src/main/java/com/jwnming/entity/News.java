package com.jwnming.entity;

import com.alibaba.fastjson.annotation.JSONField;

import java.io.Serializable;
import java.util.Date;

public class News implements Serializable {
    private Integer id;
    private String title;
    private String content;
    @JSONField(format="yyyy-MM-dd")
    private Date upload_time;
    private Integer status;

    public News() {
    }

    public News(Integer id, String title, String content, Date upload_time, Integer status) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.upload_time = upload_time;
        this.status = status;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getUpload_time() {
        return upload_time;
    }

    public void setUpload_time(Date upload_time) {
        this.upload_time = upload_time;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "News{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", upload_time=" + upload_time +
                ", status=" + status +
                '}';
    }
}
