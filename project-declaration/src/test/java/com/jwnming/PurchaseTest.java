package com.jwnming;

import com.jwnming.entity.Device;
import com.jwnming.entity.Project;
import com.jwnming.service.PurchaseService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.Date;
import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
public class PurchaseTest {
    @Autowired
    @Qualifier("purchaseServiceImpl")
    private PurchaseService purchaseService;

    @Test
    public void test() {
        //purchaseService.addDevice(new Device(null, null, null, null, null, null, null, null, null, null, null));
        purchaseService.updateDeviceTime(new Date(), 10008);

        /*
        List<Project> list = purchaseService.getAll();
        list.forEach(System.out::println);
*/
    }
}
