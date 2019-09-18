package project_2.bean;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.github.scribejava.core.model.OAuth2AccessToken;
import project.member.vo.memberVO;
@Controller
@RequestMapping("/member/")
public class LoginController {
	private NaverLoginBO naverLoginBO;
	private String apiResult= null;
	
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}
	
	@RequestMapping("index.do")
	public String index() {
		return "/member/index";
	}
	
	//���̹� �α��� ù ȭ�� ��û �޼ҵ�
	@RequestMapping("login.do")
	public String login(Model model,HttpSession session) {
		/*���̹����̵�� ���� URL�� �����ϱ� ���� naverLoginDOŬ������ getAuthorizationUrl�޼ҵ� ȣ��*/
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		System.out.println("���̹�:"+naverAuthUrl);
		
		model.addAttribute("url",naverAuthUrl);
		return "/member/login";
	}
	
	//ȸ������
		@RequestMapping("sign.do")
		public String sign(Model model,HttpSession session) {
			
			//model.addAttribute("url",naverAuthUrl);
			return "/member/login";
		}
	
	@RequestMapping("callback.do")
	public String callback(Model model,@RequestParam String code, @RequestParam String state, HttpSession session,memberVO vo) throws IOException{
		System.out.println("����� callback");
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state);
		// �α��� ����� ���� �о����
		apiResult = naverLoginBO.getUserProfile(oauthToken);
		model.addAttribute("result",apiResult);
		
		return "/member/naverSuccess";
	}
}
