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
    }

    protected void Button2_Click(object sender, EventArgs e)//返回;
    {
        Response.Redirect("管理员管理界面.aspx");
    }

    protected void Button3_Click(object sender, EventArgs e)//登陆;
    {
        Response.Redirect("管理员登陆界面.aspx");
    }

    protected void Button1_Click(object sender, EventArgs e)//查询;
    {
        string strConnection = "Data Source=.;Initial Catalog=flight_ticket;Persist Security Info=True;User ID=sa;Password=sql";
        SqlConnection conn = new SqlConnection(strConnection);
        SqlDataAdapter ad = new SqlDataAdapter("SELECT * FROM 航班线 WHERE 航班号 = '" + DropDownList1.SelectedValue + "'", conn);
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
    
    protected void grvData_RowCommand(object sender, GridViewCommandEventArgs e)//按钮;
    {
            GridViewRow drv = ((GridViewRow)(((LinkButton)(e.CommandSource)).Parent.Parent));
            Session["航班号"] = GridView1.Rows[drv.RowIndex].Cells[0].Text;
            Session["起飞机场"] = GridView1.Rows[drv.RowIndex].Cells[1].Text;
            Session["到达机场"] = GridView1.Rows[drv.RowIndex].Cells[2].Text;
            Session["起飞时间"] = GridView1.Rows[drv.RowIndex].Cells[3].Text;
            Session["到达时间"] = GridView1.Rows[drv.RowIndex].Cells[4].Text;
            Session["座位数"] = GridView1.Rows[drv.RowIndex].Cells[5].Text;
            Session["飞行距离"] = GridView1.Rows[drv.RowIndex].Cells[6].Text;
        Session["机票价格"] = GridView1.Rows[drv.RowIndex].Cells[7].Text;
        if (e.CommandName == "New")
        {
            Response.Redirect("新增航班线.aspx");
        }
        if (e.CommandName == "Modify")
        {
            Response.Redirect("修改航班线.aspx");
        }
    }
    
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string strConnection = "Data Source=localhost;Initial Catalog=flight_ticket;Persist Security Info=True;User ID=sa;Password=sql";
        SqlConnection Connection = new SqlConnection(strConnection);
        String strsql = "DELETE FROM 航班线 WHERE 航班号='" + GridView1.DataKeys[e.RowIndex].Value.ToString() + "'";
        SqlCommand command1 = new SqlCommand(strsql, Connection);
        Connection.Open();
        command1.ExecuteNonQuery();
        Connection.Close();
        SqlDataSource3.DeleteCommand = strsql;
        Response.Write("<script>alert('此条航班线信息删除成功！');window.location.href ='查询航班线.aspx'</script>");
    }

    protected void Button4_Click(object sender, EventArgs e)//重置;
    {
        string strConnection = "Data Source=.;Initial Catalog=flight_ticket;Persist Security Info=True;User ID=sa;Password=sql";
        SqlConnection conn = new SqlConnection(strConnection);
        SqlDataAdapter ad = new SqlDataAdapter("SELECT * FROM 航班线", conn);
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
}