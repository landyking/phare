package app.common.web.event;

import org.springframework.context.ApplicationEvent;

/**
 * @author: landy
 * @date: 2018-01-27 19:06
 */
public class WebLoggingEvent extends ApplicationEvent {
    private final boolean enable;

    public WebLoggingEvent(Object source, boolean enable) {
        super(source);
        this.enable = enable;
    }

    public boolean isEnable() {
        return enable;
    }

    @Override
    public String toString() {
        return "WebLoggingEvent{" +
                "enable=" + enable +
                "} ";
    }
}
