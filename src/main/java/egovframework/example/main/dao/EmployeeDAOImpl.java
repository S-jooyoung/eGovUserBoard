package egovframework.example.main.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("employeeDAO")
public class EmployeeDAOImpl implements EmployeeDAO {

	@Autowired
	private SqlSessionTemplate query;

	@Override
	public List<HashMap<String, Object>> getEmployeeList(HashMap<String, Object> map) {

		return query.selectList("getEmployeeList", map);
	}

	@Override
	public int getEmployeeCount() {

		return query.selectOne("getEmployeeCount");
	}

	@Override
	public void registEmployee(HashMap<String, Object> map) {

		query.insert("registEmployee", map);
	}

	@Override
	public void modifyEmployee(HashMap<String, Object> map) {

		query.update("modifyEmployee", map);
	}

	@Override
	public HashMap<String, Object> getEmployeeDetail(Long empNo) {

		return query.selectOne("getEmployeeDetail", empNo);
	}

	@Override
	public int deleteEmployee(Long empNo) {

		return query.delete("deleteEmployee", empNo);
	}

}
