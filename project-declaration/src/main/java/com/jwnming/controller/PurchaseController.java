package com.jwnming.controller;


import com.jwnming.entity.Device;
import com.jwnming.entity.Project;
import com.jwnming.entity.User;
import com.jwnming.service.ProjectService;
import com.jwnming.service.PurchaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.*;

@Controller
@RequestMapping("/purchase")
public class PurchaseController {
    @Autowired
    private PurchaseService purchaseService;

    @Autowired
    private ProjectService projectService;





    //跳转到采购列表页面
    @RequestMapping("/getUserDevices")
    public String getUserDevices(HttpSession session) {
        if(((User)session.getAttribute("user") != null)){
            List<Device> userDevices = purchaseService.getByUserId(((User) session.getAttribute("user")).getId());
            session.setAttribute("userDevices",userDevices);
            return "user/project_device_list";
        }
        return "default";
    }


    //添加采购设备
    @RequestMapping("/addTheDevice")
    public String addTheDevice(Device device, HttpSession session) {
        //System.out.println("添加：" + device);
        if(((User)session.getAttribute("user") != null)){
            device.setUser_id(((User) session.getAttribute("user")).getId());
            device.setDevice_status(0);
            purchaseService.addDevice(device);

            List<Device> userDevices = purchaseService.getByUserId(((User) session.getAttribute("user")).getId());
            session.setAttribute("userDevices",userDevices);
            return "user/project_device_list";
        }
        return "default";
    }

    //跳转到验收页面
    @RequestMapping("/getUserPassProjects")
    public String getUserPassProjects(HttpSession session) {
        if(((User)session.getAttribute("user") != null)){
            List<Project> list = projectService.getAllByUserId(((User) session.getAttribute("user")).getId());
            List<Project> userPassProjectsf = new ArrayList<>();
            for (Project p : list) {
                if (p.getStatus() == 1) {
                    userPassProjectsf.add(p);
                }
            }
            session.setAttribute("userPassProjects",userPassProjectsf);
            //System.out.println("验收：" +userPassProjectsf);
            return "user/project_confirm";
        }
        return "default";
    }
    //跳转到添加设备页面
    @RequestMapping("/toAdd")
    public String toAdd(HttpSession session) {
        if(((User)session.getAttribute("user") != null)){
            List<Project> list = projectService.getAllByUserId(((User) session.getAttribute("user")).getId());
            List<Project> userPassProjects = new ArrayList<>();
            for (Project p : list) {
                if (p.getStatus() == 1) {
                    userPassProjects.add(p);
                }
            }
            session.setAttribute("userPassProjects",userPassProjects);
            return "user/project_device_form";
        }
        return "default";
    }

    //修改设备交付状态-审核
    @RequestMapping("/changeDeviceStatus/{id}/{status}")
    public @ResponseBody Object changeStatus(@PathVariable("id") Integer id, @PathVariable("status") Integer status) {
        purchaseService.updateDeviceStatus(status, id);
        purchaseService.updateDeviceTime(new Date(), id);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("code", 200);
        map.put("msg", "修改成功");

        return map;
    }
    //根据id删除
    @RequestMapping("/deleteDeviceById/{id}")
    public @ResponseBody Object deleteDeviceById(@PathVariable("id") Integer id) {
        purchaseService.removeDevice(id);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("code", 200);
        map.put("msg", "删除成功");

        return map;
    }
    //----------------------------------------------------




    //查询所有
    @RequestMapping("/getAll")
    public @ResponseBody
    List<Project> getAll() {
        return purchaseService.getAll();
    }

    //获取资金统计
    @RequestMapping("/perPurchaseStatistics")
    @ResponseBody
    public Object perPurchaseStatistics() {
        double[] num = new double[4];
        Map<String, Object> allUser = projectService.getAll(1, 1000);
        List<Project> list = (List<Project>) allUser.get("rows");
        for (Project p : list) {
            if (p.getCategory().equals("非实验室创新项目")) {
                num[0] += p.getFunds();
            } else if (p.getCategory().equals("实验室软件项目")) {
                num[1] += p.getFunds();
            } else if (p.getCategory().equals("教学实验项目")) {
                num[2] += p.getFunds();
            } else {
                num[3] += p.getFunds();
            }
        }
        //System.out.println(num);
        return num;
    }
    //获取总资金统计
    @RequestMapping("/allPurchaseStatistics")
    @ResponseBody
    public Object allPurchaseStatistics() {
        double[] num = new double[1];
        Map<String, Object> allUser = projectService.getAll(1, 1000);
        List<Project> list = (List<Project>) allUser.get("rows");
        for (Project p : list) {
           num[0] += p.getFunds();
        }
        return num;
    }


}
