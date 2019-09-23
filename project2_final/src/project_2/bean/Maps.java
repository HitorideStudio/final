package project_2.bean;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import project.list.vo.PlaceListVO;

@Controller
@RequestMapping("/map/")
public class Maps {
	
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
	
	@RequestMapping(value="korr.do")
	public String korr() {
		return "/map/korr";
	}

}