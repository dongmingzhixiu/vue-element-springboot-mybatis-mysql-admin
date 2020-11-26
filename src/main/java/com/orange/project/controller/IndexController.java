package com.orange.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * describe:
 * author:jpw
 * Date:2020/9/5
 * Time:15:27
 * @author Administrator
 */

@Controller
public class IndexController {

	@RequestMapping("/")
	public String test() {
		return "index";
	}
}

