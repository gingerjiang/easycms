package easycms.util;

import java.util.List;

import easycms.context.Injection;
import easycms.obj.Data;
import easycms.service.DataService;

public class DataUtils {

    public static List<Data> findLimt(int subjectId, int rows) {
        return Injection.INSTANCE.getInjector().getInstance(DataService.class).findLimit(subjectId,
                rows);
    }

    public static List<Data> findList(int subjectId) {
        return Injection.INSTANCE.getInjector().getInstance(DataService.class).findList(subjectId);
    }

    public static Data findOne(int subjectId) {
        return Injection.INSTANCE.getInjector().getInstance(DataService.class).findOne(subjectId);
    }

}
