package egovframework.example.main.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("fileDAO")
public class FileDAOImpl implements FileDAO {
	
	@Autowired
	private SqlSessionTemplate query;
	
	@Override
	public void registFile(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		query.insert("registFile", map);
	}

}
