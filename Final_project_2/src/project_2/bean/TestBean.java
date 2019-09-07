package project_2.bean;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import project.list.vo.TestVO;

@Controller
@RequestMapping("/test/")


public class TestBean {
	
	@Autowired
	private SqlSessionTemplate sql = null;
	
	@RequestMapping("form.do")
	public String form() {
		System.out.println(sql);
		return "/test/form";
	}
	@RequestMapping("formPro.do")
	public String formPro(MultipartHttpServletRequest request, String id, String pw, int age, String name) {
		System.out.println(id);
		MultipartFile mf = request.getFile("img");
		String path = request.getRealPath("imgs");
		String org = mf.getOriginalFilename();
		String ext = org.substring(org.lastIndexOf("."));
		String img = id+ext;
		File f = new File(path+"//"+img);
		try {
			mf.transferTo(f);
		}catch(Exception e) {
			e.printStackTrace();
		}
		TestVO vo= new TestVO();
		vo.setAge(age);
		vo.setId(id);
		vo.setImg(img);
		vo.setPw(pw);
		vo.setName(name);
		//mybatis insert½ÇÇà
		sql.insert("test.insertTest",vo);
		
		
		
		return "/test/formPro";
	}
	@RequestMapping("main.do")
	public String loginMain(HttpSession session, Model model) {
		String id = (String)session.getAttribute("memId");
		TestVO vo = (TestVO)sql.selectOne("test.selectUser",id);
		model.addAttribute("vo", vo);
		return "/test/main";
	}
	@RequestMapping("loginForm.do")
	public String Form() {
		
		return "/test/loginForm";
	}
	@RequestMapping("loginPro.do")
	public String Pro(TestVO vo, HttpSession session, Model model) {
		int c= (Integer)sql.selectOne("test.loginCheck", vo);
		if(c==1) {
			session.setAttribute("memId", vo.getId());
		}
		model.addAttribute("c",c);
		
		return "/test/loginPro";
	}
	@RequestMapping("logout.do")
	public String logout(HttpSession session, HttpServletRequest request) {
		session.invalidate();
		return "/test/logout";
	}
	
	@RequestMapping("modifyForm.do")
	public String loginmodifyForm(HttpSession session, Model model) {
		String id = (String)session.getAttribute("memId");
		TestVO vo = (TestVO)sql.selectOne("test.selectUser",id);
		model.addAttribute("vo", vo);
		return "/test/modifyForm";
	}
	@RequestMapping("modifyPro.do")
	public String loginmodifyPro(MultipartHttpServletRequest request ,HttpSession session, Model model,
			 String pw, String name, int age, String org) {
		String id = (String)session.getAttribute("memId");
	      MultipartFile mf = request.getFile("img");
	      String orgname = mf.getOriginalFilename();
	      
	      TestVO vo = new TestVO();
	      vo.setAge(age);
	      vo.setName(name);
	      vo.setPw(pw);
	      vo.setId(id);
	      if(orgname.equals("")) {
	         vo.setImg(org);
	      }else {
	         String path= request.getRealPath("imgs");
	         String ext = org.substring(org.lastIndexOf("."));
	         String img = id+ext;
	         File f = new File(path+"//"+ img);
	         try {
	            mf.transferTo(f);
	         } catch (Exception e) {
	            // TODO: handle exception
	            e.printStackTrace();
	         }
	         vo.setImg(img);
	      }
	      sql.update("test.updateModify",vo);
	      return "/test/modifyPro";
	}
	
	@RequestMapping("deleteForm.do")
	public String loginDeleteForm() {
		return "/test/deleteForm";
	}
	@RequestMapping("deletePro.do")
	public String logdeletePro(HttpServletRequest request, HttpSession session, Model model, String pw) {
		String id = (String)session.getAttribute("memId");
		String path =request.getRealPath("imgs");
		TestVO vo = (TestVO)sql.selectOne("test.selectUser",id); 
		int check=-1;
		String pass= sql.selectOne("test.deletePro",id);
		if(pw.equals(pass)) {
			File f = new File(path+"//" +vo.getImg());
			f.delete();
			sql.delete("test.deletePro2",id);
			check=1;
			session.invalidate();
			
		}
		model.addAttribute("check",check);
		
	
		return "/test/deletePro";
	}
	

}
