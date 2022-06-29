
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>

<!DOCTYPE html>    
<html>    

<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Employee Login</title>
    

<style>
    
    body
    {
        font-family: 'Baloo Bhai 2', cursive;
        margin: 0px;
        padding: 0px;
        
        background:url(bg.jpg);
        background-repeat: no-repeat;
        background-size: 1300px 660px;
        
        
    }
    
    .btn{
        margin: 0px 9px;
        background-color:darkcyan;
        color: white;
        padding: 2px 5px;
        border: 2px solid rgb(90, 89, 89);
        border-radius: 10px;
        cursor: pointer;
    }

    .container{
        border: 2px transparent;
        margin: 150.7px 450px;
        padding: 38px 38px;
        width: 25%;
        border-radius: 16px;
        background:url(bg3.jpg);
        background-repeat: no-repeat;
        background-size: 390px 390px;
    }

    .form-group input{
        text-align: center;
        display: block;
        width: 310px;
        padding: 1px;
        border: 2px solid gray;
        margin: 6px auto;
        border-radius: 10px;
        font-size: 15px;
        font-family: 'Baloo Tamma 2', cursive;
    }

    .container h2{
        text-align: center;
    }

    .container button{
        display: block;
        width: 33%;
        margin: 17px auto;
        font-size: 14px;
        font-family:'Baloo Tamma 2', cursive;
    
    }
    .container label
    {  
    width: 300px;  
    height: 30px;  
    border: none;  
    border-radius: 3px;  
    padding-left: 8px;  
    }
    
</style>

</head>
<body >
      <div class="container">
        <h2>EMPLOYEE LOGIN</h2>
        <form >
            <div class="form-group">
                <label><b>User Name</b></label>
                <input type="email" name="email" placeholder="Enter Username">
            </div>
            <div class="form-group">
                <label><b>Password</b></label>
                <input type="Password" name="Pass" id="Pass" placeholder="Enter Password">  
                
            </div>
             <br>
            
            <button class="btn" name="btn_login">Login</button>
            
            
           
        </form> 
    </div>  
</body>
</html>





<%
    try{
        if(request.getParameter("btn_login")!=null)
        {
            String username = request.getParameter("email");   
            String password = request.getParameter("Pass");
            Connection conn=null;
            Statement stat=null;
            Class.forName("com.mysql.jdbc.Driver");
            conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","");
            stat=conn.createStatement();
            
            PreparedStatement pst = conn.prepareStatement("Select email,password from employee where email=? and password=?");
            pst.setString(1, username);
            pst.setString(2, password);
            ResultSet rs = pst.executeQuery();  
            if(rs.next())     
            {
                session.setAttribute("emp",username);
                response.sendRedirect("employee.jsp");
            }
            else
            {
                %>
                <script type="text/javascript">
                    alert("Invalid credentials !!!!");
                </script>
                <%
                
            }
        }
        
    }catch(Exception ex ){ex.printStackTrace();}

%>



