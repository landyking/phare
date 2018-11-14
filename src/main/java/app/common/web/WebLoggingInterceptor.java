package app.common.web;

import app.common.web.event.WebLoggingEvent;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.ApplicationListener;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author: landy
 * @date: 2018-01-13 11:27
 */
public class WebLoggingInterceptor implements HandlerInterceptor, ApplicationListener<WebLoggingEvent> {
    protected final Log logger = LogFactory.getLog(getClass());
    private volatile boolean enable = false;

    @Override
    public void onApplicationEvent(WebLoggingEvent webLoggingEvent) {
        logger.info("receive event: " + webLoggingEvent.toString());
        enable = webLoggingEvent.isEnable();
        MyMappingJackson2JsonView.openDebug = enable;
    }

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        if (enable) {
            if (handler != null && (handler instanceof BaseController)) {
                String reqURL = request.getRequestURL().toString();
                logger.info("request url: " + reqURL + ", param: " + ((BaseController) handler).getSuperParam(request, response).toString());
            }
        }
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
