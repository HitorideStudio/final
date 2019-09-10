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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import project.member.vo.memberVO;

@Controller
@RequestMapping("/signup/")
public class signup {
	
	@Autowired
	private SqlSessionTemplate sql = null;
	
	@RequestMapping("join.do")
	public String register() {
		System.out.println(sql);
		return "/signup/join";
	}
	
	@RequestMapping("joinPro.do")
	public String joinPro(MultipartHttpServletRequest request,String id, String pw, String name) {
	
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
		memberVO vo= new memberVO();
		vo.setId(id);
		vo.setPw(pw);
		vo.setName(name);
		vo.setImg(img);
		//mybatis insert½ÇÇà
		System.out.println("======"+name);
		sql.insert("member2.insertMember",vo);
		
		return "/signup/joinPro";
	}
	@RequestMapping("confirmId.do")
	public String confirmId(HttpServletRequest request, Model model){
		String id = request.getParameter("id");
		
		int check = (Integer)sql.selectOne("member2.confirmId",id);
		
		System.out.println(check);
		
		model.addAttribute("check",check);
		model.addAttribute("id",id);
		return "/signup/confirmId";
	}
	
	@RequestMapping("login.do")
	public String login() {
		return "/signup/login";
	}
	@RequestMapping("loginPro.do")
	public String loginPro(memberVO vo, HttpSession session,Model model) {
		System.out.println(vo.getId());
		System.out.println(vo.getPw());
		int c = (Integer)sql.selectOne("member2.loginCheck",vo);
		System.out.println(c);
		if(c==1) {
			session.setAttribute("memId", vo.getId());
		}
		model.addAttribute("c",c);
		return "/signup/loginPro";	
	}
	@RequestMapping("logout.do")
	public String logout(HttpSession session, HttpServletRequest request) {
		session.invalidate();
		return "/signup/logout";
	}
	@RequestMapping("testloginout.do")
	public String testloginout(HttpSession session,Model model) {
		String id = (String)session.getAttribute("memId");
		memberVO vo = (memberVO)sql.selectOne("member2.selectUser",id);
		model.addAttribute("vo",vo);
		return "/signup/testloginout";
	}
	@RequestMapping("modify.do")
	public String modify(HttpSession session, Model model) {
		String id = (String)session.getAttribute("memId");
		memberVO vo = (memberVO)sql.selectOne("member2.selectUser",id);
		model.addAttribute("vo",vo);
		return "/signup/modify";
	}
	@RequestMapping("modifyPro.do")
	public String modifyPro(MultipartHttpServletRequest request, HttpSession session,
			Model model, String name, String pw, String org) {
		String id = (String)session.getAttribute("memId");
		MultipartFile mf = request.getFile("img");
		String orgname = mf.getOriginalFilename();
		
		memberVO vo = new memberVO();
		vo.setName(name);
		vo.setPw(pw);
		vo.setId(id);
		if(orgname.equals("")) {
			vo.setImg(org);
		}else {
			String path = request.getRealPath("imgs");
			String ext = org.substring(org.lastIndexOf("."));
			String img = id+ext;
			File f = new File(path+"//"+img);
			try {
				mf.transferTo(f);
			}catch(Exception e) {
				e.printStackTrace();
			}
			vo.setImg(img);
		}
		sql.update("member2.updateModify",vo);
		return "/signup/modifyPro";
	}
	@RequestMapping("delete.do")
	public String delete() {
		return "/signup/delete";
	}
	@RequestMapping("deletePro.do")
	public String deletePro(HttpServletRequest request, HttpSession session, Model model, String pw) {
		String id = (String)session.getAttribute("memId");
		String path = request.getRealPath("imgs");
		memberVO vo = (memberVO)sql.selectOne("member2.selectUser",id);
		int check = -1;
		String pass = sql.selectOne("member2.deletePro",id);
		if(pw.equals(pass)) {
			File f = new File(path+"//"+vo.getImg());
			f.delete();
			sql.delete("member2.deletePro2",id);
			check = 1;
			session.invalidate();
		}
		model.addAttribute("check",check);
		return "/signup/deletePro";
	}
	
	
	
	
	
	
	
	
	
}