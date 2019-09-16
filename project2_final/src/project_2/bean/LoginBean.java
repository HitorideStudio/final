package project_2.bean;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.security.SecureRandom;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
@Controller
@RequestMapping("/ex/")
public class LoginBean {
	
	@RequestMapping("log.do")
	public String Log(HttpSession session) throws Throwable {
		   String clientId = "La0RtXyOJUt4BaBYv2rD";//애플리케이션 클라이언트 아이디값";
		    String redirectURI = URLEncoder.encode("http://localhost:8080/project2_final/ex/callback.do", "UTF-8");
		    SecureRandom random = new SecureRandom();
		    String state = new BigInteger(130, random).toString();
		    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
		    apiURL += "&client_id=" + clientId;
		    apiURL += "&redirect_uri=" + redirectURI;
		    apiURL += "&state=" + state;
		    session.setAttribute("state", state);
		    session.setAttribute("apiURL", apiURL);
		return "/log/naverlogin";
	}
	
	@RequestMapping("callback.do")
	public String Callback(HttpServletRequest request, HttpSession session,Model model) throws Throwable {
	    String clientId = "La0RtXyOJUt4BaBYv2rD";//애플리케이션 클라이언트 아이디값";
	    String clientSecret = "jJKnkNO4Yr";//애플리케이션 클라이언트 시크릿값";
	    String code = request.getParameter("code");
	    String state = request.getParameter("state");
	    String redirectURI = URLEncoder.encode("http://localhost:8080", "UTF-8");
	    String apiURL;
	    apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
	    apiURL += "client_id=" + clientId;
	    apiURL += "&client_secret=" + clientSecret;
	    apiURL += "&redirect_uri=" + redirectURI;
	    apiURL += "&code=" + code;
	    apiURL += "&state=" + state;
	    String access_token = "";
	    String refresh_token = "";
	    System.out.println("apiURL="+apiURL);
	    try {
	      URL url = new URL(apiURL);
	      HttpURLConnection con = (HttpURLConnection)url.openConnection();
	      con.setRequestMethod("POST");
	      int responseCode = con.getResponseCode();
	      BufferedReader br;
	      System.out.print("responseCode=시작"+responseCode +"끝");
	      if(responseCode==200) { // 정상 호출
	        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
	      } else {  // 에러 발생
	        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
	      }
	      String inputLine;
	      StringBuffer res = new StringBuffer();
	      while ((inputLine = br.readLine()) != null) {
	        res.append(inputLine);
	      }
	      br.close();
	      if(responseCode==200) {
	    	System.out.println("Test"+res.toString());
	      }
	    } catch (Exception e) {
	      System.out.println(e);
	    }
	 // 세션 또는 별도의 저장 공간에서 상태 토큰을 가져옴
	    String storedState = (String)session.getAttribute("state");

	    if( !state.equals( storedState ) ) {
	        System.out.println("세션실패");
	    	//return RESPONSE_UNAUTHORIZED; //401 unauthorized
	    } else {
	        System.out.println("세션성공");
	    	//return RESPONSE_SUCCESS; //200 success
	    }
	    model.addAttribute("state");
	    model.addAttribute("apiURL");
	    model.addAttribute("res.toString()");
		
		return "/log/callback";
	}
	@RequestMapping("kakao.do")
	public String Kakao() {
		return "/log/kakaolog";
	
	}
	
	@RequestMapping("google.do")
	public String Google() {
		return "/log/google";
	
	}
}
