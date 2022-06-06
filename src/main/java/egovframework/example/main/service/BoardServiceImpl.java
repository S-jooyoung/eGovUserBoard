package egovframework.example.main.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.main.dao.BoardDAO;

@Service("boardService")
public class BoardServiceImpl implements BoardService{
	
	private final static String absolutePath = new File("").getAbsolutePath() + "\\";
	
//	private final static Path path = Path.of(absolutePath + "/temp");
//	
//	@PostConstruct
//	public void initIt() {
//		System.out.println("Init method after properties are set : " + path);
//	  try {
//		  if(!Files.exists(path)) {
//              Files.createDirectories(path);
//              System.out.println("Create Init Temp Folder");
//		  }
//	  } catch (IOException e) {
//		  e.printStackTrace();
//	  }
//	}

	@Resource(name="boardDAO")
    private BoardDAO boardDAO;

	@Override
	public List<Map> getEmployeeList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return boardDAO.getEmployeeList(map);
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


