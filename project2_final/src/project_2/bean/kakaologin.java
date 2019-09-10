package project_2.bean;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/log/")

public class kakaologin {
	
	@RequestMapping("login.do")
	public String login() {
		
		return "/log/login_k";
	}
	@RequestMapping("loginPro_k.do")
	public String loginPro_k(@RequestParam("code")String code) {
		System.out.println("code:"+code);
		
		return "/log/loginPro_k";
	}
	

		  
}
