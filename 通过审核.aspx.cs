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
using System.Globalization;

public partial class 用户注册 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strConnection = "Data Source=localhost;Initial Catalog=flight_ticket;Persist Security Info=True;User ID=sa;Password=sql";
        SqlConnection Connection = new SqlConnection(strConnection);
        String strsql = "SELECT 起飞机场,到达机场,起飞时间,到达时间,价格 FROM 航班线 WHERE 航班号='" + (string)Session["航班号"] + "'";
        SqlCommand command1 = new SqlCommand(strsql, Connection);
        String strsql2 = "SELECT 姓名 FROM 乘客 WHERE 证件号='" + (string)Session["乘客证件号"] + "'";
        SqlCommand command2 = new SqlCommand(strsql2, Connection);

        SqlDataReader Dr;
        Connection.Open();
        Dr = command1.ExecuteReader();
        while (Dr.Read())
        {
            TextBox3.Text = Dr["起飞机场"].ToString();
            TextBox4.Text = Dr["到达机场"].ToString();
            TextBox7.Text = Dr["起飞时间"].ToString();
            TextBox8.Text = Dr["到达时间"].ToString();
            TextBox9.Text = Dr["价格"].ToString();
        }
        Dr.Close();
        Connection.Close();

        SqlDataReader Dr2;
        Connection.Open();
        Dr2 = command2.ExecuteReader();
        while (Dr2.Read())
        {
            TextBox5.Text = Dr2["姓名"].ToString();
        }
        Dr2.Close();
        Connection.Close();

        TextBox1.Text = (string)Session["机票号"];
        TextBox2.Text = (string)Session["航班号"];
        TextBox6.Text = (string)Session["乘客证件号"];

        TextBox1.Enabled = false;
        TextBox2.Enabled = false;
        TextBox3.Enabled = false;
        TextBox4.Enabled = false;
        TextBox5.Enabled = false;
        TextBox6.Enabled = false;
        TextBox7.Enabled = false;
        TextBox8.Enabled = false;
        TextBox9.Enabled = false;
    }

    protected void Button1_Click(object sender, EventArgs e)//确定;
    {
        if (TextBox10.Text == "")
        {
            Response.Write("<script>alert('输入信息不完整，请填写机票信息!')</script>");
        }
        else
        {
            //插入机票表中;
            string strConnection = "Data Source=localhost;Initial Catalog=flight_ticket;Persist Security Info=True;User ID=sa;Password=sql";
            SqlConnection Connection = new SqlConnection(strConnection);
            String strsql = "INSERT INTO 机票 VALUES('" + TextBox1.Text.ToString() + "','" + TextBox3.Text.ToString() + "','" + TextBox4.Text.ToString() + "','" +TextBox2.Text.ToString() + "','" + TextBox5.Text.ToString() + "','" + TextBox6.Text.ToString() + "','" + TextBox7.Text.ToString() + "','" + TextBox8.Text.ToString() + "','" + TextBox9.Text.ToString() + "','" + TextBox10.Text.ToString() + "')";
            SqlCommand command1 = new SqlCommand(strsql, Connection);
            //插入出票表中;
            String strsql2 = "INSERT INTO 出票(机票号,职工号,订票者证件号,乘客证件号,航班号) VALUES('" + (string)Session["机票号"] + "','" + (string)Session["职工号呢"] + "','" + (string)Session["订票者证件号"] + "','" + (string)Session["乘客证件号"] + "','" + (string)Session["航班号"] + "')";
            SqlCommand command2 = new SqlCommand(strsql2, Connection);
            //从订票表中删除;
            String strsql3 = "DELETE FROM 订票 WHERE 机票号= '" + (string)Session["机票号"] + "'";
            SqlCommand command3 = new SqlCommand(strsql3, Connection);

            Connection.Open();
            command1.ExecuteNonQuery();
            command2.ExecuteNonQuery();
            command3.ExecuteNonQuery();
            Connection.Close();
            Response.Write("<script>alert('机票信息登记成功！');window.location.href ='职工管理界面.aspx'</script>");
        }
    }

    protected void Button2_Click(object sender, EventArgs e)//取消;
    {
        Response.Redirect("职工管理界面.aspx");
    }

}