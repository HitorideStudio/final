<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@page import="java.text.DecimalFormat"%>

<%@page import="java.sql.*"%>

<%@page import="java.util.*"%>
<%@page import="project.list.vo.PlaceListVO" %>
<%@page import="org.json.simple.JSONObject"%>
<%

    //ì»¤ë¥ì ì ì¸
    Connection con = null;

    try {


    	 Class.forName("oracle.jdbc.driver.OracleDriver").newInstance();
         String user = "class04", pass="class04";
         String url = "jdbc:oracle:thin:@nullmaster.iptime.org:1521:xe";
         con = DriverManager.getConnection(url,user,pass);
     	ResultSet rs = null;
     	
     	//리스트
        List placelist = new ArrayList();
 	
     String keyword = request.getParameter("keyword");
     System.out.println(keyword);
	String query = "select * from placelist where address like '%"+keyword+"%'";
 	PreparedStatement pstm = con.prepareStatement(query);
 	
 	rs = pstm.executeQuery();
    	while (rs.next()) {
    		
    		PlaceListVO vo = new PlaceListVO();
    	 	vo.setPlacename(rs.getString("placename"));
    		vo.setAddress(rs.getString("address"));
    		vo.setTel(rs.getString("tel"));
    		vo.setLon(rs.getString("lon"));
    	 	vo.setLat(rs.getString("lat"));
    	 	vo.setPlace(rs.getString("place"));
    	 	placelist.add(vo);
    	}
	out.print(placelist.toString());

    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (con != null) {
            try {
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
    

%>
