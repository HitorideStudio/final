package project_2.bean;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import project.list.vo.FavoVO;
import project.list.vo.PlaceListVO;
import project.member.vo.memberVO;

@Controller
@RequestMapping("/map/")
public class Map {
   
   //my batis db
      @Autowired
      private SqlSessionTemplate sql = null;
      
   
   //main
   @RequestMapping("welcome.do")
   public ModelAndView welcome(String id,HttpSession session,String tel) {
      
      ModelAndView model = new ModelAndView();
   
      id = (String)session.getAttribute("memId");
   
      System.out.println(id);
      
      List<PlaceListVO> list = sql.selectList("mapsql.searchplacelist");

      model.addObject("list",list);
      model.addObject("tel",tel);
      model.setViewName("welcome");
      return model;      
   }
   
   //클러스터적용 do
   @RequestMapping("cluster.do")
   public String cluster(HttpSession session,Model model,String id,String tel) {
      
      id = (String)session.getAttribute("memId");
      
      System.out.println("11.");
      model.addAttribute("tel",tel);
       return "/map/cluster";
      
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
   //search
   
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
   
   
   
   @RequestMapping(value="search.do",method = RequestMethod.GET)
   public ModelAndView search(@RequestParam(value="keyword", required=false) String keyword) {
      
      
      ModelAndView model = new ModelAndView();
      
      model.setViewName("/map/search");
      return model;
   }
   
   @RequestMapping("form.do")
   public ModelAndView form() {
      
      ModelAndView model = new ModelAndView();
      
      model.setViewName("/map/form");
      return model;
   }
   
   @RequestMapping(value="markerdata.do",method = RequestMethod.POST)
   public ModelAndView markerdata(@RequestParam(value="keyword", required=false) String keyword) {
      int i;
      List Address = new ArrayList();
      ModelAndView model = new ModelAndView();
      System.out.println(keyword);
      if(keyword!=null) {
      List<PlaceListVO> list = sql.selectList("mapsql.searchplacelist",keyword);
      
      for(PlaceListVO vo : list) {
      System.out.println(vo.getAddress());
         Address.add(vo.getAddress());
      }
      System.out.println(Address);
      model.addObject("list",list);
      }else {
         List<PlaceListVO> list = sql.selectList("mapsql.searchplacelist");
         model.addObject("list",list);   
      }
      model.setViewName("/map/markerdata");
      return model;
   }
   

}