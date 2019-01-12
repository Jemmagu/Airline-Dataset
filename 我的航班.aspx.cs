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

public partial class 管理员管理界面 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            GridView2.Visible = false;
        booked_flight();
        confirmed_flight();
    }

    protected void booked_flight()//查看已预订的航班，输出到GridView;
    {
        string strConnection = "Data Source=.;Initial Catalog=flight_ticket;Persist Security Info=True;User ID=sa;Password=sql";
        SqlConnection conn = new SqlConnection(strConnection);
        SqlDataAdapter ad = new SqlDataAdapter("SELECT 机票号,订票.航班号,姓名,乘客证件号,起飞机场,到达机场,起飞时间,到达时间,价格 FROM (订票 join 航班线 on 订票.航班号=航班线.航班号) join 乘客 on 乘客.证件号=订票.乘客证件号 WHERE 订票者证件号 = '" + (string)Session["登录号"] + "'", conn);
        DataSet Data = new DataSet();
        ad.Fill(Data);
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

    protected void booked_flight_1()//查看已预订的航班，输出到GridView;
    {
        string strConnection = "Data Source=.;Initial Catalog=flight_ticket;Persist Security Info=True;User ID=sa;Password=sql";
        SqlConnection conn = new SqlConnection(strConnection);
        SqlDataAdapter ad = new SqlDataAdapter("SELECT 机票号,订票.航班号,姓名,乘客证件号,起飞机场,到达机场,起飞时间,到达时间,价格 FROM (订票 join 航班线 on 订票.航班号=航班线.航班号) join 乘客 on 乘客.证件号=订票.乘客证件号 WHERE 订票者证件号 = '" + (string)Session["登录号"] + "'", conn);
        DataSet Data = new DataSet();
        ad.Fill(Data);
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
         if (GridView1.Rows.Count == 0)
           Response.Write("<script>alert('没有所要查询的信息！')</script>");
    }
    
    protected void confirmed_flight()//查看已出票的航班，输出到GridView;
    {
        string strConnection = "Data Source=.;Initial Catalog=flight_ticket;Persist Security Info=True;User ID=sa;Password=sql";
        SqlConnection conn = new SqlConnection(strConnection);
        SqlDataAdapter ad = new SqlDataAdapter("SELECT 机票号,出票.航班号,姓名,乘客证件号,起飞机场,到达机场,起飞时间,到达时间,价格 FROM (出票 join 航班线 on 出票.航班号=航班线.航班号) join 乘客 on 乘客.证件号=出票.乘客证件号 WHERE 订票者证件号 = '" + (string)Session["登录号"] + "'", conn);
        DataSet Data = new DataSet();
        ad.Fill(Data);
        try
        {
            conn.Open();
            GridView2.DataSourceID = null;
            this.GridView2.DataSource = Data;
            this.GridView2.DataBind();
            conn.Close();
        }
        catch (System.Exception ee)
        {
            Response.Write(ee.Message.ToString());
        }
    }

    protected void confirmed_flight_1()//查看已出票的航班，输出到GridView2;
    {
        string strConnection = "Data Source=.;Initial Catalog=flight_ticket;Persist Security Info=True;User ID=sa;Password=sql";
        SqlConnection conn = new SqlConnection(strConnection);
        SqlDataAdapter ad = new SqlDataAdapter("SELECT 机票号,出票.航班号,姓名,乘客证件号,起飞机场,到达机场,起飞时间,到达时间,价格 FROM (出票 join 航班线 on 出票.航班号=航班线.航班号) join 乘客 on 乘客.证件号=出票.乘客证件号 WHERE 订票者证件号 = '" + (string)Session["登录号"] + "'", conn);
        DataSet Data = new DataSet();
        ad.Fill(Data);
        try
        {
            conn.Open();
            GridView2.DataSourceID = null;
            this.GridView2.DataSource = Data;
            this.GridView2.DataBind();
            conn.Close();
        }
        catch (System.Exception ee)
        {
            Response.Write(ee.Message.ToString());
        }
        if (GridView2.Rows.Count == 0)
            Response.Write("<script>alert('没有所要查询的信息！')</script>");
    }

    protected void Button1_Click(object sender, EventArgs e)//已预订航班;
    {
        booked_flight_1();
        GridView1.Visible = true;
        GridView2.Visible = false;
    }

    protected void Button2_Click(object sender, EventArgs e)//已出票航班;
    {
        confirmed_flight_1();
        GridView1.Visible = false;
        GridView2.Visible = true;
    }
    
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow row = GridView1.SelectedRow;//通过Session在多个页面之间传值;
        Session["机票号"] = row.Cells[0].Text;
        Session["乘客证件号"] = row.Cells[1].Text;
        Session["航班号"] = row.Cells[2].Text;
        Session["订票者证件号"] = row.Cells[3].Text;
        Session["订票时间"] = row.Cells[4].Text;
    }

    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string strConnection = "Data Source=localhost;Initial Catalog=flight_ticket;Persist Security Info=True;User ID=sa;Password=sql";
        SqlConnection Connection = new SqlConnection(strConnection);
        String strsql = "DELETE FROM 订票 WHERE 机票号='" + GridView1.DataKeys[e.RowIndex].Value.ToString() + "'";
        SqlCommand command1 = new SqlCommand(strsql, Connection);
        Connection.Open();
        command1.ExecuteNonQuery();
        Connection.Close();
        SqlDataSource2.DeleteCommand = strsql;
        Response.Write("<script>alert('退票成功！');window.location.href ='我的航班.aspx'</script>");
    }

    protected void Button3_Click(object sender, EventArgs e)//返回;
    {
        Response.Redirect("查询机票2.aspx");
    }
}