package com.jwnming.entity;

import java.io.Serializable;

public class Documents implements Serializable {

    private Integer id;
    private String name;
    private String href;
    private Integer project_id;
    private Integer user_id;

    public Documents() {
    }

    public Documents(Integer id, String name, String href, Integer project_id, Integer user_id) {
        this.id = id;
        this.name = name;
        this.href = href;
        this.project_id = project_id;
        this.user_id = user_id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getHref() {
        return href;
    }

    public void setHref(String href) {
        this.href = href;
    }

    public Integer getProject_id() {
        return project_id;
    }

    public void setProject_id(Integer project_id) {
        this.project_id = project_id;
    }

    public Integer getUser_id() {
        return user_id;
    }

    public void setUser_id(Integer user_id) {
        this.user_id = user_id;
    }

    @Override
    public String toString() {
        return "Documents{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", href='" + href + '\'' +
                ", project_id=" + project_id +
                ", user_id=" + user_id +
                '}';
    }
}
