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
	public List<Map> getBoards() {
		// TODO Auto-generated method stub
		return boardDAO.getBoards();
	}

	
	
	

}


