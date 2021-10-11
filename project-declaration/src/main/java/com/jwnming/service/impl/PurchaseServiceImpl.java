package com.jwnming.service.impl;

import com.jwnming.dao.PurchaseDAO;
import com.jwnming.entity.Device;
import com.jwnming.entity.Project;
import com.jwnming.service.PurchaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;


@Service
@Transactional
public class PurchaseServiceImpl implements PurchaseService {

    @Autowired
    private PurchaseDAO purchaseDAO;

    @Override
    public List<Project> getAll() {
        return purchaseDAO.selectAll();
    }

    @Override
    public List<Device> getByUserId(Integer user_id) {
        return purchaseDAO.selectByUserId(user_id);
    }

    @Override
    public Device getDevice(Integer id) {
        return purchaseDAO.selectDevice(id);
    }

    @Override
    public boolean addDevice(Device purchase) {
        try {
            purchaseDAO.insertDevice(purchase);
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    @Override
    public boolean removeDevice(Integer id) {
        try {
            purchaseDAO.deleteDevice(id);
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    @Override
    public boolean changeDevice(Device purchase) {
        try {
            purchaseDAO.updateDevice(purchase);
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    @Override
    public void updateDeviceStatus(Integer status, Integer id) {
        purchaseDAO.updateDeviceStatus(status, id);
    }

    @Override
    public void updateDeviceTime(Date arrival_time, Integer id) {
        purchaseDAO.updateDeviceTime(arrival_time, id);
    }
}
