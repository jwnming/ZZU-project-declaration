package com.jwnming.service;

import com.jwnming.entity.Device;
import com.jwnming.entity.Project;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

public interface PurchaseService {

    //查询所有
    List<Project> getAll();

    //根据用户id查询所有
    List<Device> getByUserId(Integer user_id);


    //单个查询
    Device getDevice(Integer id);

    //添加
    boolean addDevice(Device purchase);

    //删除
    boolean removeDevice(Integer id);

    //修改
    boolean changeDevice(Device purchase);

    //修改状态
    void updateDeviceStatus(Integer status, Integer id);

    //修改时间
    void updateDeviceTime(Date arrival_time, Integer id);

}
