package app.listener;


import org.apache.log4j.Appender;
import org.apache.log4j.Logger;
import org.apache.log4j.RollingFileAppender;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.io.File;
import java.util.Enumeration;

/**
 * Created by landy on 2017/12/12.
 */
public class GlobalInit implements ServletContextListener {
    private static File AttachmentUploadPath;


    public static File getAttachmentUploadPath() {
        return AttachmentUploadPath;
    }


    @Override
    public void contextInitialized(ServletContextEvent servletContextEvent) {
        ServletContext global = servletContextEvent.getServletContext();
        global.log("开始进行全局初始化");
        showFileAppender(global);
        decideAttachmentUploadPath(global);
    }
    private void showFileAppender(ServletContext global) {
        Enumeration appenders = Logger.getRootLogger().getAllAppenders();
        while (appenders.hasMoreElements()) {
            Appender o = (Appender) appenders.nextElement();
            if (o instanceof RollingFileAppender) {
                global.log("Log4j日志文件输出位置: " + new File(((RollingFileAppender) o).getFile()).getAbsolutePath());
            }
        }
    }

    private void decideAttachmentUploadPath(ServletContext global) {
        global.log("获取tomcat.base");
        String base = System.getProperty("catalina.base");
        if (base == null || base.trim().length() == 0) {
            global.log("获取tomcat.base 失败");
            base = global.getRealPath("/");
            global.log("获取ServletContext根目录：" + base);
        }
        File parentDir = new File(base);
        File dir = new File(parentDir, "attach_upload");
        if (!dir.exists()) {
            boolean mkdirs = dir.mkdirs();
            if (!mkdirs) {
                throw new RuntimeException("创建文件上传目录：" + dir.getAbsolutePath() + "失败");
            }
        }
        AttachmentUploadPath = dir;
        global.log("附件上传目录确定为：" + AttachmentUploadPath.getAbsolutePath());
    }

    @Override
    public void contextDestroyed(ServletContextEvent servletContextEvent) {

    }
}
