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
            TextBox1.Enabled = false;//不允许修改航班号;
        }
    }

    protected void Button1_Click(object sender, EventArgs e)//确定修改;
    {
        DateTimeFormatInfo dtFormat = new System.Globalization.DateTimeFormatInfo();//将字符串转化为datetime;
        dtFormat.ShortDatePattern = "yyyy-MM-dd hh:mm";
        DateTime dt1 = Convert.ToDateTime(TextBox5.Text, dtFormat);
        DateTime dt2 = Convert.ToDateTime(TextBox6.Text, dtFormat);
        if (TextBox2.Text == "" || TextBox3.Text == "" || TextBox4.Text == "" || TextBox5.Text == "" || TextBox6.Text == "")
        {
            Response.Write("<script>alert('输入信息不完整，请填写完整航班线信息!')</script>");
        }
        else if(Convert.ToInt32(TextBox2.Text)<0)//座位数<0;
        {
            Response.Write("<script>alert('航班线座位数不可以小于0，请重新输入!')</script>");
        }
        else if (TextBox3.Text == TextBox4.Text)//起飞机场和到达机场相同;
        {
            Response.Write("<script>alert('起飞机场和到达机场相同，请重新输入!')</script>");
        }
        else if (dt1 >= dt2)//起飞时间晚于到达时间;
        {
            Response.Write("<script>alert('请重新检查起飞和到达时间!')</script>");
        }
        else//可以进行航班线登记;
        {
            string strConnection = "Data Source=localhost;Initial Catalog=flight_ticket;Persist Security Info=True;User ID=sa;Password=sql";
            SqlConnection Connection = new SqlConnection(strConnection);
            String strsql = "UPDATE 航班线 SET 起飞机场='" + TextBox3.Text.ToString() + "',到达机场='" + TextBox4.Text.ToString() + "',起飞时间='" + TextBox5.Text.ToString() + "',到达时间='" + TextBox6.Text.ToString() + "',飞行距离='" + TextBox7.Text.ToString() + "',座位数='" + TextBox2.Text.ToString() + "',价格='" + TextBox8.Text.ToString() + "' WHERE 航班号='" + TextBox1.Text.ToString() + "' ";
            SqlCommand command1 = new SqlCommand(strsql, Connection);
            
            string sql = "SELECT * FROM 航班线";
            SqlCommand command = new SqlCommand(sql, Connection);

            SqlDataReader Dr;
            Connection.Open();
            Dr = command.ExecuteReader();
            bool boolReturnValue = false;
            while (Dr.Read())//判断航班线是否有所修改;
            {
                if (TextBox2.Text.ToString() == Dr["座位数"].ToString() && TextBox3.Text.ToString() == Dr["起飞机场"].ToString() && TextBox4.Text.ToString() == Dr["到达机场"].ToString() && TextBox5.Text.ToString() == Dr["起飞时间"].ToString() && TextBox6.Text.ToString() == Dr["到达时间"].ToString() && TextBox7.Text.ToString() == Dr["飞行距离"].ToString() && TextBox8.Text.ToString() == Dr["价格"].ToString())
                {
                    boolReturnValue = true;
                }
            }
            Dr.Close();
            Connection.Close();
            if (boolReturnValue == true)
            {
                Response.Write("<script>alert('航班线信息没有任何修改，请重新输入!')</script>");
            }
            else
            {
                Connection.Open();
                command1.ExecuteNonQuery();
                Connection.Close();
                Response.Write("<script>alert('航班线信息修改成功！');window.location.href ='查询航班线.aspx'</script>");
            }
        }
    }

    protected void Button2_Click(object sender, EventArgs e)//取消;
    {
        Response.Redirect("查询航班线.aspx");
    }
}