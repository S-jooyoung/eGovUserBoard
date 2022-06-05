package egovframework.example.main.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.main.dao.BoardDAO;

@Service("boardService")
public class BoardServiceImpl implements BoardService{

	@Resource(name="boardDAO")
    private BoardDAO boardDAO;

	@Override
	public List<Map> getEmployeeList() {
		// TODO Auto-generated method stub
		return boardDAO.getEmployeeList();
	}

	@Override
	public void registEmployee(Map<String, Object> map) {
		// TODO Auto-generated method stub
		boardDAO.registEmployee(map);
	}

	@Override
	public void modifyEmployee(Map<String, Object> map) {
		// TODO Auto-generated method stub
		boardDAO.modifyEmployee(map);
	}
}


