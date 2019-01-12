using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

public partial class 用户注册 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e) {}

    protected void Button1_Click(object sender, EventArgs e)//确定;
    {
        if (TextBox1.Text == "" || TextBox2.Text == "" || TextBox3.Text == "" || TextBox4.Text == "" || TextBox5.Text == "" || TextBox6.Text == "" || TextBox7.Text == "")
        {
            Response.Write("<script>alert('输入信息不完整，请填写完整个人信息!')</script>");
        }
        if ((TextBox3.Text !="" || TextBox4.Text != "") && TextBox3.Text != TextBox4.Text)
        {
            Response.Write("<script>alert('两次输入的密码不一致，请重新输入!');window.location.href ='用户注册.aspx'</script>");
        }
        else//可以进行注册;
        {
            string strConnection = "Data Source=localhost;Initial Catalog=flight_ticket;Persist Security Info=True;User ID=sa;Password=sql";
            SqlConnection Connection = new SqlConnection(strConnection);
            String strsql = "INSERT INTO 乘客 VALUES('" + TextBox2.Text.ToString() + "','" + TextBox3.Text.ToString() + "','" + TextBox1.Text.ToString() + "','" +TextBox5.Text.ToString() + "','" + TextBox6.Text.ToString() + "','" + TextBox7.Text.ToString() + "','" + TextBox8.Text.ToString() + "')";
            SqlCommand command1 = new SqlCommand(strsql, Connection);
            
            string sql = "SELECT 证件号 FROM 乘客";
            SqlCommand command = new SqlCommand(sql, Connection);

            SqlDataReader Dr;
            Connection.Open();
            Dr = command.ExecuteReader();
            bool boolReturnValue = false;
            while (Dr.Read())//判断该用户是否注册过，以证件号为依据;
            {
                if (TextBox2.Text.ToString() == Dr["证件号"].ToString())
                {
                    boolReturnValue = true;
                }
            }
            Dr.Close();
            Connection.Close();
            if (boolReturnValue == true)
            {
                Response.Write("<script>alert('该用户已经注册过!');window.location.href ='用户注册.aspx'</script>");
            }
            else
            {
                Connection.Open();
                command1.ExecuteNonQuery();
                Connection.Close();

                Response.Write("<script>alert('注册成功！');window.location.href ='用户登陆界面.aspx'</script>");
            }
        }
    }

    protected void Button2_Click(object sender, EventArgs e)//取消;
    {
        Response.Redirect("用户登陆界面.aspx");
    }

}