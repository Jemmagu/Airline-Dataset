<%@ Page Language="C#" AutoEventWireup="true" CodeFile="查询航班线.aspx.cs" Inherits="订票" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        #Calendar1 {
            position: relative;
            left: 1172px;
            top: -368px;
        }
        #Label1 {
            top: 90px;
            left: 100px;
            position: relative;
        }
        #DropDownList1 {
            position: relative;
            left: 129px;
            top: 87px;
            height: 30px;
            width: 127px;
        }
        #Label2 {
            top: 50px;
            left: 200px;
            position: relative;
        }
        #DropDownList2 {
            position: relative;
            left: 229px;
            top: 42px;
            height: 30px;
            width: 127px;
        }
        #Label3 {
            top: 100px;
            position: relative;
            left: -325px;
        }
        #Label4 {
            top: 100px;
            position: relative;
            left: -69px;
        }
        #DropDownList3 {
            position: relative;
            left: 0px;
            top: 100px;
            height: 30px;
            width: 127px;
            right: 0px;
        }
        #DropDownList4 {
            position: relative;
            left: -169px;
            top: 100px;
            height: 30px;
            width: 127px;
        }
        #GridView1 {
            position: relative;
            left: 90px;
            top: 150px;
            height: 333px;
            width: 1071px;
        }
        #Label5 {
            position: relative;
            left: 350px;
            top: -465px;
        }
        #TextBox1 {
            position: relative;
            left: 600px;
            height: 30px;
            width: 175px;
            top: -468px;
        }
        #Button1 {
            position: relative;
            left: 350px;
            top: -288px;
            height: 34px;
        }
        .auto-style1 {
            height: 43px;
            width: 83px;
        }
        #Button2 {
            position: relative;
            left: 1021px;
            top: -360px;
        }
        #Button3 {
            position: relative;
            left: 1368px;
            top: -740px;
        }
        #ImageButton1 {
            position: relative;
            left: 767px;
            top: 47px;
        }
        #Button3 {
            position: relative;
            left: 1313px;
            top: -364px;
        }
        #Button4 {
            position: relative;
            left: 319px;
            top: 83px;
            width: 84px;
            height: 37px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="height: 892px; width: 1538px; ">
    
        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="Microsoft JhengHei UI" Font-Size="X-Large" Text="航班号码"></asp:Label>
        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource4" DataTextField="航班号" DataValueField="航班号" AutoPostBack="True">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:flight_ticketConnectionString %>" SelectCommand="SELECT [航班号] FROM [航班线]"></asp:SqlDataSource>
        <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="重置" />
        <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource3" AutoGenerateColumns="False" CellPadding="2" DataKeyNames="航班号" OnRowCommand="grvData_RowCommand" OnRowDeleting="GridView1_RowDeleting">
            <Columns>
                <asp:BoundField DataField="航班号" HeaderText="航班号" ReadOnly="True" SortExpression="航班号">
                <HeaderStyle BackColor="#6699FF" />
                </asp:BoundField>
                <asp:BoundField DataField="起飞机场" HeaderText="起飞机场" SortExpression="起飞机场">
                <HeaderStyle BackColor="#6699FF" />
                </asp:BoundField>
                <asp:BoundField DataField="到达机场" HeaderText="到达机场" SortExpression="到达机场">
                <HeaderStyle BackColor="#6699FF" />
                </asp:BoundField>
                <asp:BoundField DataField="起飞时间" HeaderText="起飞时间" SortExpression="起飞时间">
                <HeaderStyle BackColor="#6699FF" />
                </asp:BoundField>
                <asp:BoundField DataField="到达时间" HeaderText="到达时间" SortExpression="到达时间">
                <HeaderStyle BackColor="#6699FF" />
                </asp:BoundField>
                <asp:BoundField DataField="座位数" HeaderText="座位数" SortExpression="座位数">
                <HeaderStyle BackColor="#6699FF" />
                </asp:BoundField>
                <asp:BoundField DataField="飞行距离" HeaderText="飞行距离" SortExpression="飞行距离">
                <HeaderStyle BackColor="#6699FF" />
                </asp:BoundField>
                <asp:BoundField DataField="价格" HeaderText="价格" SortExpression="价格">
                <HeaderStyle BackColor="#6699FF" />
                </asp:BoundField>
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false" CommandName="New" Text="新建"></asp:LinkButton>
                    </ItemTemplate>
                    <HeaderStyle BackColor="#6699FF" />
                </asp:TemplateField>
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="false" CommandName="Modify" Text="修改"></asp:LinkButton>
                    </ItemTemplate>
                    <HeaderStyle BackColor="#6699FF" />
                </asp:TemplateField>
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton OnClientClick="return confirm('确认要删除吗？');" ID="LinkButton3" runat="server" CausesValidation="False" CommandName="Delete" Text="删除"></asp:LinkButton>
                    </ItemTemplate>
                    <HeaderStyle BackColor="#6699FF" />
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:flight_ticketConnectionString %>" SelectCommand="SELECT * FROM [航班线]"></asp:SqlDataSource>
        <asp:Button ID="Button3" runat="server" CssClass="auto-style1" OnClick="Button3_Click" Text="退出" />
        <asp:Button ID="Button1" runat="server" CssClass="auto-style1" OnClick="Button1_Click" Text="查询" />
        <asp:Button ID="Button2" runat="server" CssClass="auto-style1" OnClick="Button2_Click" Text="返回" />
    
    </div>
    </form>
</body>
</html>
