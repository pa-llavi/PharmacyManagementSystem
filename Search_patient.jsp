<%@ page import="java.sql.*"%>

<html>
	<head></head>

	<body><br><br>
		
		<form action="Search_patient.jsp" method="post" align="center">
			<input type="text" name="pno" size=50 placeholder="Enter personal number" style="margin-top:-10;border-style:solid;border-color:skyblue;height:40px;padding:5px;border-width:1px;"/>
			<button style="background-color:#1f618d;padding:10px;color:white;">Search</button>
		</form>
		
		<%
		
		String no=request.getParameter("pno");

		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "System", "Pallavi_99");
			PreparedStatement ps = conn.prepareStatement("select * from Medicine_Issue where personal_number=?");
			ps.setString(1,no);
			ResultSet rs= ps.executeQuery();	
	
			while(rs.next())
			{
		%>
			<br><br><br><table align="center" border="2" style="width:90%;border-color:#1f618d;" class="table table-hover">
				<tr style="width:100%;border-color:#1f618d;background:#1f618d;color:white;height:50px;">
					<th style="width:12%">Personal Number</td>
					<th style="width:12%">Patient Name</td>
					<th style="width:12%">Dependent Number</td>
					<th style="width:12%">Gender</td>
					<th style="width:12%">Medicine Name</td>
					<th style="width:12%">Medicine Code</td>
					<th	style="width:25%">Prescription</td>
				</tr>
				<tr style="height:50px;width:100%;margin:0px;border-color:#1f618d;">
					<th style="width:12%"><%=rs.getString(2)%></td>
					<th style="width:12%"><%=rs.getString(1)%></td>
					<th style="width:12%"><%=rs.getString(3)%></td>
					<th style="width:12%"><%=rs.getString(4)%></td>
					<th style="width:12%"><%=rs.getString(5)%></td>
					<th style="width:12%"><%=rs.getString(6)%></td>
					<th style="width:25%"><%=rs.getString(7)%></td>
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