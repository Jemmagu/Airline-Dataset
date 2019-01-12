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
        Response.Write("<script>alert('此页面即为订票表查看页面！')</script>");
    }

    protected void Button2_Click(object sender, EventArgs e)//查看乘客表;
    {
        Response.Redirect("职工查看乘客表.aspx");
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)//按钮;
    {
            GridViewRow drv = ((GridViewRow)(((LinkButton)(e.CommandSource)).Parent.Parent));
            Session["机票号"] = GridView1.Rows[drv.RowIndex].Cells[0].Text;
            Session["乘客证件号"] = GridView1.Rows[drv.RowIndex].Cells[1].Text;
            Session["航班号"] = GridView1.Rows[drv.RowIndex].Cells[2].Text;
            Session["订票者证件号"] = GridView1.Rows[drv.RowIndex].Cells[3].Text;
            Session["订票时间"] = GridView1.Rows[drv.RowIndex].Cells[4].Text;
        if (e.CommandName == "Check")
        {
            Response.Redirect("显示乘客信息.aspx");
        }
        if (e.CommandName == "Ok")
        {
            Response.Redirect("通过审核.aspx");
        }
        if (e.CommandName == "Deny")//未通过审核，删除相关订票信息，并令该航班线座位数+1;
        {
            string strConnection = "Data Source=localhost;Initial Catalog=flight_ticket;Persist Security Info=True;User ID=sa;Password=sql";
            SqlConnection Connection = new SqlConnection(strConnection);
            String strsql3 = "DELETE FROM 订票 WHERE 机票号= '" + (string)Session["机票号"] + "'";
            SqlCommand command3 = new SqlCommand(strsql3, Connection);
            String strsql4 = "UPDATE 航班线 SET 座位数=座位数+1 WHERE 航班号= '" + (string)Session["航班号"] + "'";
            SqlCommand command4 = new SqlCommand(strsql4, Connection);
            Connection.Open();
            command3.ExecuteNonQuery();
            command4.ExecuteNonQuery();
            Connection.Close();
            Response.Write("<script>alert('乘客未通过审核，已删除此订票信息！');window.location.href ='职工管理界面.aspx'</script>");
        }
    }
    
    protected void Button3_Click(object sender, EventArgs e)//退出;
    {
        Response.Redirect("职工登陆界面.aspx");
    }
}