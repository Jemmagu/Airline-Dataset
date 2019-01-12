<%@ Page Language="C#" AutoEventWireup="true" CodeFile="显示乘客信息.aspx.cs" Inherits="用户注册" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        #Label1 {
            position: relative;
            left: 270px;
            top: 100px;
        }
        #TextBox1 {
            position: relative;
            top: 100px;
            left: 300px;
            height: 36px;
            width: 131px;
        }
        #Label2 {
            position: relative;
            left: 340px;
            top: 30px;
        }
        #Label3 {
            position: relative;
            left: 250px;
            top: 100px;
        }
        #TextBox2 {
            position: relative;
            top: 100px;
            left: 280px;
            height: 36px;
            width: 131px;
        }
        #Label4 {
            position: relative;
            top: 190px;
            left: -440px;
        }
        #Label5 {
            position: relative;
            left: -40px;
            top: 190px;
        }
        #Label6 {
            position: relative;
            top: 270px;
            left: -580px;
        }
        #Label7 {
            position: relative;
            left: -180px;
            top: 270px;
        }
        #Label8 {
            position: relative;
            left: -730px;
            top: 360px;
        }
        #TextBox3 {
            position: relative;
            width: 131px;
            height: 36px;
            top: 190px;
            left: -705px;
        }
        #TextBox4 {
            position: relative;
            width: 131px;
            height: 36px;
            top: 190px;
            left: -366px;
        }
        #TextBox5 {
            position: relative;
            width: 131px;
            height: 36px;
            top: 270px;
            left: -975px;
        }
        #TextBox6 {
            position: relative;
            width: 131px;
            height: 36px;
            top: 230px;
            left: 855px;
        }
        #TextBox7 {
            position: relative;
            width: 131px;
            height: 36px;
            top: 315px;
            left: 238px;
        }
        #Button1 {
            position: relative;
            top: 430px;
            left: 200px;
            height: 36px;
            width: 66px;
        }
        #Button2 {
            position: relative;
            top: 430px;
            left: 350px;
            height: 36px;
            width: 66px;
        }
        #TextBox8 {
            position: relative;
            width: 131px;
            height: 36px;
            top: 315px;
            left: 434px;
        }
        #Label9 {
            position: relative;
            left: 170px;
            top: 320px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="height: 930px; width: 1538px; background-color: #FFFFFF;">
    
        <asp:Label ID="Label1" runat="server" Text="乘客姓名"></asp:Label>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    
        <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Names="Microsoft Himalaya" Font-Size="X-Large" style="position: relative" Text="查看信息进行乘客审核！" BackColor="#FFFF66" BorderColor="#FFFF66" BorderStyle="Inset"></asp:Label>
        <asp:Label ID="Label3" runat="server" Text="乘客证件号"></asp:Label>
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        <asp:Label ID="Label4" runat="server" Text="乘客手机"></asp:Label>
        <asp:Label ID="Label5" runat="server" Text="航班号码"></asp:Label>
        <asp:Label ID="Label6" runat="server" Text="机票号码"></asp:Label>
        <asp:Label ID="Label7" runat="server" Text="订票者姓名"></asp:Label>
        <asp:Label ID="Label8" runat="server" Text="订票者手机"></asp:Label>
        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
        <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
        <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
        <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
        <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="确定" OnClick="Button1_Click" />
        <asp:Button ID="Button2" runat="server" Text="取消" OnClick="Button2_Click" />
    
        <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
        <asp:Label ID="Label9" runat="server" Text="订票者证件号"></asp:Label>
    
    </div>
    </form>
</body>
</html>
