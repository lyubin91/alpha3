package com.example.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.mapper.CityMapper;
import com.example.model.City;


@Controller
@RequestMapping("/city")
public class CityController {
	
	@Autowired
	CityMapper mapper;
	
//	static Logger log = LoggerFactory.getLogger(CityController.class);
//	@GetMapping("/list")
	String list2(String code, Model model) {
		
		List<City> list = null;
		if (code==null || code.trim().equals(""))
			list = mapper.selectAll();
		else 
			
			list = mapper.selectAllByCode(code);
		
		model.addAttribute("list", list);
		
		var codes = mapper.selectCountryCodes();
		model.addAttribute("codes", codes);
		
		return "city/list3";
	}
	
	
	@GetMapping("/list")
	String list(String code,Long population, Model model) {
	
		var list = mapper.searchAll(code, population);
		
		model.addAttribute("list", list);
		
		var codes = mapper.selectCountryCodes();
		model.addAttribute("codes", codes);
		
		return "city/list3";
	}
}
