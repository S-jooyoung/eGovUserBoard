package egovframework.example.main.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.example.main.api.PapagoAPI;

@Service("PapagoService")
public class PapagoServiceImpl implements PapagoService {

	@Autowired
	private PapagoAPI papagoAPI;

	@Override
	public String getPaPagoResult(HashMap<String, Object> map) {

		return papagoAPI.getResult(map);
	}

}
