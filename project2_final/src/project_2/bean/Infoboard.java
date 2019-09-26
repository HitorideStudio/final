package project_2.bean;

import java.io.File;
import java.util.HashMap;
import java.util.List;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	public String writeForm(HttpServletRequest request,HttpSession session,
			String place,String placename,String number, Model model) {
		System.out.println(number);
		String id = (String)session.getAttribute("memId");
		//내가 쓴글 카운트
		HashMap replycount = new HashMap();
		replycount.put("i_id",id);
		replycount.put("i_shop",number);
		
		int rcount = (Integer)sql.selectOne("infoboard.countId", replycount);
		
		//댓글 카운트
		int count = (Integer)sql.selectOne("infoboard.count",number);
		System.out.println(count);
		//해당 마커 댓글 가져오기
		int row = 10; //페이지에 보여줄 갯수
		String page = request.getParameter("page");
		if(page == null) {
			page="1";
		}
		int currentPage = Integer.parseInt(page);
		int startRow = (currentPage-1) * row +1;    // 각 페이지당 시작하는 번호 ex) row = 10일때 startRow = 1 , 11 , 21 ....
		int endRow = currentPage * row;    // 각 페이지당 끝나는 번호 ex) row = 10일때 startRow = 10 , 20, 30 ....
		HashMap pageList = new HashMap();     // sql 문에 보내주기 위해 생성
 
		pageList.put("number", number);
		pageList.put("startRow",startRow);
		pageList.put("endRow",endRow);
		
		// 댓글 가져오기
		List revo = sql.selectList("infoboard.replylist",pageList);
		System.out.println(revo);
		//페이지 계산
		int pageCount = count / row + (count % row == 0? 0:1);
		int startPage = (int)(currentPage/10)*10+1;
		int pageBlock=10;
		int endPage = startPage + pageBlock-1;
		if(endPage > pageCount) endPage = pageCount;
		
		System.out.println(pageCount);
		model.addAttribute("place",place);
		model.addAttribute("placename",placename);
		model.addAttribute("number",number);
		model.addAttribute("revo",revo);
		model.addAttribute("count",count);
		model.addAttribute("startPage",startPage);
		model.addAttribute("endPage",endPage);
		model.addAttribute("pageCount",pageCount);
		model.addAttribute("rcount",rcount);
		
		return "/infoboard/writeForm";
	}
	
	@RequestMapping("writePro.do")
	public String writePro(MultipartHttpServletRequest request,String i_shop,
		String i_id,String i_content, String i_placename,Model model) throws Exception{
		
		MultipartFile mf = request.getFile("i_img");
		String org = mf.getOriginalFilename();
		String i_img = null;
		
		if(org!="") {
		String path = request.getRealPath("imgs");
		i_img = org;
		File f = new File(path+"//"+i_img);
		
		mf.transferTo(f);
		i_img = "/project2_final/imgs/"+i_img;
		}else {
			i_img = "notpicture";
		}
		InfoboardVO vo = new InfoboardVO();
		vo.setI_id(i_id);
		vo.setI_shop(i_shop);
		vo.setI_content(i_content);
		vo.setI_img(i_img);
		vo.setI_placename(i_placename);
		sql.insert("infoboard.write",vo);
		model.addAttribute("i_placename",i_placename);
		
		return "/infoboard/writeForm";
	}
	//리뷰 삭제
	@RequestMapping("deleteForm.do")
	public String deleteForm(int num) {
		System.out.println(num);
		sql.delete("infoboard.delete",num);
		return "/infoboard/writeForm";
	}
	
	

}
