package com.jwnming.dao;

import com.jwnming.entity.Device;
import com.jwnming.entity.Project;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

public interface PurchaseDAO {

    //查询所有
    List<Project> selectAll();

    //根据用户id查询所有
    List<Device> selectByUserId(Integer user_id);



    //单个查询
    Device selectDevice(Integer id);

    //添加
    void insertDevice(Device device);

    //删除
    void deleteDevice(Integer id);

    //修改
    void updateDevice(Device device);

    //修改状态
    void updateDeviceStatus(@Param("device_status") Integer status, @Param("id") Integer id);

    //修改时间
    void updateDeviceTime(@Param("arrival_time") Date arrival_time, @Param("id") Integer id);


}
