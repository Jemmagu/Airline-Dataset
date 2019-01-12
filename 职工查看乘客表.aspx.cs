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

    protected void Button1_Click(object sender, EventArgs e)//查看订票;
    {
        Response.Redirect("职工管理界面.aspx");
    }

    protected void Button2_Click(object sender, EventArgs e)//查看乘客表;
    {
        Response.Write("<script>alert('此页面即为乘客表查看页面！')</script>");
    }

    protected void Button3_Click(object sender, EventArgs e)//查看乘客表;
    {
        Response.Redirect("职工登陆界面.aspx");
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow row = GridView1.SelectedRow;//通过Session在多个页面之间传值;
        Session["证件号"] = row.Cells[0].Text;
        Session["乘客密码"] = row.Cells[1].Text;
        Session["姓名"] = row.Cells[2].Text;
        Session["性别"] = row.Cells[3].Text;
        Session["手机"] = row.Cells[4].Text;
        Session["邮箱"] = row.Cells[5].Text;
        Session["地址"] = row.Cells[6].Text;
        Response.Redirect("修改乘客.aspx");
    }
    
}