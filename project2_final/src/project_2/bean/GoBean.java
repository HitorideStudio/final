package project_2.bean;

import java.util.List;



import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import project.list.vo.PlaceListVO;
import project.member.vo.memberVO;


@Controller
@RequestMapping("/finder/")
public class GoBean {
	
	//my batis db
	@Autowired
	private SqlSessionTemplate sql = null;
	
	@RequestMapping("main.do")
	public String main() {
		
		return "/finder/main";
	}
	
	@RequestMapping("info.do")
	private ModelAndView info(String place,String placename,String address) {
		ModelAndView model = new ModelAndView();
		model.addObject("place",place);
		model.addObject("placename",placename);
		model.addObject("address",address);
		model.setViewName("/finder/info");
		return model;
	}

}
