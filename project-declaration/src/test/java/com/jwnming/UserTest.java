package com.jwnming;

import com.jwnming.entity.User;
import com.jwnming.service.UserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;
import java.util.Map;

@RunWith(SpringRunner.class)
@SpringBootTest
public class UserTest {
    @Autowired
    @Qualifier("userServiceImpl")
    private UserService userService;

    @Test
    public void test() {
        /*User jiang = userService.getUserByNameAndPassword("蒋文明", "123456");
        System.out.println(jiang);*/

        /*List<User> liste = userService.getUserExhibition();
        liste.forEach(System.out::println);*/

        /*Map<String, Object> all = userService.getAllUser(1, 10);
        ((List<User>)all.get("rows")).forEach(System.out::println);*/

        /*User jwnming = userService.getUserByNameAndPassword("蒋文明", "123456");
        System.out.println(jwnming);*/

        /*User user = new User(null, "李娜", "123456", "1111", 0, 22, "2015", "软件学院",
                "移动互联网", "4班", "北区345室", "1247652634", "34@sd.com", "/uploadfiles/s.jpg",
                1, null,null);*/
     /*   boolean b = userService.addUser(user);
        boolean b1 = userService.changeUser(user);
        List<User> allUser = userService.getAllUser();
        List<User> jwnming = userService.getByName("蒋文明");
        User getUser = userService.getUserById(1001);
        */
        //boolean b2 = userService.changeUserStatus(0, 1000);
        /*User user = userService.getUserById(1000);
        System.out.println(user);*/
        System.out.println(userService.getUserByNameAndPassword("蒋文明", "123456"));

    }

}
