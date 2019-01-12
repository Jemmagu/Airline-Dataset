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
            TextBox2.Text = (string)Session["证件号"];
            TextBox3.Text = (string)Session["乘客密码"];
            TextBox4.Text = (string)Session["乘客密码"];
            TextBox5.Text = (string)Session["性别"];
            TextBox6.Text = (string)Session["手机"];
            TextBox7.Text = (string)Session["邮箱"];
            TextBox8.Text = (string)Session["地址"];
            TextBox2.Enabled = false;
        }
    }

    protected void Button1_Click(object sender, EventArgs e)//确定;
    {
        if (TextBox1.Text == "" ||TextBox6.Text == "")
        {
            Response.Write("<script>alert('输入信息不完整，请填写完整乘客姓名、手机!')</script>");
        }
        if ((TextBox3.Text !="" || TextBox4.Text != "") && TextBox3.Text != TextBox4.Text)
        {
            Response.Write("<script>alert('两次输入的密码不一致，请重新输入!');window.location.href ='新增职工.aspx'</script>");
        }
        else//可以进行乘客信息修改;
        {
            string strConnection = "Data Source=localhost;Initial Catalog=flight_ticket;Persist Security Info=True;User ID=sa;Password=sql";
            SqlConnection Connection = new SqlConnection(strConnection);
            String strsql = "UPDATE 乘客 SET 乘客密码='" + TextBox3.Text.ToString() + "',姓名='" + TextBox1.Text.ToString() + "',性别='" +TextBox5.Text.ToString() + "',手机='" + TextBox6.Text.ToString() + "',邮箱='" + TextBox7.Text.ToString() + "',地址='" + TextBox8.Text.ToString() + "' WHERE 证件号='" + TextBox2.Text.ToString() + "'";
            SqlCommand command1 = new SqlCommand(strsql, Connection);

            string sql = "SELECT * FROM 乘客 WHERE 证件号='" + TextBox2.Text.ToString() + "'";
            //string sql = "SELECT * FROM 乘客 WHERE 证件号='" + TextBox2.Text.ToString() + "'";
            SqlCommand command = new SqlCommand(sql, Connection);

            SqlDataReader Dr;
            Connection.Open();
            Dr = command.ExecuteReader();
            bool boolReturnValue = false;
            while (Dr.Read())//判断信息是否有变动;
            {
                if (TextBox1.Text.ToString() == Dr["姓名"].ToString() && TextBox3.Text.ToString() == Dr["乘客密码"].ToString() && TextBox5.Text.ToString() == Dr["性别"].ToString() && TextBox6.Text.ToString() == Dr["手机"].ToString() && TextBox7.Text.ToString() == Dr["邮箱"].ToString() && TextBox8.Text.ToString() == Dr["地址"].ToString())
                {
                    boolReturnValue = true;
                }
            }
            Dr.Close();
            Connection.Close();
            if (boolReturnValue == true)
            {
                Response.Write("<script>alert('该乘客信息没有任何修改!');window.location.href ='修改乘客.aspx'</script>");
            }
            else
            {
                Connection.Open();
                command1.ExecuteNonQuery();
                Connection.Close();

                Response.Write("<script>alert('乘客信息修改成功！');window.location.href ='职工查看乘客表.aspx'</script>");
            }
        }
    }

    protected void Button2_Click(object sender, EventArgs e)//取消;
    {
        Response.Redirect("职工查看乘客表.aspx");
    }

}