package com.example.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.util.Alpha;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class RectController {

	// AJAX(Asyncronous Javascript And XML)
//	@GetMapping("/ajax")
	void ajax(Model model) {
		
		var rect = new ArrayList<ArrayList<Alpha>>();
		
		for (var i=0; i<20; i++) {
			rect.add(new ArrayList<Alpha>());
			for (var j=0; j<40; j++) {
				rect.get(i).add(new Alpha());
			}
		}
		
		model.addAttribute("surface", rect);
	}
	
	@Autowired
	ObjectMapper json;
	
//	@GetMapping("/alpha")
	@ResponseBody
	Alpha generator() throws InterruptedException {
		System.out.println("generator()...");
		Thread.sleep(10000);
		return new Alpha();
	}
//	String generator() throws JsonProcessingException {
//		return json.writeValueAsString(new Alpha());
//	}
	
	
	
	
	
}
