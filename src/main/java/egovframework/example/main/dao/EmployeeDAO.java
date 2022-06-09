package egovframework.example.main.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("employeeMapper")
public interface EmployeeDAO {
	
	List<HashMap> getEmployeeList(HashMap<String, Object> map);
	
	void registEmployee(HashMap<String, Object> map);
	
	void modifyEmployee(HashMap<String, Object> map);
	
	HashMap<String, Object> getEmployeeDetail(Long empNo);

	int deleteEmployee(Long empNo);
}
