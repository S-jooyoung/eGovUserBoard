package egovframework.example.main.service;

import java.io.IOException;
import java.util.HashMap;

import org.springframework.web.multipart.MultipartFile;

public interface FileService {
	HashMap<String, Object> uploadForm(MultipartFile file) throws Exception;
	
	Object registFile(HashMap<String, Object> map);
}
