<%@ page import="java.sql.*"%>

<html>
<body align="center"><br><br>

<%
String medicine_name=request.getParameter("mname");
String medicine_code=request.getParameter("mcode");
String quantity=request.getParameter("quantity");
String stock=request.getParameter("sname");

try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "System", "Pallavi_99");
	PreparedStatement ps = conn.prepareStatement("insert into Medicine_Stock values(?,?,?,?)");
	ps.setString(1, medicine_name);
	ps.setString(2, medicine_code);
	ps.setString(3, quantity);
	ps.setString(4, stock);
	
	int x=ps.executeUpdate();
	if(x!=0){
		out.print("Details entered successfully...");
	}else{
		out.print("Something went wrong!");
	}
}catch(Exception e){
	out.print(e);
}

%>
</body>
</html>