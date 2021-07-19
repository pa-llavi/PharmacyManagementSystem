<%@ page import="java.sql.*"%>

<html>
	<head></head>

	<body><br><br>
		
		<form action="Search_med.jsp" method="post" align="center">
			<input type="text" name="mcode" size=50 placeholder="Enter medicine code" style="margin-top:-10;border-style:solid;border-color:skyblue;height:40px;padding:5px;border-width:1px;"/>
			<button style="background-color:#1f618d;padding:10px;color:white;">Search</button>
		</form>
		
		<%
		
		String code=request.getParameter("mcode");

		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "System", "Pallavi_99");
			PreparedStatement ps = conn.prepareStatement("select * from Medicine where medicine_code=?");
			ps.setString(1,code);
			ResultSet rs= ps.executeQuery();	
	
			while(rs.next())
			{
		%>
			<br><br><br><table align="center" border="2" style="width:90%;border-color:#1f618d;">
				<tr style="width:100%;border-color:#1f618d;background:#1f618d;color:white;height:50px;">
					<th style="width:12%">Medicine Code</td>
					<th style="width:12%">Medicine Name</td>
					<th style="width:12%">Description</td> 
					<th style="width:12%">Unit</td>
					<th style="width:12%">Expiry Date</td>
					<th style="width:12%">Category</td>
				</tr>
				<tr style="height:50px;width:100%;margin:0px;border-color:#1f618d;">
					<th style="width:12%"><%=rs.getString(2)%></td>
					<th style="width:12%"><%=rs.getString(1)%></td>
					<th style="width:12%"><%=rs.getString(3)%></td>
					<th style="width:12%"><%=rs.getString(4)%></td>
					<th style="width:12%"><%=rs.getString(5)%></td>
					<th style="width:12%"><%=rs.getString(6)%></td>
				</tr>
			
			
			</table>
		
		<%
			}
		}catch(Exception e){
			out.print(e);
		}
		%>
		
	</body>
</html>