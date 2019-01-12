using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Globalization;

public partial class 用户注册 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            TextBox1.Text = (string)Session["航班号"];
        TextBox2.Text = (string)Session["座位数"];
        TextBox3.Text = (string)Session["起飞机场"];
        TextBox4.Text = (string)Session["到达机场"];
        TextBox5.Text = (string)Session["起飞时间"];
        TextBox6.Text = (string)Session["到达时间"];
        TextBox7.Text = (string)Session["飞行距离"];
        TextBox8.Text = (string)Session["机票价格"];
        }
    }

    protected void Button1_Click(object sender, EventArgs e)//确定;
    {
        if (TextBox1.Text == "" || TextBox2.Text == "" || TextBox3.Text == "" || TextBox4.Text == "" || TextBox5.Text == "" || TextBox6.Text == "")
        {
            Response.Write("<script>alert('输入信息不完整，请填写完整航班线信息!')</script>");
        }
        if (TextBox3.Text == TextBox4.Text)//起飞机场和到达机场相同;
        {
            Response.Write("<script>alert('起飞机场和到达机场相同，请重新输入!')</script>");
        }
        DateTimeFormatInfo dtFormat = new System.Globalization.DateTimeFormatInfo();//将字符串转化为datetime;
        dtFormat.ShortDatePattern = "yyyy-MM-dd hh:mm";
        DateTime dt1 = Convert.ToDateTime(TextBox5.Text, dtFormat);
        DateTime dt2 = Convert.ToDateTime(TextBox6.Text, dtFormat);
        if (dt1 >= dt2)//起飞时间晚于到达时间;
        {
            Response.Write("<script>alert('请重新检查起飞和到达时间!')</script>");
        }
        else//可以进行航班线登记;
        {
            string strConnection = "Data Source=localhost;Initial Catalog=flight_ticket;Persist Security Info=True;User ID=sa;Password=sql";
            SqlConnection Connection = new SqlConnection(strConnection);
            String strsql = "INSERT INTO 航班线 VALUES('" + TextBox1.Text.ToString() + "','" + TextBox3.Text.ToString() + "','" + TextBox4.Text.ToString() + "','" + TextBox5.Text.ToString() + "','" + TextBox6.Text.ToString() + "','" + TextBox2.Text.ToString() + "','" + TextBox7.Text.ToString() + "','" + TextBox8.Text.ToString() + "')";
            SqlCommand command1 = new SqlCommand(strsql, Connection);
            
            string sql = "SELECT 航班号 FROM 航班线";
            SqlCommand command = new SqlCommand(sql, Connection);

            SqlDataReader Dr;
            Connection.Open();
            Dr = command.ExecuteReader();
            bool boolReturnValue = false;
            while (Dr.Read())//判断航班号是否已在记录内;
            {
                if (TextBox1.Text.ToString() == Dr["航班号"].ToString())
                {
                    boolReturnValue = true;
                }
            }
            Dr.Close();
            Connection.Close();
            if (boolReturnValue == true)
            {
                Response.Write("<script>alert('航班号已在航班表中，请重新输入!');window.location.href ='新增航班线.aspx'</script>");
            }
            else
            {
                Connection.Open();
                command1.ExecuteNonQuery();
                Connection.Close();

                Response.Write("<script>alert('航班线信息登记成功！');window.location.href ='查询航班线.aspx'</script>");
            }
        }
    }

    protected void Button2_Click(object sender, EventArgs e)//取消;
    {
        Response.Redirect("查询航班线.aspx");
    }

}