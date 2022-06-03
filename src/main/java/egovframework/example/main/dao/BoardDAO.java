package egovframework.example.main.dao;

import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.mapper.Mapper;




@Mapper("boardMapper")
public interface BoardDAO {
	
	List<Map> getBoards();
}
