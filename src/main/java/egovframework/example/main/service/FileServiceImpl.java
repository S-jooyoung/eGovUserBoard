package egovframework.example.main.service;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.UUID;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import egovframework.example.main.dao.FileDAO;

@Service("fileService")
public class FileServiceImpl implements FileService {

	@Resource(name="fileDAO")
    private FileDAO fileDAO;
	
	private final static String absolutePath = "C:\\upload\\";
	
	private final static String path = absolutePath + "temp\\";
	
	@PostConstruct
	public void initIt() {
		System.out.println("Init method after properties are set : " + path);
	  try {
		  Path tempPath = Path.of(path);
		  if(!Files.exists(tempPath)) {
              Files.createDirectories(tempPath);
              System.out.println("Create Init Temp Folder");
		  }
	  } catch (IOException e) {
		  e.printStackTrace();
	  }
	}

	@Override
	public HashMap<String, Object> uploadForm(MultipartFile file) throws Exception {
		// TODO Auto-generated method stub
		String originalName = transSetEncoder(file.getOriginalFilename());
		Long fileSize = file.getSize();
		String contentType = file.getContentType();
		String savedName = getSavedName(originalName);
		String filePath = uploadFile(savedName, file.getBytes());
		
		System.out.println("originalName : " + originalName);
		System.out.println("fileSize : " + fileSize);
		System.out.println("contentType : " + contentType);
		System.out.println("savedName : " + savedName);
		System.out.println("filePath : " + filePath);

		HashMap<String, Object> map = new HashMap();
		map.put("originalName", originalName);
		map.put("fileSize", fileSize);
		map.put("contentType", contentType);
		map.put("savedName", savedName);
		map.put("filePath", filePath);
		
		Path localFilePath = Paths.get(filePath);
		System.out.println("localFilePath : " + localFilePath);

		return map;
	}

	@Override
	public Object registFile(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		fileDAO.registFile(map);
		return map.get("filePath");
	}
	
	private String getSavedName(String originalName) {
		UUID uid = UUID.randomUUID();
		String savedName = uid.toString() + "_" + originalName;
		return savedName;
	}
	
	private String uploadFile(String savedName, byte[] fileData) throws IOException {
		String filePath = savedName;
		File target = new File(path, savedName);
		FileCopyUtils.copy(fileData, target);
		return filePath;
	}
	
	private String transSetEncoder(String param) throws UnsupportedEncodingException {
		return new String(param.getBytes("8859_1"), "utf-8");
	}
}
