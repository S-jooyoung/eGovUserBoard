package egovframework.example.main.service;

import java.util.List;
import java.util.Map;

public interface BoardService {

	List<Map> getEmployeeList();
	
	void registEmployee(Map<String, Object> map);
	
	void modifyEmployee(Map<String, Object> map);
}
