package egovframework.example.main.dao;

import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("boardMapper")
public interface BoardDAO {
	
	List<Map> getEmployeeList();
	
	void registEmployee(Map<String, Object> map);
	
	void modifyEmployee(Map<String, Object> map);
}
