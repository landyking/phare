package app.shiro;

import app.common.DateTimeTool;
import app.common.shiro.MyToken;
import app.common.shiro.MyUser;
import gen.Account;
import org.apache.shiro.authc.*;
import org.apache.shiro.authc.pam.UnsupportedTokenException;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.beetl.sql.core.SQLManager;

public class MyRealm extends AuthorizingRealm {
    private SQLManager sqlManager;
    public void setSqlManager(SQLManager sqlManager) {
        this.sqlManager = sqlManager;
    }

    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
        authorizationInfo.addStringPermission("*");
        return authorizationInfo;
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        MyToken myToken = (MyToken) token;
        if (myToken.getUserMode() == MyUser.MODE_ADMIN) {
            Account user = sqlManager.query(Account.class)
                    .andEq("username", myToken.getUsername())
                    .andEq("enable_flag", 1)
                    .andEq("delete_flag", 0)
                    .single();
            if (user == null) {
                throw new UnknownAccountException("账号: " + myToken.getUsername() + " 不存在");
            } else {
                MyUser u = new MyUser();
                u.setUserId(user.getId());
                u.setUserMode(MyUser.MODE_ADMIN);
                u.setUserName(myToken.getUsername());
                u.setLoginTime(DateTimeTool.nowLong());
                return new SimpleAuthenticationInfo(u, user.getPassword(), getName());
            }
        } else {
            throw new UnsupportedTokenException("unknown userMod" +
                    "e: " + myToken.getUserMode());
        }
    }

    @Override
    protected void assertCredentialsMatch(AuthenticationToken token, AuthenticationInfo info) throws AuthenticationException {
        MyToken myToken = (MyToken) token;
        if (myToken.getUserMode() == MyUser.MODE_ADMIN) {
            super.assertCredentialsMatch(token, info);
        } else if (myToken.getUserMode() == MyUser.MODE_H5) {
            System.out.println("#### miniapp pass ####");
        }
    }
}