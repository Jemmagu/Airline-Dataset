<%@ Page Language="C#" AutoEventWireup="true" CodeFile="通过审核.aspx.cs" Inherits="用户注册" %>

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
            left: -698px;
        }
        #TextBox4 {
            position: relative;
            width: 131px;
            height: 36px;
            top: 190px;
            left: -350px;
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
            left: 230px;
        }
        #Button1 {
            position: relative;
            top: 546px;
            left: 200px;
            height: 36px;
            width: 66px;
        }
        #Button2 {
            position: relative;
            top: 545px;
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
        #TextBox9 {
            position: relative;
            width: 131px;
            height: 36px;
            top: 412px;
            left: -258px;
        }
        #TextBox10 {
            position: relative;
            width: 131px;
            height: 36px;
            top: 412px;
            left: 88px;
        }
        #Label10 {
            position: relative;
            left: -645px;
            top: 415px;
        }
        #Label11 {
            position: relative;
            left: -230px;
            top: 420px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="height: 930px; width: 1538px; background-color: #FFFFFF;">
    
        <asp:Label ID="Label1" runat="server" Text="机票号码"></asp:Label>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    
        <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Names="Microsoft Himalaya" Font-Size="X-Large" style="position: relative" Text="填写信息新增机票信息！" BackColor="#FFFF66" BorderColor="#FFFF66" BorderStyle="Inset"></asp:Label>
        <asp:Label ID="Label3" runat="server" Text="飞机航班号"></asp:Label>
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        <asp:Label ID="Label4" runat="server" Text="出发机场"></asp:Label>
        <asp:Label ID="Label5" runat="server" Text="到达机场"></asp:Label>
        <asp:Label ID="Label6" runat="server" Text="乘客姓名"></asp:Label>
        <asp:Label ID="Label7" runat="server" Text="乘客证件号"></asp:Label>
        <asp:Label ID="Label8" runat="server" Text="起飞时间"></asp:Label>
        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
        <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
        <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
        <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
        <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="确定" OnClick="Button1_Click" />
        <asp:Button ID="Button2" runat="server" Text="取消" OnClick="Button2_Click" />
    
        <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
        <asp:Label ID="Label9" runat="server" Text="到达时间"></asp:Label>
    
        <asp:TextBox ID="TextBox9" runat="server"></asp:TextBox>
        <asp:TextBox ID="TextBox10" runat="server"></asp:TextBox>
        <asp:Label ID="Label10" runat="server" Text="机票价格"></asp:Label>
        <asp:Label ID="Label11" runat="server" Text="座位编号"></asp:Label>
    
    </div>
    </form>
</body>
</html>
