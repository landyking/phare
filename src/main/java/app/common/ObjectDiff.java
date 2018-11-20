package app.common;

import org.springframework.cglib.beans.BeanMap;
import org.springframework.util.Assert;

import java.util.*;
import java.util.function.Consumer;
import java.util.function.Function;

/**
 * Created by landy on 2018/11/20.
 */
public class ObjectDiff {
    public static class ChangeContent {
        private final String before;
        private final String after;

        public ChangeContent(String before, String after) {
            this.before = before;
            this.after = after;
        }

        public String getBefore() {
            return before;
        }

        public String getAfter() {
            return after;
        }

    }

    public static String calcToJson(Object old, Object newOne, String... names) {
        return QuickJson.toJsonString(calc(old, newOne, names));
    }

    public static Map<String, ChangeContent> calc(Object old, Object newOne, String... names) {
        Assert.notNull(old, "old is null");
        Assert.notNull(newOne, "new is null");
        Assert.isTrue(old.getClass() == newOne.getClass(), "not same class: old is " + old.getClass().getName() + ", new is " + newOne.getClass().getName());
        BeanMap oldMap = BeanMap.create(old);
        BeanMap newMap = BeanMap.create(newOne);
        Set<String> keys = new HashSet<>();
        if (names != null && names.length > 0) {
            Collections.addAll(keys, names);
        } else {
            keys.addAll(oldMap.keySet());
            keys.addAll(newMap.keySet());
        }
        Map<String, ChangeContent> rst = new HashMap<>();
        keys.forEach(s -> {
            Object o = oldMap.get(s);
            Object n = newMap.get(s);
            if (!isSame(o, n)) {
                rst.put(s, new ChangeContent(Texts.toString(o), Texts.toString(n)));
            }
        });
        return rst;
    }

    public static Map<String, ChangeContent> calc(Object old, Object newOne) {
        return calc(old, newOne, null);
    }


    private static boolean isSame(Object o, Object n) {
        if (o == null && n == null) {
            return true;
        }
        if (o == null || n == null) {
            return false;
        }
        return Texts.toString(o).trim().equals(Texts.toString(n).trim());
    }
}
