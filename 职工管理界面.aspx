<%@ Page Language="C#" AutoEventWireup="true" CodeFile="职工管理界面.aspx.cs" Inherits="管理员管理界面" %>

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
            left: 1080px;
            top: 30px;
            width: 108px;
            height: 45px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="auto-style1">
    
        <asp:Button ID="Button1" runat="server" CssClass="auto-style2" OnClick="Button1_Click" Text="查看订票" />
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="查看乘客" />
        <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="退出" />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="5" CssClass="auto-style3" DataKeyNames="机票号" DataSourceID="SqlDataSource2" OnRowCommand="GridView1_RowCommand">
            <Columns>
                <asp:BoundField DataField="机票号" HeaderText="机票号" ReadOnly="True" SortExpression="机票号">
                <HeaderStyle BackColor="#FFFF66" />
                </asp:BoundField>
                <asp:BoundField DataField="乘客证件号" HeaderText="乘客证件号" SortExpression="乘客证件号">
                <HeaderStyle BackColor="#FFFF66" />
                </asp:BoundField>
                <asp:BoundField DataField="航班号" HeaderText="航班号" SortExpression="航班号">
                <HeaderStyle BackColor="#FFFF66" />
                </asp:BoundField>
                <asp:BoundField DataField="订票者证件号" HeaderText="订票者证件号" SortExpression="订票者证件号">
                <HeaderStyle BackColor="#FFFF66" />
                </asp:BoundField>
                <asp:BoundField DataField="订票时间" HeaderText="订票时间" SortExpression="订票时间">
                <HeaderStyle BackColor="#FFFF66" />
                </asp:BoundField>
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false" CommandName="Check" Text="审核"></asp:LinkButton>
                    </ItemTemplate>
                    <HeaderStyle BackColor="#FFFF66" />
                    <ItemStyle ForeColor="#CC9900" />
                </asp:TemplateField>
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="false" CommandName="Ok" Text="通过"></asp:LinkButton>
                    </ItemTemplate>
                    <HeaderStyle BackColor="#FFFF66" />
                    <ItemStyle ForeColor="#CC9900" />
                </asp:TemplateField>
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton OnClientClick="return confirm('确认要拒绝并删除该订票信息吗？');" ID="LinkButton3" runat="server" CausesValidation="false" CommandName="Deny" Text="拒绝"></asp:LinkButton>
                    </ItemTemplate>
                    <HeaderStyle BackColor="#FFFF66" />
                    <ItemStyle ForeColor="#FFFF66" />
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:flight_ticketConnectionString %>" SelectCommand="SELECT * FROM [订票]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:flight_ticketConnectionString %>" SelectCommand="SELECT * FROM [职工]"></asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
