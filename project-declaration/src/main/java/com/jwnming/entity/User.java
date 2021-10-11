package com.jwnming.entity;

import java.io.Serializable;

public class User implements Serializable{

    private Integer id;
    private String name;
    private String password;
    private String salt;        //加密盐值
    private Integer sex;
    private Integer age;
    private String level;       //第几级
    private String department;  //学院
    private String major;
    private String clazz;
    private String laboratory;
    private String mobile;
    private String email;
    private String picture;
    private Integer status;
    private Teacher teacher;    //指导老师
    private String teacher_name;
    private Integer exhibition; //首页优秀负责人展示

    public User() {}

    public User(Integer id, String name, String password, String salt, Integer sex, Integer age, String level, String department, String major, String clazz, String laboratory, String mobile, String email, String picture, Integer status, Teacher teacher, Integer exhibition) {
        this.id = id;
        this.name = name;
        this.password = password;
        this.salt = salt;
        this.sex = sex;
        this.age = age;
        this.level = level;
        this.department = department;
        this.major = major;
        this.clazz = clazz;
        this.laboratory = laboratory;
        this.mobile = mobile;
        this.email = email;
        this.picture = picture;
        this.status = status;
        this.teacher = teacher;
        this.teacher_name = teacher.getName();
        this.exhibition = exhibition;
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

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getSalt() {
        return salt;
    }

    public void setSalt(String salt) {
        this.salt = salt;
    }

    public Integer getSex() {
        return sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public String getClazz() {
        return clazz;
    }

    public void setClazz(String clazz) {
        this.clazz = clazz;
    }

    public String getLaboratory() {
        return laboratory;
    }

    public void setLaboratory(String laboratory) {
        this.laboratory = laboratory;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Teacher getTeacher() {
        return teacher;
    }

    public void setTeacher(Teacher teacher) {
        this.teacher = teacher;
        this.teacher_name = teacher.getName();
    }

    public String getTeacher_name() {
        return teacher_name;
    }

    public void setTeacher_name() {
        this.teacher_name = this.teacher.getName();
    }

    public Integer getExhibition() {
        return exhibition;
    }

    public void setExhibition(Integer exhibition) {
        this.exhibition = exhibition;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", password='" + password + '\'' +
                ", salt='" + salt + '\'' +
                ", sex=" + sex +
                ", age=" + age +
                ", level='" + level + '\'' +
                ", department='" + department + '\'' +
                ", major='" + major + '\'' +
                ", clazz='" + clazz + '\'' +
                ", laboratory='" + laboratory + '\'' +
                ", mobile='" + mobile + '\'' +
                ", email='" + email + '\'' +
                ", picture='" + picture + '\'' +
                ", status=" + status +
                ", teacher=" + teacher +
                ", exhibition=" + exhibition +
                '}';
    }
}
