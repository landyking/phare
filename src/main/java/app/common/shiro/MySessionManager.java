package app.common.shiro;

import org.apache.shiro.session.Session;
import org.apache.shiro.session.UnknownSessionException;
import org.apache.shiro.session.mgt.SessionKey;
import org.apache.shiro.web.session.mgt.DefaultWebSessionManager;
import org.apache.shiro.web.util.WebUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.http.HttpServletRequest;
import java.io.Serializable;

/**
 * @author: landy
 * @date: 2017-11-07 23:55
 */
public class MySessionManager extends DefaultWebSessionManager {

    public static final Logger LOGGER = LoggerFactory.getLogger(MySessionManager.class);

    @Override
    public Serializable getSessionId(SessionKey key) {
        Serializable id = super.getSessionId(key);
        if (id == null && WebUtils.isWeb(key)) {
            HttpServletRequest request = WebUtils.getHttpRequest(key);
            id = request.getHeader("itoken");
            if (id == null) {
                id = request.getParameter("itoken");
            }
        }
        return id;
    }

    protected Session retrieveSessionFromDataSource(Serializable sessionId) throws UnknownSessionException {
        try {
            Session session = super.retrieveSessionFromDataSource(sessionId);
            return session;
        } catch (UnknownSessionException e) {
//            LOGGER.info("UnknownSessionException: {}", sessionId);
        }
        return null;
    }
}
