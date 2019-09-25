package project_2.bean;

import java.io.File;
import java.io.IOException;


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
import org.springframework.web.servlet.ModelAndView;
import com.github.scribejava.core.model.OAuth2AccessToken;
import project.member.vo.memberVO;

@Controller
@RequestMapping("/signup/")
public class signup {
	private NaverLoginBO naverLoginBO;
	private String apiResult= null;
	
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}
	
	@Autowired
	private SqlSessionTemplate sql = null;
	//메인페이지
	@RequestMapping("main.do")
	public String main() {
		System.out.println(sql);
		return "/map/main";
	}
	
	
	//회원가입
	@RequestMapping("join.do")
	public String register() {
		System.out.println(sql);
		return "/signup/join";
	}
	
	@RequestMapping("joinPro.do")
	public String joinPro(MultipartHttpServletRequest request,String id, String pw, String name) throws Exception {
		MultipartFile mf = request.getFile("img");
		String path = request.getRealPath("imgs");
		String org = mf.getOriginalFilename();
		String ext = org.substring(org.lastIndexOf("."));
		String img = id+ext;
		File f = new File(path+"//"+img);
		
		mf.transferTo(f);
		img = "/project2_final/imgs/"+img;
		memberVO vo= new memberVO();
		vo.setId(id);
		vo.setPw(pw);
		vo.setName(name);
		vo.setImg(img);
		//mybatis insert실행
		System.out.println("======"+name);
		sql.insert("member2.insertMember",vo);
		
		return "/signup/joinPro";
	}
	//네이버로 가입
	@RequestMapping("joinPro2.do")
	public String joinPro2(memberVO vo) {
		sql.insert("member2.insertMember",vo);
		return "/signup/joinPro2";
	}
	
	//중복확인
	@RequestMapping("confirmId.do")
	public String confirmId(HttpServletRequest request, Model model){
		String id = request.getParameter("id");
		
		int check = (Integer)sql.selectOne("member2.confirmId",id);
		
		System.out.println(check);
		
		model.addAttribute("check",check);
		model.addAttribute("id",id);
		return "/signup/confirmId";
	}
	
	//로그인 네이버 추가 + 카카오로그인은 자바스크립트로 추가
	@RequestMapping("login.do")
	public String login(Model model,HttpSession session) {
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		System.out.println("네이버:"+naverAuthUrl);
		
		model.addAttribute("url",naverAuthUrl);
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
	//로그아웃
	@RequestMapping("logout.do")
	public String logout(HttpSession session, HttpServletRequest request) {
		session.invalidate();
		return "/signup/logout";
	}
	//테스트페이지==>삭제 예정
	@RequestMapping("testloginout.do")
	public String testloginout(HttpSession session,Model model) {
		String id = (String)session.getAttribute("memId");
		memberVO vo = (memberVO)sql.selectOne("member2.selectUser",id);
		model.addAttribute("vo",vo);
		return "/signup/testloginout";
	}
	//회원정보 수정
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
			img = "/project2_final/imgs/"+img;
			vo.setImg(img);
		}
		sql.update("member2.updateModify",vo);
		return "/signup/modifyPro";
	}
	//회원정보 삭제
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
	
	//네이버로 사용자 값 받아오는 로직
	@RequestMapping("callback.do")
	public String callback(Model model,@RequestParam String code, @RequestParam String state, HttpSession session,memberVO vo) throws IOException{
		System.out.println("여기는 signup callback");
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state);
		// 로그인 사용자 정보 읽어오기
		apiResult = naverLoginBO.getUserProfile(oauthToken);
		model.addAttribute("result",apiResult);
		
		return "/signup/naverSuccess";
	}
	//네이버아이디로 회원가입 및 로그인 
		@RequestMapping("CheckSocial.do")
		public String CheckSocial(memberVO vo,Model model,HttpSession session) {
			int check = (Integer)sql.selectOne("member2.confirmId",vo.getId());
			session.setAttribute("social", "1");
			model.addAttribute("check",check);
			model.addAttribute("vo",vo);
			return "/signup/CheckSocial";
	
		}
	
	
	
}