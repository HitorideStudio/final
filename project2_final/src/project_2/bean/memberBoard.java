package project_2.bean;

import java.io.File;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import project.member.vo.memberBoardVO;

@Controller
@RequestMapping("/memberBoard/")
public class memberBoard {
	
	@Autowired
	private SqlSessionTemplate sql = null;
	
	@RequestMapping("write.do")
	public String write( Model model,String number) {
		model.addAttribute("number",number);
		return "/memberBoard/write";
	}
	
	@RequestMapping("writePro.do")
	public String writePro(MultipartHttpServletRequest request,String b_id, String b_content) throws Exception {
		MultipartFile mf = request.getFile("b_img");
		String path = request.getRealPath("imgs");
		String org = mf.getOriginalFilename();
		String b_img = org;
		File f = new File(path+"//"+b_img);
		
		mf.transferTo(f);
		b_img = "/project2_final/imgs/"+b_img;
		memberBoardVO vo = new memberBoardVO();
		vo.setB_id(b_id);
		vo.setB_img(b_img);
		vo.setB_content(b_content);
		
		System.out.println("======"+b_img);
		sql.insert("memberBoard.insertBoard",vo);
		return "/memberBoard/writePro";
	}
	
	
	
	
	
	
	
	

}
