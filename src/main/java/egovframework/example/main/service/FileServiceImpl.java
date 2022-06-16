package egovframework.example.main.service;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.nio.file.Files;
import java.nio.file.Path;
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

	@Resource(name = "fileDAO")
	private FileDAO fileDAO;

	private final static String absolutePath = "C:\\upload\\";

	private final static String path = absolutePath + "temp\\";

	/*
	 * @PostConstruct public void initIt() {
	 * 
	 * try { Path tempPath = Path.of(path); if (!Files.exists(tempPath)) {
	 * Files.createDirectories(tempPath);
	 * 
	 * } } catch (IOException e) { e.printStackTrace(); } }
	 */

	@Override
	public HashMap<String, Object> uploadForm(MultipartFile file) throws Exception {

		String originalName = transSetEncoder(file.getOriginalFilename());
		Long fileSize = file.getSize();
		String contentType = file.getContentType();
		String savedName = getSavedName(originalName);
		String filePath = uploadFile(savedName, file.getBytes());
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("originalName", originalName);
		map.put("fileSize", fileSize);
		map.put("contentType", contentType);
		map.put("savedName", savedName);
		map.put("filePath", filePath);

		return map;
	}

	@Override
	public Object registFile(HashMap<String, Object> map) {
		fileDAO.registFile(map);
		return map.get("filePath");
	}

	private String getSavedName(String originalName) {
		UUID uid = UUID.randomUUID();
		return uid.toString() + "_" + originalName;
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
