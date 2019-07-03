package easycms.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.joda.time.DateTime;

import com.google.common.collect.Maps;

import easycms.dao.CountDao;
import easycms.obj.Subject;

public class CountService {

	@Inject
	CountDao countDao;
	
	public Map<String, Object> numSubjectCode() {
		Map<String ,Object> map = Maps.newHashMap();
		Map<String ,Object> codeMap = Maps.newHashMap();
		List<Map<String, Object>> list = countDao.numSubjectCode();
		for (Map<String, Object> m : list) {
			codeMap.put(m.get("subjectCode").toString(), m.get("num"));
		}
		List<Subject> subjects = countDao.findSubject();
		int size = subjects.size();
		String[] names = new String[size];
		Object[] nums = new Object[size];
		for (int i = 0; i < size; i++) {
			names[i] = subjects.get(i).getName();
			//nums[i] = codeMap.get(subjects.get(i).getCode());
		}
		map.put("names", names);
		map.put("nums", nums);
		return map;
	}
	
	public Map<String, Object> numMonth() {
		Map<String, Object> data = Maps.newHashMap();
		
		Map<String ,Object> monthMap = Maps.newHashMap();
		List<Map<String, Object>> list = countDao.numMonth();
		for (Map<String, Object> m : list) {
			monthMap.put(m.get("month").toString(), m.get("num"));
		}
		
		
		String[] months = new String[12];// 前12个月
		Object[] nums = new Object[12];
		DateTime dt = new DateTime();// 取得当前时间
		dt = dt.plusMonths(-11);
		for (int i = 0; i < 12; i++) {
			DateTime dt2 = dt.plusMonths(i);
			int mfy = dt2.getMonthOfYear();
			String m = mfy < 10 ? "0" + mfy : mfy+"";
			String ym = dt2.getYear() + "-" + m;
			months[i] = ym;
			if (null == monthMap.get(ym)) {
				nums[i] = 0;
			} else {
				nums[i] = monthMap.get(ym);
			}
		}
		data.put("months", months);
		data.put("nums", nums);
		
		return data;
	}
}
