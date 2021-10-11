package com.jwnming.entity;

import com.alibaba.fastjson.annotation.JSONField;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class Project implements Serializable {

    private Integer id;
    @JSONField(name="title")
    private String name;
    @JSONField(format = "yyyy年MM月dd日")
    private Date declare_time;
    private Double funds;
    private String logo;
    private String description;
    private Integer documents_id;
    private String category;
    @JSONField(name="nouse")
    private Integer user_id;
    private String user_name;
    private Integer status;
    private Integer exhibition;
    private Integer finished;
    @JSONField(name="children")
    private List<Device> devices;

    public Project() {
    }

    public Project(Integer id, String name, Date declare_time, Double funds, String logo, String description, Integer documents_id, String category, Integer user_id, String user_name, Integer status, Integer exhibition, Integer finished, List<Device> devices) {
        this.id = id;
        this.name = name;
        this.declare_time = declare_time;
        this.funds = funds;
        this.logo = logo;
        this.description = description;
        this.documents_id = documents_id;
        this.category = category;
        this.user_id = user_id;
        this.user_name = user_name;
        this.status = status;
        this.exhibition = exhibition;
        this.finished = finished;
        this.devices = devices;
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

    public Date getDeclare_time() {
        return declare_time;
    }

    public void setDeclare_time(Date declare_time) {
        this.declare_time = declare_time;
    }

    public Double getFunds() {
        return funds;
    }

    public void setFunds(Double funds) {
        this.funds = funds;
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Integer getDocuments_id() {
        return documents_id;
    }

    public void setDocuments_id(Integer documents_id) {
        this.documents_id = documents_id;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public Integer getUser_id() {
        return user_id;
    }

    public void setUser_id(Integer user_id) {
        this.user_id = user_id;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getExhibition() {
        return exhibition;
    }

    public void setExhibition(Integer exhibition) {
        this.exhibition = exhibition;
    }

    public Integer getFinished() {
        return finished;
    }

    public void setFinished(Integer finished) {
        this.finished = finished;
    }

    public List<Device> getDevices() {
        return devices;
    }

    public void setDevices(List<Device> devices) {
        this.devices = devices;
    }

    @Override
    public String toString() {
        return "Project{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", declare_time=" + declare_time +
                ", funds=" + funds +
                ", logo='" + logo + '\'' +
                ", description='" + description + '\'' +
                ", documents_id=" + documents_id +
                ", category='" + category + '\'' +
                ", user_id=" + user_id +
                ", user_name='" + user_name + '\'' +
                ", status=" + status +
                ", exhibition=" + exhibition +
                ", finished=" + finished +
                ", devices=" + devices +
                '}';
    }
}
