package egovframework.example.main.service;

import java.util.HashMap;
import java.util.List;

public interface EmployeeService {

	List<HashMap> getEmployeeList(HashMap<String, Object> map);

	void registEmployee(HashMap<String, Object> map) throws Exception;

	void modifyEmployee(HashMap<String, Object> map) throws Exception;

	HashMap<String, Object> getEmployeeDetail(Long empNo);

	int deleteEmployee(Long empNo);

}
