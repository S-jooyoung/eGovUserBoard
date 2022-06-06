package egovframework.example.main.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("boardDAO")
public class BoardDAOImpl implements BoardDAO {

	@Autowired
	private SqlSessionTemplate query;
	
	@Override
	public List<Map> getEmployeeList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return query.selectList("getEmployeeList", map);
	}

	@Override
	public void registEmployee(Map<String, Object> map) {
		// TODO Auto-generated method stub
		query.insert("registEmployee", map);
	}

	@Override
	public void modifyEmployee(Map<String, Object> map) {
		// TODO Auto-generated method stub
		query.update("modifyEmployee", map);
	}

}
