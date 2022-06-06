package egovframework.example.main.service;

import java.util.HashMap;
import java.util.List;

public interface EmployeeService {

	List<HashMap> getEmployeeList(HashMap<String, Object> map);
	
	void registEmployee(HashMap<String, Object> map);
	
	void modifyEmployee(HashMap<String, Object> map);
	
	HashMap<String, Object> getEmployeeDetail(Long empIdx);
}
