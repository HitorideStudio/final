package project_2.bean;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/test/")
public class Testsam {

	@RequestMapping("korr.do")
	public String korr() {
		
		return "/map/korr";
	}

}
