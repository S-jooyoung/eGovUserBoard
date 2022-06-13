package egovframework.example.main.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("employeeMapper")
public interface EmployeeDAO {

	// 유저 목록
	List<HashMap> getEmployeeList(HashMap<String, Object> map);
	
	int getEmployeeCount();

	// 유저 정보 등록
	void registEmployee(HashMap<String, Object> map);

	// 유저 정보 수정
	void modifyEmployee(HashMap<String, Object> map);

	// 유저 상세정보
	HashMap<String, Object> getEmployeeDetail(Long empNo);

	// 유저 정보 삭제
	int deleteEmployee(Long empNo);

}
