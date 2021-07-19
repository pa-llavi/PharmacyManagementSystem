<%@ page import="java.sql.*"%>

<html>
<body align="center"><br><br>

<%
String name=request.getParameter("pname");
String personal_number=request.getParameter("pno");
String dependet_number=request.getParameter("dno");
String gender=request.getParameter("gender");
String medicine_name=request.getParameter("mname");
String medicine_code=request.getParameter("mcode");
String prescription=request.getParameter("prescription");

try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "System", "Pallavi_99");
	PreparedStatement ps = conn.prepareStatement("insert into Medicine_Issue values(?,?,?,?,?,?,?)");
	ps.setString(1,name);
	ps.setString(2,personal_number);
	ps.setString(3, dependet_number);
	ps.setString(4, gender);
	ps.setString(5, medicine_name);
	ps.setString(6, medicine_code);
	ps.setString(7, prescription);
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