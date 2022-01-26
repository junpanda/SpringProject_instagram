package com.junpanda.instagram.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {
	
	@GetMapping("/main/view")
	public String mainview() {
		return "main/mainview";
	}

}
