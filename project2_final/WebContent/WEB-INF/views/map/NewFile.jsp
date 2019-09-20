<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@page import="java.text.DecimalFormat"%>

<%@page import="java.sql.*"%>

<%@page import="java.util.*"%>
<%@page import="project.list.vo.PlaceListVO" %>
<%

    Connection con = null;

    try {


        Class.forName("oracle.jdbc.driver.OracleDriver").newInstance();
        String user = "TEAM04", pass="TEAM";
        String url = "jdbc:oracle:thin:@nullmaster.iptime.org:1521:xe";
        con = DriverManager.getConnection(url,user,pass);
    	ResultSet rs = null;
    	
    	//리스트
        List<PlaceListVO> list = null;
	
    String keyword = request.getParameter("keyword");
    System.out.println(keyword);

	String query = "select * from placelist address like '%?%'";
	PreparedStatement pstm = con.prepareStatement(query);
    pstm.setString(1, keyword);
 	rs = pstm.executeQuery();


		 response.setContentType("text/html;charset=UTF-8");
    	while (rs.next()) {
           
 	    	
        } 
    
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