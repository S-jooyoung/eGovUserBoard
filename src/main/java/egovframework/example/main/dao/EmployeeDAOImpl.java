package egovframework.example.main.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("employeeDAO")
public class EmployeeDAOImpl implements EmployeeDAO {

	@Autowired
	private SqlSessionTemplate query;

	@Override
	public List<HashMap> getEmployeeList(HashMap<String, Object> map) {
		System.out.println("employeeListMapper");
		// TODO Auto-generated method stub
		return query.selectList("getEmployeeList", map);
	}

	@Override
	public void registEmployee(HashMap<String, Object> map) {
		System.out.println("employeeRegistMapper");
		// TODO Auto-generated method stub
		query.insert("registEmployee", map);
	}

	@Override
	public void modifyEmployee(HashMap<String, Object> map) {
		System.out.println("employeeModifyMapper");
		// TODO Auto-generated method stub
		query.update("modifyEmployee", map);
	}

	@Override
	public HashMap<String, Object> getEmployeeDetail(Long empNo) {
		System.out.println("employeeDetailMapper");
		// TODO Auto-generated method stub
		return query.selectOne("getEmployeeDetail", empNo);
	}

	@Override
	public int deleteEmployee(Long empNo) {
		System.out.println("employeeDeleteMapper");
		// TODO Auto-generated method stub
		return query.delete("deleteEmployee", empNo);
	}

}
