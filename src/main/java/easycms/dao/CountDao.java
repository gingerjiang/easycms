package easycms.dao;

import java.util.List;
import java.util.Map;

import easycms.obj.Subject;

public interface CountDao {

	
	List<Map<String, Object>> numSubjectCode();
	
	
	List<Subject> findSubject();
	
	
	List<Map<String, Object>> numMonth();
}
