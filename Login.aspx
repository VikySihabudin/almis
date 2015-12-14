<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
	
<head id="Head1" runat="server">
    <title>Login ALMIS</title>

		<link href="Css/style2.css" rel='stylesheet' type='text/css' />

		<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
		<!--webfonts-->
		<link href="Css/login.css" rel='stylesheet' type='text/css' />
		<!--//webfonts-->

</head>

    <link rel="shortcut icon" href="images/logo_adaro.jpg" type="image/x-icon" />

<body>

    

	 <!-----start-main---->
	 <div class="main">
		<div class="login-form">
			<h1>Login <b>ALMIS</b></h1>
					<div class="head">
                        <img src="images/logo_adaro.png" width="120px" height="120px" alt=""/>
					</div>
				<form id="form1" runat="server">
                <asp:TextBox ID="txtusername"  class="text" runat="server"  ></asp:TextBox>
						<%--<input type="text" class="text" value="USERNAME" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'USERNAME';}" >--%>
						<%--<input type="password" value="Password" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Password';}">--%>
				<asp:TextBox ID="txtpassword" TextMode="Password" type="password"  runat="server"  ></asp:TextBox>	
                        <div class="submit">
                         <asp:Button ID="Button1" Text="Sign In" type="submit" runat="server" OnClick="btnSubmit_Click"  />	
					    </div>	
				
				</form>
			</div>
			<!--//End-login-form-->

		</div>
			 <!-----//end-main---->

</body>
</html>
</asp:Content>