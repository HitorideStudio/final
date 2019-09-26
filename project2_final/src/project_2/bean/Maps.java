package project_2.bean;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import project.list.vo.FavoVO;
import project.list.vo.PlaceListVO;
import project.member.vo.memberVO;

@Controller
@RequestMapping("/map/")
public class Maps {
	
	//my batis db
		@Autowired
		private SqlSessionTemplate sql = null;
		
	
	//main
	@RequestMapping("welcome.do")
	public ModelAndView welcome(HttpSession session) {
		
		ModelAndView model = new ModelAndView();
		
		String id = (String)session.getAttribute("memId");
		
		List<PlaceListVO> list = sql.selectList("mapsql.searchplacelist");
		System.out.println(list);
		model.addObject("list",list);

		model.setViewName("welcome");
			
		return model;		
	}
	
	//클러스터적용 do
	@RequestMapping("cluster.do")
	public ModelAndView cluster(HttpSession session) {
		String id = (String)session.getAttribute("memId");
		ModelAndView model = new ModelAndView();
		model.setViewName("/map/cluster");
		return model;
		
	}
	
	//search	
	@RequestMapping(value="search.do")
	public ModelAndView search() {
		
		ModelAndView model = new ModelAndView();
	
		model.setViewName("/map/search");
		return model;
	}

	
	@RequestMapping(value="markerdata.do",  produces = "application/json")
	public @ResponseBody List<PlaceListVO> markerdata(@RequestParam(value="keyword", required=false) String keyword) {
		
		
		List<PlaceListVO> list =null;
		if(keyword!=null) {
			System.out.println(keyword);
			list = sql.selectList("mapsql.searchplacelist",keyword);
		}	

		return list;
	}
	

	
	@RequestMapping(value="dataAll.do",  produces = "application/json")
	public @ResponseBody List<PlaceListVO> dataAll() {
		
			List<PlaceListVO> list =null;
			list = sql.selectList("mapsql.searchplacelist");
		
		return list;
	}
	
	@RequestMapping("wishlist.do")
	   public String wishlist(HttpSession session,Model model,String id,String no,FavoVO vo,memberVO vo2) {
	      Date date = new Date();
	      id = (String)session.getAttribute("memId");
	      vo = new FavoVO();
	      vo.setDate(date);
	      vo.setMember_id(id);
	      vo.setInfo_id(no);
	      vo.setFavo_id(1);
	      System.out.println(id);
	      System.out.println(no);
	      int num = (Integer)sql.selectOne("mapsql.wishcheck",vo);
	      System.out.println(num);
	       if(num == 0) {
	         sql.insert("mapsql.wishadd",vo);
	         System.out.println("이제 너는 나의 favorite.");
	      }else {
	         sql.delete("mapsql.deletewish",vo);
	         System.out.println("우리 이제 헤어지자.");
	      }
	       List favolist = sql.selectList("mapsql.wishrem",vo);
	       System.out.println(num);
	       System.out.println(favolist);
	       model.addAttribute("num",num); 
	       model.addAttribute("vo",vo); 
	       model.addAttribute("no",no);
	       model.addAttribute("favolist",favolist); 
	       return "/map/wishlist";
	   }
	
	 @RequestMapping("del.do")
	   public String del(HttpSession session,String id,String num) {
	      id = (String)session.getAttribute("memId");
	      FavoVO vo = new FavoVO();
	      vo.setMember_id(id);
	      vo.setInfo_id(num);
	      System.out.println(num);
	      sql.delete("mapsql.deletewish",vo);
	      return "/map/wishlist";
	   }
}