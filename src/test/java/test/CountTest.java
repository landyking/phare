package test;

import gen.Account;
import org.beetl.sql.core.SQLManager;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * Created by landy on 2018/11/13.
 */
public class CountTest {
    public static void main(String[] args) {
        ClassPathXmlApplicationContext app = new ClassPathXmlApplicationContext("applicationContext_database.xml");
        SQLManager sqlManager = app.getBean(SQLManager.class);
        System.out.println(sqlManager.allCount(Account.class));
    }
}
