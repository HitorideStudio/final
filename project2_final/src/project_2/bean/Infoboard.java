package project_2.bean;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import project.list.vo.InfoboardVO;

@Controller
@RequestMapping("/infoboard/")
public class Infoboard {
	@Autowired
	private SqlSessionTemplate sql = null;
	
	@RequestMapping("writeForm")
	public ModelAndView writeForm(String place,String placename,String number) {
		ModelAndView model = new ModelAndView();
		model.addObject("place",place);
		model.addObject("placename",placename);
		model.addObject("number",number);
		model.setViewName("/infoboard/writeForm");
		return model;
	}
	
	@RequestMapping("writePro.do")
	public String writePro(MultipartHttpServletRequest request,String i_shop,
			String i_id,String i_content, String i_placename,Model model) throws Exception{
		
		MultipartFile mf =null;
		
		String i_img = "notpicture";
		
		if(mf!=null) {
		mf = request.getFile("i_img");
		
		String path = request.getRealPath("imgs");
		String org = mf.getOriginalFilename();
		i_img = org;
		File f = new File(path+"//"+i_img);
		
		mf.transferTo(f);
		i_img = "/project2_final/imgs/"+i_img;
		}
	
		
		InfoboardVO vo = new InfoboardVO();
		vo.setI_id(i_id);
		vo.setI_shop(i_shop);
		vo.setI_content(i_content);
		vo.setI_img(i_img);
		vo.setI_placename(i_placename);
		
		sql.insert("infoboard.write",vo);
		model.addAttribute("i_img",i_img);
		
		
		return "/infoboard/writePro";
	}
	
}
