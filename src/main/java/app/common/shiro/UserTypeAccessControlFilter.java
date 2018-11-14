package app.common.shiro;

import app.common.Texts;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.AccessControlFilter;
import org.apache.shiro.web.util.WebUtils;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.util.Assert;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author: landy
 * @date: 2017-11-07 22:41
 */
public class UserTypeAccessControlFilter extends AccessControlFilter implements InitializingBean {
    private Integer userMode;

    public Integer getUserMode() {
        return userMode;
    }

    public void setUserMode(Integer userMode) {
        this.userMode = userMode;
    }

    @Override
    public void afterPropertiesSet() throws Exception {
        Assert.notNull(getUserMode());
    }


    @Override
    protected boolean isAccessAllowed(ServletRequest request, ServletResponse response, Object mappedValue) throws Exception {
        Subject subject = getSubject(request, response);
        if (subject.isAuthenticated()) {
            MyUser user = (MyUser) subject.getPrincipal();
            if (getUserMode().equals(user.getUserMode())) {
                return true;
            }
        }
        return false;
    }

    @Override
    protected boolean onAccessDenied(ServletRequest request, ServletResponse response) throws Exception {
        if (isAdminAccess(request)) {
            if (isAjaxRequest(request)) {
                WebUtils.toHttp(response).sendError(HttpServletResponse.SC_UNAUTHORIZED, "无权访问");
            } else {
                this.saveRequestAndRedirectToLogin(request, response);
            }
            return false;
        } else {
            WebUtils.toHttp(response).sendError(HttpServletResponse.SC_UNAUTHORIZED, "无权访问");
            return false;
        }
    }

    private boolean isAjaxRequest(ServletRequest request) {
        HttpServletRequest req = (HttpServletRequest) request;
        String header = req.getHeader("X-Requested-With");
        if (Texts.hasText(header)) {
            return true;
        }
        return false;
    }

    private boolean isAdminAccess(ServletRequest request) {
        HttpServletRequest req = WebUtils.toHttp(request);
        String servletPath = req.getServletPath();
        return servletPath.equals("/") || servletPath.startsWith("/admin") || servletPath.endsWith(".jsp");
    }
}
