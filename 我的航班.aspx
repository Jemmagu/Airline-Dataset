<%@ Page Language="C#" AutoEventWireup="true" CodeFile="我的航班.aspx.cs" Inherits="管理员管理界面" %>

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
            height: 354px;
            width: 1107px;
        }
        #Button3 {
            position: relative;
            left: 1080px;
            top: 30px;
            width: 108px;
            height: 45px;
        }
        #GridView2 {
            position: relative;
            left: 100px;
            top: 70px;
            height: 354px;
            width: 1107px;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="auto-style1">
    
        <asp:Button ID="Button1" runat="server" CssClass="auto-style2" OnClick="Button1_Click" Text="已预订航班" />
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="已出票航班" />
        <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="返回" />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="2" CssClass="auto-style3" DataKeyNames="机票号" DataSourceID="SqlDataSource2" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowDeleting="GridView1_RowDeleting" OnSelectedIndexChanging="GridView1_SelectedIndexChanged">
            <Columns>
                <asp:BoundField DataField="机票号" HeaderText="机票号" ReadOnly="True" SortExpression="机票号">
                <HeaderStyle BackColor="#FF6666" />
                </asp:BoundField>
                <asp:BoundField DataField="航班号" HeaderText="航班号" SortExpression="航班号">
                <HeaderStyle BackColor="#FF6666" />
                </asp:BoundField>
                <asp:BoundField DataField="姓名" HeaderText="姓名" SortExpression="姓名">
                <HeaderStyle BackColor="#FF6666" />
                </asp:BoundField>
                <asp:BoundField DataField="乘客证件号" HeaderText="乘客证件号" SortExpression="乘客证件号">
                <HeaderStyle BackColor="#FF6666" />
                </asp:BoundField>
                <asp:BoundField DataField="起飞机场" HeaderText="起飞机场" SortExpression="起飞机场">
                <HeaderStyle BackColor="#FF6666" />
                </asp:BoundField>
                <asp:BoundField DataField="到达机场" HeaderText="到达机场" SortExpression="到达机场">
                <HeaderStyle BackColor="#FF6666" />
                </asp:BoundField>
                <asp:BoundField DataField="起飞时间" HeaderText="起飞时间" SortExpression="起飞时间">
                <HeaderStyle BackColor="#FF6666" />
                </asp:BoundField>
                <asp:BoundField DataField="到达时间" HeaderText="到达时间" SortExpression="到达时间">
                <HeaderStyle BackColor="#FF6666" />
                </asp:BoundField>
                <asp:BoundField DataField="价格" HeaderText="价格" SortExpression="价格">
                <HeaderStyle BackColor="#FF6666" />
                </asp:BoundField>
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton OnClientClick="return confirm('确认要退票吗？');" ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" Text="退票"></asp:LinkButton>
                    </ItemTemplate>
                    <HeaderStyle BackColor="#FF6666" />
                    <ItemStyle ForeColor="#FF6666" />
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:flight_ticketConnectionString %>" SelectCommand="SELECT 机票号,订票 .航班号,姓名,乘客证件号,起飞机场,到达机场,起飞时间,到达时间,价格,订票时间
FROM (订票 join 航班线 on 订票.航班号=航班线.航班号) join 乘客 on 乘客.证件号=订票.乘客证件号"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:flight_ticketConnectionString %>" SelectCommand="SELECT * FROM [职工]"></asp:SqlDataSource>
    
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="2" CssClass="auto-style3" DataKeyNames="机票号" DataSourceID="SqlDataSource2" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowDeleting="GridView1_RowDeleting" OnSelectedIndexChanging="GridView1_SelectedIndexChanged">
            <Columns>
                <asp:BoundField DataField="机票号" HeaderText="机票号" ReadOnly="True" SortExpression="机票号">
                <HeaderStyle BackColor="#FF6666" />
                </asp:BoundField>
                <asp:BoundField DataField="航班号" HeaderText="航班号" SortExpression="航班号">
                <HeaderStyle BackColor="#FF6666" />
                </asp:BoundField>
                <asp:BoundField DataField="姓名" HeaderText="姓名" SortExpression="姓名">
                <HeaderStyle BackColor="#FF6666" />
                </asp:BoundField>
                <asp:BoundField DataField="乘客证件号" HeaderText="乘客证件号" SortExpression="乘客证件号">
                <HeaderStyle BackColor="#FF6666" />
                </asp:BoundField>
                <asp:BoundField DataField="起飞机场" HeaderText="起飞机场" SortExpression="起飞机场">
                <HeaderStyle BackColor="#FF6666" />
                </asp:BoundField>
                <asp:BoundField DataField="到达机场" HeaderText="到达机场" SortExpression="到达机场">
                <HeaderStyle BackColor="#FF6666" />
                </asp:BoundField>
                <asp:BoundField DataField="起飞时间" HeaderText="起飞时间" SortExpression="起飞时间">
                <HeaderStyle BackColor="#FF6666" />
                </asp:BoundField>
                <asp:BoundField DataField="到达时间" HeaderText="到达时间" SortExpression="到达时间">
                <HeaderStyle BackColor="#FF6666" />
                </asp:BoundField>
                <asp:BoundField DataField="价格" HeaderText="价格" SortExpression="价格">
                <HeaderStyle BackColor="#FF6666" />
                </asp:BoundField>
            </Columns>
        </asp:GridView>
    
    </div>
    </form>
</body>
</html>
