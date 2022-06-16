package egovframework.example.main.service;

import java.util.HashMap;
import java.util.List;


public interface EmployeeService {

	List<HashMap<String, Object>> getEmployeeList(HashMap<String, Object> map);
	
	int getEmployeeCount();

	void registEmployee(HashMap<String, Object> param) throws Exception;

	void modifyEmployee(HashMap<String, Object> map) throws Exception;

	HashMap<String, Object> getEmployeeDetail(Long empNo);

	int deleteEmployee(Long empNo);

}
