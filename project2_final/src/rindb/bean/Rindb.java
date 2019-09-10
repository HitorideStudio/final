package rindb.bean;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.rosuda.REngine.RList;
import org.rosuda.REngine.Rserve.RConnection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import project.list.vo.PlaceList;

@Controller
@RequestMapping("/rindb/")
public class Rindb {
	@Autowired
	private SqlSessionTemplate sql = null;
	
	@RequestMapping("insert.do")
	private String rindb() throws Exception{
		RConnection rc = new RConnection();
		
		//csv 파일을 불러온다
		RList list = rc.eval("x <- read.csv('D:/Dropbox/R/홍대완성본.csv',stringsAsFactors = F)").asList();
		
		//컬럼
		int cols = list.size();
		//행
		int rows = list.at(0).length();
		
		String [][]s = new String[rows][];
		
		for (int j = 0; j < cols; j++) {
            s[j] = list.at(j).asStrings();
        }
		
		
		for(int i=0; i<rows ; i++) {	
			PlaceList vo = new PlaceList();
			vo.setPlacename(s[0][i]);
			vo.setAddress(s[1][i]);
			vo.setTel(s[2][i]);
			vo.setLon(s[3][i]);
			vo.setLat(s[4][i]);
			vo.setPlace(s[5][i]);
			sql.insert("rindb.rindbinsert",vo);
			}
	
		rc.close();
		
		return "/rindb/insert";
	}
	

	
}
