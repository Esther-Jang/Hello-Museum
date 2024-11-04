<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="dbconn.jsp"%>
<%
	String eId = request.getParameter("id");

String sql = "select * from exhibit";
PreparedStatement pstmt = conn.prepareStatement(sql);
ResultSet rs = pstmt.executeQuery();

if (rs.next()) {
	sql = "delete from exhibit where e_id=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, eId);
	pstmt.executeUpdate();
} else {
	out.println("일치하는 전시가 없습니다.");
}
if (rs != null)
	rs.close();
if (pstmt != null)
	pstmt.close();

if (conn != null)
	conn.close();

response.sendRedirect("editExhibit.jsp?edit=delete");
%>