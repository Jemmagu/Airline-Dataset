<%@ Page Language="C#" AutoEventWireup="true" CodeFile="查询机票2.aspx.cs" Inherits="订票" %>

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
            top: 50px;
            left: 100px;
            position: relative;
        }
        #DropDownList1 {
            position: relative;
            left: 129px;
            top: 50px;
            height: 30px;
            width: 127px;
        }
        #Label2 {
            top: 50px;
            left: -80px;
            position: relative;
        }
        #DropDownList2 {
            position: relative;
            left: -30px;
            top: 42px;
            height: 30px;
            width: 127px;
        }
        #Label3 {
            top: 100px;
            position: relative;
            left: -625px;
        }
        #Label4 {
            top: 100px;
            position: relative;
            left: -350px;
        }
        #DropDownList3 {
            position: relative;
            left: -665px;
            top: 100px;
            height: 30px;
            width: 127px;
            right: 450px;
        }
        #DropDownList4 {
            position: relative;
            left: -430px;
            top: 100px;
            height: 30px;
            width: 127px;
        }
        #GridView1 {
            position: relative;
            left: 90px;
            top: 178px;
            height: 333px;
            width: 989px;
        }
        #Label5 {
            position: relative;
            left: 420px;
            top: -300px;
        }
        #TextBox1 {
            position: relative;
            left: 660px;
            height: 30px;
            width: 175px;
            top: -373px;
        }
        #Button1 {
            position: relative;
            left: 976px;
            top: -345px;
            height: 30px;
        }
        #Button2 {
            position: relative;
            left: 956px;
            top: -436px;
        }
        #Button3 {
            position: relative;
            left: 1368px;
            top: -800px;
        }
        #ImageButton1 {
            position: relative;
            left: 515px;
            top: 54px;
        }
        .auto-style2 {
            width: 17px;
        }
        #Button3 {
            position: relative;
            left: 1352px;
            top: -400px;
        }
        #Button4 {
            position: relative;
            left: 879px;
            top: 40px;
            height: 43px;
            width: 83px;
        }
        #Button5 {
            position: relative;
            left: 750px;
            top: 40px;
            height: 43px;
            width: 83px;
        }
        #Button6 {
            position: relative;
            left: 1150px;
            top: 40px;
            height: 43px;
            width: 83px;
        }
        #Label5 {
            position: relative;
            left: 570px;
            top: 35px;
        }
        #TextBox1 {
            position: relative;
            left: 821px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="height: 892px; width: 1538px; ">
    
        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="Microsoft JhengHei UI" Font-Size="Medium" Text="出发城市"></asp:Label>
        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="城市名" DataValueField="城市名" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True" OnTextChanged="DropDownList1_SelectedIndexChanged">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:flight_ticketConnectionString %>" SelectCommand="SELECT [城市名] FROM [机场]"></asp:SqlDataSource>
        <asp:Label ID="Label5" runat="server" Text="日期"></asp:Label>
        <asp:Button ID="Button6" runat="server" OnClick="Button3_Click" Text="退出" />
        <asp:Button ID="Button5" runat="server" OnClick="Button1_Click" Text="查询" />
        <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="我的信息" />
        <asp:ImageButton ID="ImageButton1" runat="server" CssClass="auto-style2" ImageUrl="~/calender.png" OnClick="ImageButton1_Click" />
        <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Names="Microsoft JhengHei UI" Font-Size="Medium" Text="到达城市"></asp:Label>
        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource1" DataTextField="城市名" DataValueField="城市名" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" AutoPostBack="True">
        </asp:DropDownList>
        <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Names="Microsoft JhengHei UI" Font-Size="Medium" Text="出发机场"></asp:Label>
        <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Names="Microsoft JhengHei UI" Font-Size="Medium" Text="到达机场"></asp:Label>
        <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True">
        </asp:DropDownList>
        <asp:DropDownList ID="DropDownList4" runat="server" AutoPostBack="True">
        </asp:DropDownList>
        <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource2" AutoGenerateColumns="False" CellPadding="5" DataKeyNames="航班号" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <Columns>
                <asp:BoundField DataField="航班号" HeaderText="航班号" ReadOnly="True" SortExpression="航班号">
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
                <asp:BoundField DataField="座位数" HeaderText="座位数" SortExpression="座位数">
                <HeaderStyle BackColor="#FF6666" />
                </asp:BoundField>
                <asp:BoundField DataField="飞行距离" HeaderText="飞行距离" SortExpression="飞行距离">
                <HeaderStyle BackColor="#FF6666" />
                </asp:BoundField>
                <asp:BoundField DataField="价格" HeaderText="价格" SortExpression="价格">
                <HeaderStyle BackColor="#FF6666" />
                </asp:BoundField>
                <asp:CommandField SelectText="预订" ShowSelectButton="True">
                <HeaderStyle BackColor="#FF6666" />
                <ItemStyle ForeColor="#FF6666" />
                </asp:CommandField>
            </Columns>
        </asp:GridView>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:flight_ticketConnectionString %>" SelectCommand="SELECT [航班号], [起飞机场], [到达机场], [起飞时间], [到达时间], [座位数], [飞行距离], [价格] FROM [航班线]"></asp:SqlDataSource>
        <asp:Calendar ID="Calendar1" runat="server" OnSelectionChanged="Calendar1_SelectionChanged">
            <TitleStyle BackColor="#FF6666" />
        </asp:Calendar>
    
    </div>
    </form>
</body>
</html>
