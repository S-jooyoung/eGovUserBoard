package egovframework.example.main.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.example.main.api.PapagoAPI;


@Service("PapagoService")
public class PapagoServiceImpl implements PapagoService {

	@Autowired
	private PapagoAPI papagoAPI;
	
	@Override
	public String getPaPagoResult(HashMap<String, Object> map) {
		System.out.println("translationService");
		// TODO Auto-generated method stub
		return papagoAPI.getResult(map);
	}

}
