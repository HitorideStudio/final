package project_2.bean;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import project.list.vo.PlaceList;
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
	private String info() {
		
		return "/finder/info";
	}

}
