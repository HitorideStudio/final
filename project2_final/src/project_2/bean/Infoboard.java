package project_2.bean;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/infoboard/")
public class Infoboard {
	
	
	@RequestMapping("/writeForm/")
	public ModelAndView writeForm(String place,String placename,String address) {
		ModelAndView model = new ModelAndView();
		model.addObject("place",place);
		model.addObject("placename",placename);
		model.addObject("address",address);
		model.setViewName("/infoboard/writeForm");
		return model;
	}
	
}
