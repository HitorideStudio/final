package project_2.bean;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/infoboard/")
public class Infoboard {
	
	@Autowired
	ModelAndView model = new ModelAndView();
	
	@RequestMapping("/writeForm/")
	public ModelAndView writeForm() {
		
		return model;
	}
}
