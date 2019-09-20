package project_2.bean;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import project.list.vo.PlaceListVO;

@RestController
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
		
		
		ModelAndView model = new ModelAndView();
		List<PlaceListVO> list = sql.selectList("mapsql.searchplacelist",keyword);
		model.addObject("list", list);
		model.setViewName("/map/search");
		return model;
	}
	
	@RequestMapping("form.do")
	public ModelAndView form() {
		
		ModelAndView model = new ModelAndView();
		
		model.setViewName("/map/form");
		return model;
	}
	
	
	@RequestMapping(value="markerdata.do")
	public  @ResponseBody Object markerdata(HttpServletRequest request) {
		
		String keyword = request.getParameter("keyword");
		System.out.println("ajax data===>>"+keyword);
		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObject = new JSONObject();
		HashMap<String, Object> map = new HashMap<String , Object>();
		List<PlaceListVO> list =null;
		if(keyword!=null) {
			System.out.println(keyword);
			list = sql.selectList("mapsql.searchplacelist",keyword);
		
			for(PlaceListVO vo : list) {
				jsonObject.put("title", vo.getPlacename());
				jsonObject.put("latlng", "new kakao.maps.LatLng("+vo.getLat()+","+vo.getLon()+")");
				jsonObject.put("address",vo.getAddress());
				jsonObject.put("tel",vo.getTel());
				jsonObject.put("place",vo.getPlace());
				jsonArray.add(jsonObject);
			}
		}		
		System.out.println(jsonArray);
		
		return jsonArray;
	}
	
	@RequestMapping(value="test2.do")
	@ResponseBody
	public HashMap<String, Object> test(){
	    	HashMap<String, Object> map = new HashMap<String, Object>();
	    	map.put("1", "111");
	    	map.put("2", 222);
	    	return map;
	    }

}





