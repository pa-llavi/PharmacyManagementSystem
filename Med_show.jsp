<%@ page import="java.sql.*"%>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>

	<body>
	<br>
		<h2 align="center" style="color:#1f618d;font-size:40;">Medicine Details</h2><br>

		<%

		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "System", "Pallavi_99");
			Statement st = conn.createStatement();
			
			ResultSet rs= st.executeQuery("select *from Medicine");	
		%>
		
		<table align="center" border="2" style="width:100%;margin:0px;border-color:#1f618d;background:#1f618d;color:white;height:50px;">
			<tr>
					<th style="width:12%">Medicine Code</td>
					<th style="width:12%">Medicine Name</td>
					<th style="width:12%">Description</td>
					<th style="width:12%">Unit</td>
					<th style="width:12%">Expiry Date</td>
					<th style="width:12%">Category</td>
				</tr>
		</table>
		
		<%
			while(rs.next())
			{
		%>
			<table align="center" border="2" style="width:100%;margin:0px;border-color:#1f618d;" class="table table-hover">
			
				<tr>
					<td  style="width:12%"><%=rs.getString(2)%></td>
					<td style="width:12%"><%=rs.getString(1)%></td>
					<td style="width:12%"><%=rs.getString(3)%></td>
					<td style="width:12%"><%=rs.getString(4)%></td>
					<td style="width:12%"><%=rs.getString(5)%></td>
					<td style="width:12%"><%=rs.getString(6)%></td>
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