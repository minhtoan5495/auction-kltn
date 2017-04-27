package hvcntt.org.shoppingweb.utils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class LOG {
    // 1: java.lang.Thread
    // 2: com.smartlink.services.bussiness.log.LOG.getCallingClassName
    // 3: com.smartlink.services.bussiness.log.LOG.getLogger
    // 4: Thread of calling class
    // IF add or remove any method before calling logger, shut change the value of this constant.
    private static final int CALLING_CLASS_INDEX_IN_THREAD = 4;

    protected static String formatMessage(String message) {
        return message;
    }

    private static String getCallingClassName() {
        StackTraceElement stackTraceElement = Thread.currentThread().getStackTrace()[CALLING_CLASS_INDEX_IN_THREAD];
        return stackTraceElement.getClassName();
    }

    private static Logger getLogger() {
        return LoggerFactory.getLogger(getCallingClassName());

    }

    public static void info(String message) {
        getLogger().info(formatMessage(message));
    }

    public static void info(String message, Object...arguments) {
        getLogger().info(formatMessage(message), arguments);
    }

    public static void info(String message, Throwable throwable) {
        getLogger().info(formatMessage(message), throwable);
    }

    public static void debug(String message) {
        getLogger().debug(formatMessage(message));
    }

    public static void debug(String message, Object...arguments) {
        getLogger().debug(formatMessage(message), arguments);
    }

    public static void debug(String message, Throwable throwable) {
        getLogger().debug(formatMessage(message), throwable);
    }

    public static void error(String message, Object...arguments) {
        getLogger().error(formatMessage(message), arguments);
    }

    public static void error(String message) {
        getLogger().error(formatMessage(message));
    }

    public static void error(String message, Throwable throwable) {
        getLogger().error(formatMessage(message), throwable);
    }

    public static void warn(String message, Object...arguments) {
        getLogger().warn(formatMessage(message), arguments);
    }

    public static void warn(String message) {
        getLogger().warn(formatMessage(message));
    }

    public static void warn(String message, Throwable throwable) {
        getLogger().warn(formatMessage(message), throwable);
    }
}
