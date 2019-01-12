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

public partial class 用户注册 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strConnection = "Data Source=localhost;Initial Catalog=flight_ticket;Persist Security Info=True;User ID=sa;Password=sql";
        SqlConnection Connection = new SqlConnection(strConnection);
        String strsql = "SELECT 姓名,手机 FROM 乘客 WHERE 证件号='" + (string)Session["乘客证件号"] + "'";
        SqlCommand command1 = new SqlCommand(strsql, Connection);
        String strsql2 = "SELECT 姓名,手机 FROM 乘客 WHERE 证件号='" + (string)Session["订票者证件号"] + "'";
        SqlCommand command2 = new SqlCommand(strsql2, Connection);

        SqlDataReader Dr;
        Connection.Open();
        Dr = command1.ExecuteReader();
        while (Dr.Read())
        {
            TextBox1.Text = Dr["姓名"].ToString();
            TextBox3.Text = Dr["手机"].ToString();
        }
        Dr.Close();
        Connection.Close();

        SqlDataReader Dr2;
        Connection.Open();
        Dr2 = command2.ExecuteReader();
        while (Dr2.Read())
        {
            TextBox6.Text = Dr2["姓名"].ToString();
            TextBox7.Text = Dr2["手机"].ToString();
        }
        Dr2.Close();
        Connection.Close();

        TextBox2.Text = (string)Session["乘客证件号"];
        TextBox4.Text = (string)Session["航班号"];
        TextBox5.Text = (string)Session["机票号"];
        TextBox8.Text = (string)Session["订票者证件号"];
        TextBox1.Enabled = false;
        TextBox2.Enabled = false;
        TextBox3.Enabled = false;
        TextBox4.Enabled = false;
        TextBox5.Enabled = false;
        TextBox6.Enabled = false;
        TextBox7.Enabled = false;
        TextBox8.Enabled = false;
    }

    protected void Button1_Click(object sender, EventArgs e)//确定;
    {
        Response.Redirect("职工管理界面.aspx");
    }
    
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("职工管理界面.aspx");
    }
}