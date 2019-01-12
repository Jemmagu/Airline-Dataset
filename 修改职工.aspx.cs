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
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            TextBox1.Text = (string)Session["姓名"];
            TextBox2.Text = (string)Session["职工号"];
            TextBox3.Text = (string)Session["职工密码"];
            TextBox4.Text = (string)Session["职工密码"];
            TextBox5.Text = (string)Session["性别"];
            TextBox6.Text = (string)Session["手机"];
            TextBox7.Text = (string)Session["邮箱"];
            TextBox8.Text = (string)Session["工作机场"];
            TextBox2.Enabled=false;
        }
    }

    protected void Button1_Click(object sender, EventArgs e)//确定;
    {
        if (TextBox1.Text == "" || TextBox3.Text == "" || TextBox4.Text == "" || TextBox5.Text == "" || TextBox8.Text == "")
        {
            Response.Write("<script>alert('输入信息不完整，请填写完整职工信息!')</script>");
        }
        if ((TextBox3.Text !="" || TextBox4.Text != "") && TextBox3.Text != TextBox4.Text)
        {
            Response.Write("<script>alert('两次输入的密码不一致，请重新输入!');window.location.href ='新增职工.aspx'</script>");
        }
        else//可以进行修改;
        {
            string strConnection = "Data Source=localhost;Initial Catalog=flight_ticket;Persist Security Info=True;User ID=sa;Password=sql";
            SqlConnection Connection = new SqlConnection(strConnection);
            String strsql = "UPDATE 职工 SET 姓名='" + TextBox1.Text.ToString() + "',职工密码='" + TextBox3.Text.ToString() + "',性别='" + TextBox5.Text.ToString() + "',手机='" +TextBox6.Text.ToString() + "',邮箱='" + TextBox7.Text.ToString() + "',工作机场='" + TextBox8.Text.ToString() + "' WHERE 职工号='" + TextBox2.Text.ToString() + "'";
            SqlCommand command1 = new SqlCommand(strsql, Connection);
            
            string sql = "SELECT * FROM 职工 WHERE 职工号='" + TextBox2.Text.ToString() + "'";
            SqlCommand command = new SqlCommand(sql, Connection);

            SqlDataReader Dr;
            Connection.Open();
            Dr = command.ExecuteReader();
            bool boolReturnValue = false;
            while (Dr.Read())//判断该职工信息是否由改动;
            {
                if (TextBox1.Text.ToString() == Dr["姓名"].ToString() && TextBox3.Text.ToString() == Dr["职工密码"].ToString() && TextBox5.Text.ToString() == Dr["性别"].ToString() && TextBox6.Text.ToString() == Dr["手机"].ToString() && TextBox7.Text.ToString() == Dr["邮箱"].ToString() && TextBox8.Text.ToString() == Dr["工作机场"].ToString())
                {
                    boolReturnValue = true;
                }
            }
            Dr.Close();
            Connection.Close();
            if (boolReturnValue == true)
            {
                Response.Write("<script>alert('该职工信息没有任何修改!');window.location.href ='修改职工.aspx'</script>");
            }
            else
            {
                Connection.Open();
                command1.ExecuteNonQuery();
                Connection.Close();

                Response.Write("<script>alert('职工信息修改成功！');window.location.href ='管理员管理界面.aspx'</script>");
            }
        }
    }

    protected void Button2_Click(object sender, EventArgs e)//取消;
    {
        Response.Redirect("管理员管理界面.aspx");
    }

}