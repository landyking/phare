package app.common.shiro;

import org.apache.log4j.Logger;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;

/**
 * Created by landy on 2018/2/24.
 */
public class MyWebSecurityManager extends DefaultWebSecurityManager {

    public static final String MY_USER_ID_KEY = "__myUser.id";
    private Logger logger = Logger.getLogger(MyWebSecurityManager.class);
/*

    @Override
    protected void onSuccessfulLogin(AuthenticationToken token, AuthenticationInfo info, Subject subject) {
        super.onSuccessfulLogin(token, info, subject);
        //登录成功后，将用户id放入session中
        MyUser user = (MyUser) subject.getPrincipal();
        Session currentSession = subject.getSession();
        currentSession.setAttribute(MY_USER_ID_KEY, user.uniqueId());
        //检查当前的所有session，判断用户id是否已经存在，如果存在则销毁该session
        MySessionManager sm = (MySessionManager) getSessionManager();
        Map<SessionKey, String> waitForDel = Maps.newHashMap();
        for (Session one : sm.getSessionDAO().getActiveSessions()) {
            String userId = (String) one.getAttribute(MY_USER_ID_KEY);
            if (!currentSession.getId().equals(one.getId()) && user.uniqueId().equals(userId)) {
                waitForDel.put(new DefaultSessionKey(one.getId()), userId);
            }
        }
        for (SessionKey one : waitForDel.keySet()) {
            String userId = waitForDel.get(one);
            logger.warn("kickout session: " + one.getSessionId() + ", userId: " + userId);
            sm.stop(one);
        }
    }
*/

}
