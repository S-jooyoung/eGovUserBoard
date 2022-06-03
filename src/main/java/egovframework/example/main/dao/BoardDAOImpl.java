package egovframework.example.main.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("boardDAO")
public class BoardDAOImpl implements BoardDAO {

	

	@Autowired
	private SqlSessionTemplate query;
	
	
	@Override
	public List<Map> getBoards() {
		// TODO Auto-generated method stub
		return query.selectList("getBoards");
	}

}
