package com.jwnming.entity;

import com.alibaba.fastjson.annotation.JSONField;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

public class Device implements Serializable {
    @JSONField(name="id")
    private Integer device_id;
    @JSONField(name="title")
    private String device_name;
    private String model;
    private Integer count;
    private String source;
    private Double plan_expenditure;
    private Double total_payment;
    @DateTimeFormat(pattern = "yyyy/MM/dd")
    @JSONField(format="yyyy年MM月dd日")
    private Date arrival_time;
    private Integer device_status;
    private Integer user_id;
    private Integer project_id;

    public Device() {
    }

    public Device(Integer device_id, String device_name, String model, Integer count, String source, Double plan_expenditure, Double total_payment, Date arrival_time, Integer device_status, Integer user_id, Integer project_id) {
        this.device_id = device_id;
        this.device_name = device_name;
        this.model = model;
        this.count = count;
        this.source = source;
        this.plan_expenditure = plan_expenditure;
        this.total_payment = total_payment;
        this.arrival_time = arrival_time;
        this.device_status = device_status;
        this.user_id = user_id;
        this.project_id = project_id;
    }

    public Integer getDevice_id() {
        return device_id;
    }

    public void setDevice_id(Integer device_id) {
        this.device_id = device_id;
    }

    public String getDevice_name() {
        return device_name;
    }

    public void setDevice_name(String device_name) {
        this.device_name = device_name;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source;
    }

    public Double getPlan_expenditure() {
        return plan_expenditure;
    }

    public void setPlan_expenditure(Double plan_expenditure) {
        this.plan_expenditure = plan_expenditure;
    }

    public Double getTotal_payment() {
        return total_payment;
    }

    public void setTotal_payment(Double total_payment) {
        this.total_payment = total_payment;
    }

    public Date getArrival_time() {
        return arrival_time;
    }

    public void setArrival_time(Date arrival_time) {
        this.arrival_time = arrival_time;
    }

    public Integer getDevice_status() {
        return device_status;
    }

    public void setDevice_status(Integer device_status) {
        this.device_status = device_status;
    }

    public Integer getUser_id() {
        return user_id;
    }

    public void setUser_id(Integer user_id) {
        this.user_id = user_id;
    }

    public Integer getProject_id() {
        return project_id;
    }

    public void setProject_id(Integer project_id) {
        this.project_id = project_id;
    }

    @Override
    public String toString() {
        return "Device{" +
                "device_id=" + device_id +
                ", device_name='" + device_name + '\'' +
                ", model='" + model + '\'' +
                ", count=" + count +
                ", source='" + source + '\'' +
                ", plan_expenditure=" + plan_expenditure +
                ", total_payment=" + total_payment +
                ", arrival_time=" + arrival_time +
                ", device_status=" + device_status +
                ", user_id=" + user_id +
                ", project_id=" + project_id +
                '}';
    }
}
