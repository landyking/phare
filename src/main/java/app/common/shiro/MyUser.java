package app.common.shiro;

import java.io.Serializable;

/**
 * Created by landy on 2017/11/23.
 */
public class MyUser implements Serializable {
    public static final int MODE_H5 = 1;
    public static final int MODE_ADMIN = 2;
    //    public static final int MODE_APP = 3;
    private String userId;
    private int userMode;
    private String userName;
    //    private String realname;
    private Long loginTime;


    public Long getLoginTime() {
        return loginTime;
    }

    public void setLoginTime(Long loginTime) {
        this.loginTime = loginTime;
    }

    /* public String getRealname() {
         return realname;
     }

     public void setRealname(String realname) {
         this.realname = realname;
     }
 */
    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String uniqueId() {
        return userId.toString();
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public int getUserMode() {
        return userMode;
    }

    public void setUserMode(int userMode) {
        this.userMode = userMode;
    }
}
