<%@ page import="java.sql.*"%>

<html>
	<head></head>

	<body><br><br>
		
		<form action="Delete_stock.jsp" method="post" align="center">
			<input type="text" name="mcode" size=50 placeholder="Enter medicine code" style="margin-top:-10;border-style:solid;border-color:skyblue;height:40px;padding:5px;border-width:1px;"/>
			<button style="background-color:#1f618d;padding:10px;color:white;">Delete</button>
		</form>
		<p align="center"><br><br>
		<%
		
		String code=request.getParameter("mcode");

		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "System", "Pallavi_99");
			PreparedStatement ps = conn.prepareStatement("delete from Medicine_stock where medicine_code='"+code+"'");
			int x= ps.executeUpdate();
			
			if(x!=0){
				out.print("Details deleted successfully...");
			}
			
		}catch(Exception e){
			out.print(e);
		}
		%>
		</p>
	</body>
</html>