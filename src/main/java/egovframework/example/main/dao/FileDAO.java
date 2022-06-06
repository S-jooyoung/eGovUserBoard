package egovframework.example.main.dao;

import java.util.HashMap;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("fileMapper")
public interface FileDAO {
	void registFile(HashMap<String, Object> map);
}
