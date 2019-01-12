<%@ Page Language="C#" AutoEventWireup="true" CodeFile="管理员登陆界面.aspx.cs" Inherits="登陆界面" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">


font, th, td, p
{
    font-family: Verdana, Arial, Helvetica, sans-serif;
    line-height: 120%;
}

a:link,a:active,a:visited { color : #006699; }

        #Login1 {
            position: relative;
            left: 500px;
            top: 0px;
        }
        #Label1 {
            clip: rect(auto, auto, auto, auto);
            left: 540px;
            position: relative;
            top: -100px;
        }

        #Label2 {
            clip: rect(auto, auto, auto, auto);
            left: 0px;
            position: relative;
            top: 0px;
        }
        #Image1 {
            position: relative;
            left: -400px;
        }
        .auto-style1 {
            top: 0px;
            left: 0px;
            height: 227px;
            width: 246px;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="height: 824px; width: 1538px; position: relative; background-color: #FFFFFF; top: -18px; left: -5px;">
    
        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="Microsoft Himalaya" Font-Size="X-Large" style="position: relative" Text="输入管理名及密码后进入管理界面！" BackColor="#6699FF" BorderColor="#6699FF" BorderStyle="Inset"></asp:Label>
        <asp:Image ID="Image1" runat="server" CssClass="auto-style1" ImageUrl="~/1497441842(1).png" />
        <asp:Login ID="Login1" runat="server" BackColor="#CAEEFF" BorderColor="#6699FF" BorderPadding="0" BorderStyle="Inset" CreateUserText="用户登陆" CreateUserUrl="~/用户登陆界面.aspx" Font-Size="Medium" Height="321px" HelpPageText="职工登陆" HelpPageUrl="~/职工登陆界面.aspx" OnAuthenticate="Login1_Authenticate1" TitleText=" " Width="476px">
            <CheckBoxStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
            <LabelStyle HorizontalAlign="Center" Wrap="True" />
            <LoginButtonStyle Height="40px" Width="80px" />
            <TextBoxStyle Height="30px" />
            <TitleTextStyle Height="70px" HorizontalAlign="Center" />
        </asp:Login>
    
    </div>
    </form>
</body>
</html>
