using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.Security;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Configuration;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Data;

public partial class 订票 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Calendar1.Visible = false;
    }
    
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)//出发城市;
    {
        string strConnection = "Data Source=.;Initial Catalog=flight_ticket;Persist Security Info=True;User ID=sa;Password=sql";
        SqlConnection Connection = new SqlConnection(strConnection);
        String strSQL = "SELECT DISTINCT 机场名 FROM 机场 WHERE 城市名 = '" + DropDownList1.SelectedValue + "'";
        SqlCommand command = new SqlCommand(strSQL, Connection);
        SqlDataReader Dr;
        if (DropDownList1.SelectedValue != "")
        {
            Connection.Open();
            Dr = command.ExecuteReader();
            DropDownList3.Items.Clear();
            while (Dr.Read())
            {
                DropDownList3.Items.Add(new ListItem(Dr["机场名"].ToString()));
            }
            Dr.Close();
            Connection.Close();
        }
    }

    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)//到达城市;
    {
        string strConnection = "Data Source=.;Initial Catalog=flight_ticket;Persist Security Info=True;User ID=sa;Password=sql";
        SqlConnection Connection = new SqlConnection(strConnection);
        String strSQL = "SELECT DISTINCT 机场名 FROM 机场 WHERE 城市名 = '" + DropDownList2.SelectedValue + "'";
        SqlCommand command = new SqlCommand(strSQL, Connection);
        SqlDataReader Dr;
        if (DropDownList2.SelectedValue != "")
        {
            Connection.Open();
            Dr = command.ExecuteReader();
            DropDownList4.Items.Clear();
            while (Dr.Read())
            {
                DropDownList4.Items.Add(new ListItem(Dr["机场名"].ToString()));
            }
            Dr.Close();
            Connection.Close();
        }
    }
    
    protected void Button3_Click(object sender, EventArgs e)//退出;
    {
        Response.Redirect("用户登陆界面.aspx");
    }

    protected void Button1_Click(object sender, EventArgs e)//查询;
    {
        string strConnection = "Data Source=.;Initial Catalog=flight_ticket;Persist Security Info=True;User ID=sa;Password=sql";
        SqlConnection conn = new SqlConnection(strConnection);
        TextBox1.Text = Calendar1.SelectedDate.ToString("yyyy/MM/dd");
        SqlDataAdapter ad = new SqlDataAdapter("SELECT * FROM 航班线 WHERE 起飞机场 = '" + DropDownList3.SelectedValue + "' AND 到达机场 = '" + DropDownList4.SelectedValue + "' AND CONVERT(VARCHAR(10),起飞时间,111) = '" + TextBox1.Text + "'", conn);
        DataSet Data = new DataSet();
        ad.Fill(Data, "航班线");
        try
        {
            conn.Open();
            GridView1.DataSourceID = null;
            this.GridView1.DataSource = Data;
            this.GridView1.DataBind();
            conn.Close();
        }
        catch (System.Exception ee)
        {
            Response.Write(ee.Message.ToString());
        }
    }
    
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)//选择日历;
    {
        if(Calendar1.Visible==false)
            Calendar1.Visible=true;
        else if (Calendar1.Visible == true) Calendar1.Visible = false;
    }

    protected void Calendar1_SelectionChanged(object sender, EventArgs e)//日历选择时间;
    {
        TextBox1.Text = Calendar1.SelectedDate.ToShortDateString();
        Calendar1.Visible = false;
    }
    
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow row = GridView1.SelectedRow;//通过Session在多个页面之间传值;
        string ticketnum = row.Cells[0].Text + DateTime.Now.Day.ToString() + DateTime.Now.Hour.ToString() + DateTime.Now.Minute.ToString();
        Session["机票号"] = ticketnum;//方便自动生成机票号;
        Session["航班号"] = row.Cells[0].Text;
        Session["起飞机场"] = row.Cells[1].Text;
        Session["到达机场"] = row.Cells[2].Text;
        Session["起飞时间"] = row.Cells[3].Text;
        Session["到达时间"] = row.Cells[4].Text;
        Session["座位数"] = row.Cells[5].Text;
        Session["飞行距离"] = row.Cells[6].Text;
        Session["价格"] = row.Cells[7].Text;
        if(Convert.ToInt32(Session["座位数"])<=0)
            Response.Write("<script>alert('该航班没有剩余座位数，请重新选择航班!')</script>");
        else Response.Redirect("乘客订机票.aspx");
    }

    protected void Button4_Click(object sender, EventArgs e)//查看我的航班;
    {
        Response.Redirect("我的航班.aspx");
    }
}