<%@ Page Language="C#" AutoEventWireup="true" CodeFile="管理员管理界面.aspx.cs" Inherits="管理员管理界面" %>

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
            left: 1300px;
            top: -425px;
            height: 45px;
            width: 108px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="auto-style1">
    
        <asp:Button ID="Button1" runat="server" CssClass="auto-style2" OnClick="Button1_Click" Text="管理职工" />
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="管理航班线" />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="5" CssClass="auto-style3" DataKeyNames="职工号" DataSourceID="SqlDataSource1" OnRowCommand="GridView1_RowCommand" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowDeleting="GridView1_RowDeleting" OnSelectedIndexChanging="GridView1_SelectedIndexChanged">
            <Columns>
                <asp:BoundField DataField="职工号" HeaderText="职工号" ReadOnly="True" SortExpression="职工号">
                <HeaderStyle BackColor="#6699FF" />
                </asp:BoundField>
                <asp:BoundField DataField="职工密码" HeaderText="职工密码" SortExpression="职工密码">
                <HeaderStyle BackColor="#6699FF" />
                </asp:BoundField>
                <asp:BoundField DataField="姓名" HeaderText="姓名" SortExpression="姓名">
                <HeaderStyle BackColor="#6699FF" />
                </asp:BoundField>
                <asp:BoundField DataField="工作机场" HeaderText="工作机场" SortExpression="工作机场">
                <HeaderStyle BackColor="#6699FF" />
                </asp:BoundField>
                <asp:BoundField DataField="性别" HeaderText="性别" SortExpression="性别">
                <HeaderStyle BackColor="#6699FF" />
                </asp:BoundField>
                <asp:BoundField DataField="手机" HeaderText="手机" SortExpression="手机">
                <HeaderStyle BackColor="#6699FF" />
                </asp:BoundField>
                <asp:BoundField DataField="邮箱" HeaderText="邮箱" SortExpression="邮箱">
                <HeaderStyle BackColor="#6699FF" />
                </asp:BoundField>
                <asp:BoundField DataField="地址" HeaderText="地址" SortExpression="地址">
                <HeaderStyle BackColor="#6699FF" />
                </asp:BoundField>
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="false" CommandName="New" Text="新增"></asp:LinkButton>
                    </ItemTemplate>
                    <HeaderStyle BackColor="#6699FF" />
                </asp:TemplateField>
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="false" CommandName="Modify" Text="修改"></asp:LinkButton>
                    </ItemTemplate>
                    <HeaderStyle BackColor="#6699FF" />
                </asp:TemplateField>
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton OnClientClick="return confirm('确认要删除吗？');" ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" Text="删除"></asp:LinkButton>
                    </ItemTemplate>
                    <HeaderStyle BackColor="#6699FF" />
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    
        <asp:Button ID="Button3" runat="server" CssClass="auto-style2" OnClick="Button3_Click" Text="退出" />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:flight_ticketConnectionString %>" SelectCommand="SELECT * FROM [职工]"></asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
