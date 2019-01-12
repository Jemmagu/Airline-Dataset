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

    }

    protected void Button1_Click(object sender, EventArgs e)//管理职工;
    {
        Response.Write("<script>alert('此页面即为职工管理页面！')</script>");
    }

    protected void Button2_Click(object sender, EventArgs e)//管理航班线;
    {
        Response.Redirect("查询航班线.aspx");
    }

    protected void Button3_Click(object sender, EventArgs e)//管理航班线;
    {
        Response.Redirect("管理员登陆界面.aspx");
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)//按钮;
    {
        GridViewRow drv = ((GridViewRow)(((LinkButton)(e.CommandSource)).Parent.Parent));
        Session["职工号"] = GridView1.Rows[drv.RowIndex].Cells[0].Text;
        Session["职工密码"] = GridView1.Rows[drv.RowIndex].Cells[1].Text;
        Session["姓名"] = GridView1.Rows[drv.RowIndex].Cells[2].Text;
        Session["工作机场"] = GridView1.Rows[drv.RowIndex].Cells[3].Text;
        Session["性别"] = GridView1.Rows[drv.RowIndex].Cells[4].Text;
        Session["手机"] = GridView1.Rows[drv.RowIndex].Cells[5].Text;
        Session["邮箱"] = GridView1.Rows[drv.RowIndex].Cells[6].Text;
        Session["地址"] = GridView1.Rows[drv.RowIndex].Cells[7].Text;
        if (e.CommandName == "New")
        {
            Response.Redirect("新增职工.aspx");
        }
        if (e.CommandName == "Modify")
        {
            Response.Redirect("修改职工.aspx");
        }
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow row = GridView1.SelectedRow;//通过Session在多个页面之间传值;
        Session["职工号"] = row.Cells[0].Text;
        Session["职工密码"] = row.Cells[1].Text;
        Session["姓名"] = row.Cells[2].Text;
        Session["工作机场"] = row.Cells[3].Text;
        Session["性别"] = row.Cells[4].Text;
        Session["手机"] = row.Cells[5].Text;
        Session["邮箱"] = row.Cells[6].Text;
        Session["地址"] = row.Cells[7].Text;
    }

    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string strConnection = "Data Source=localhost;Initial Catalog=flight_ticket;Persist Security Info=True;User ID=sa;Password=sql";
        SqlConnection Connection = new SqlConnection(strConnection);
        String strsql = "DELETE FROM 职工 WHERE 职工号='" + GridView1.DataKeys[e.RowIndex].Value.ToString() + "'";
        SqlCommand command1 = new SqlCommand(strsql, Connection);
        Connection.Open();
        command1.ExecuteNonQuery();
        Connection.Close();
        SqlDataSource1.DeleteCommand = strsql;
        Response.Write("<script>alert('职工信息删除成功！');window.location.href ='管理员管理界面.aspx'</script>");
    }
}