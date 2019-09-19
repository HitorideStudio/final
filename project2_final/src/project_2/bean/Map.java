package project_2.bean;

import java.util.List;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import project.list.vo.PlaceListVO;

@Controller
@RequestMapping("/map/")
public class Map {
	
	//my batis db
		@Autowired
		private SqlSessionTemplate sql = null;
		
	
	//main
	@RequestMapping("welcome.do")
	public ModelAndView welcome() {
		
		ModelAndView model = new ModelAndView();
		
		List<PlaceListVO> list = sql.selectList("mapsql.searchplacelist");

		model.addObject("list",list);

		model.setViewName("welcome");
			
		return model;		
	}
	
	//클러스터적용 do
	@RequestMapping("cluster.do")
	public ModelAndView cluster() {
		ModelAndView model = new ModelAndView();
		model.setViewName("/map/cluster");
		return model;
		
	}
	
	//search
	
	@RequestMapping(value="search.do",method = RequestMethod.GET)
	public ModelAndView search(@RequestParam(value="keyword", required=false) String keyword) {
		
		System.out.println(keyword);
		ModelAndView model = new ModelAndView();
	
		List<PlaceListVO> list = sql.selectList("mapsql.searchplacelist",keyword);
		model.addObject("list",list);
		
		model.setViewName("/map/search");
		return model;
	}
	
	@RequestMapping("form.do")
	public ModelAndView form() {
		
		ModelAndView model = new ModelAndView();
		
		model.setViewName("/map/form");
		return model;
	}
	
	

}





