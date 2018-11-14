package app.common.shiro;

import org.apache.shiro.authc.UsernamePasswordToken;

/**
 * @author: landy
 * @date: 2017-11-07 22:23
 */
public class MyToken extends UsernamePasswordToken {
    private Integer userMode;
    private Integer debugId;

    public Integer getUserMode() {
        return userMode;
    }

    public void setUserMode(Integer userMode) {
        this.userMode = userMode;
    }

    public Integer getDebugId() {
        return debugId;
    }

    public void setDebugId(Integer debugId) {
        this.debugId = debugId;
    }
}
