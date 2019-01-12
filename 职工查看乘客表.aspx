<%@ Page Language="C#" AutoEventWireup="true" CodeFile="职工查看乘客表.aspx.cs" Inherits="管理员管理界面" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 662px;
            width: 1520px;
        }
        .auto-style2 {}
        #Button1 {
            position: relative;
            left: 102px;
            top: 41px;
            height: 45px;
            width: 108px;
        }
        #Button2 {
            position: relative;
            top: 40px;
            left: 200px;
            height: 45px;
            width: 108px;
        }
        .auto-style3 {}
        #GridView1 {
            position: relative;
            left: 100px;
            top: 70px;
            height: 420px;
            width: 1187px;
        }
        #Button3 {
            position: relative;
            top: 40px;
            left: 1100px;
            height: 45px;
            width: 108px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="auto-style1">
    
        <asp:Button ID="Button1" runat="server" CssClass="auto-style2" OnClick="Button1_Click" Text="查看订票" />
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="查看乘客" />
        <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="退出" />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="5" CssClass="auto-style3" DataKeyNames="证件号" DataSourceID="SqlDataSource2" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AllowPaging="True">
            <Columns>
                <asp:BoundField DataField="证件号" HeaderText="证件号" ReadOnly="True" SortExpression="证件号">
                <HeaderStyle BackColor="#FFFF66" />
                </asp:BoundField>
                <asp:BoundField DataField="乘客密码" HeaderText="乘客密码" SortExpression="乘客密码">
                <HeaderStyle BackColor="#FFFF66" />
                </asp:BoundField>
                <asp:BoundField DataField="姓名" HeaderText="姓名" SortExpression="姓名">
                <HeaderStyle BackColor="#FFFF66" />
                </asp:BoundField>
                <asp:BoundField DataField="性别" HeaderText="性别" SortExpression="性别">
                <HeaderStyle BackColor="#FFFF66" />
                </asp:BoundField>
                <asp:BoundField DataField="手机" HeaderText="手机" SortExpression="手机">
                <HeaderStyle BackColor="#FFFF66" />
                </asp:BoundField>
                <asp:BoundField DataField="邮箱" HeaderText="邮箱" SortExpression="邮箱">
                <HeaderStyle BackColor="#FFFF66" />
                </asp:BoundField>
                <asp:BoundField DataField="地址" HeaderText="地址" SortExpression="地址">
                <HeaderStyle BackColor="#FFFF66" />
                </asp:BoundField>
                <asp:CommandField SelectText="修改" ShowSelectButton="True">
                <HeaderStyle BackColor="#FFFF66" />
                <ItemStyle ForeColor="#CC9900" />
                </asp:CommandField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:flight_ticketConnectionString %>" SelectCommand="SELECT * FROM [乘客]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:flight_ticketConnectionString %>" SelectCommand="SELECT * FROM [职工]"></asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
