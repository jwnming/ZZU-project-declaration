package com.jwnming.entity;

import java.io.Serializable;

public class Teacher implements Serializable {
    private Integer id;
    private String name;
    private String job;     //职位
    private String mobile;

    public Teacher() {
    }

    public Teacher(Integer id, String name, String job, String mobile) {
        this.id = id;
        this.name = name;
        this.job = job;
        this.mobile = mobile;
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

    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    @Override
    public String toString() {
        return "Teacher{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", job='" + job + '\'' +
                ", mobile='" + mobile + '\'' +
                '}';
    }
}
