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
        TextBox4.Text = (string)Session["航班号"];
        TextBox5.Text = (string)Session["起飞机场"];
        TextBox6.Text = (string)Session["到达机场"];
        TextBox7.Text = (string)Session["起飞时间"];
        TextBox8.Text = (string)Session["机票号"];
        TextBox4.Enabled = false;
        TextBox5.Enabled = false;
        TextBox6.Enabled = false;
        TextBox7.Enabled = false;
        TextBox8.Enabled = false;
    }

    protected void Button1_Click(object sender, EventArgs e)//确定预订信息;
    {
        if (TextBox1.Text == "" || TextBox2.Text == "" || TextBox3.Text == "")
        {
            Response.Write("<script>alert('输入信息不完整，请填写完整乘客信息!')</script>");
        }
        else
        {
            string strConnection = "Data Source=localhost;Initial Catalog=flight_ticket;Persist Security Info=True;User ID=sa;Password=sql";
            SqlConnection Connection = new SqlConnection(strConnection);
            String strsql = "INSERT INTO 订票(机票号,乘客证件号,订票者证件号,航班号) VALUES('" + TextBox8.Text.ToString() + "','" + TextBox2.Text.ToString() + "', '" + (string)Session["登录号"] + "' ,'" + TextBox4.Text.ToString() + "')";
            SqlCommand command1 = new SqlCommand(strsql, Connection);
            //航班线座位数-1;
            String strsql0 = "UPDATE 航班线 SET 座位数=座位数-1 WHERE 航班号='" + TextBox4.Text.ToString() + "'";
            SqlCommand command0 = new SqlCommand(strsql0, Connection);

            String strsql2 = "INSERT INTO 乘客(姓名,证件号,手机) VALUES('" + TextBox1.Text.ToString() + "','" + TextBox2.Text.ToString() + "' ,'" + TextBox3.Text.ToString() + "')";
            SqlCommand command2 = new SqlCommand(strsql2, Connection);//同时插入到乘客表;
            String strsql3 = "UPDATE 乘客 SET 姓名='" + TextBox1.Text.ToString() + "',手机='" + TextBox3.Text.ToString() + "' WHERE 证件号='" + TextBox2.Text.ToString() + "'";
            SqlCommand command3 = new SqlCommand(strsql3, Connection);//若乘客表中已存在,则更新乘客信息;

            string sql = "SELECT 航班号,乘客证件号 FROM 订票";
            SqlCommand command = new SqlCommand(sql, Connection);
            string sql2 = "SELECT 证件号 FROM 乘客";
            SqlCommand command22 = new SqlCommand(sql2, Connection);

            SqlDataReader Dr;
            Connection.Open();
            Dr = command.ExecuteReader();
            bool boolReturnValue = false;
            while (Dr.Read())//判断该乘客是否预订过该航班;
            {
                if (TextBox2.Text.ToString() == Dr["乘客证件号"].ToString() && TextBox4.Text.ToString() == Dr["航班号"].ToString())
                {
                    boolReturnValue = true;
                }
            }
            Dr.Close();
            Connection.Close();
            if (boolReturnValue == true)
            {
                Response.Write("<script>alert('该乘客已经预订过该航班，请重新输入信息!');window.location.href ='乘客订机票.aspx'</script>");
            }
            else
            {
                Connection.Open();
                command0.ExecuteNonQuery();
                command1.ExecuteNonQuery();
                Connection.Close();
                //Connection.Open();
                //Connection.Close();
                //Response.Write("<script>alert('预订成功，请等待审核！');window.location.href ='查询机票2.aspx'</script>");
            }
            
            SqlDataReader Dr2;
            Connection.Open();
            Dr2 = command22.ExecuteReader();
            bool boolReturnValue2 = false;
            while (Dr2.Read())//判断该乘客是否已在乘客表中;
            {
                if (TextBox2.Text.ToString() == Dr2["证件号"].ToString())
                {
                    boolReturnValue2 = true;
                }
            }
            Dr2.Close();
            Connection.Close();
            Connection.Open();
            if (boolReturnValue2 == true)
                command3.ExecuteNonQuery();
            else//不在乘客表中则插入;
                command2.ExecuteNonQuery();
            Connection.Close();
            Response.Write("<script>alert('预订成功，请等待审核！');window.location.href ='查询机票2.aspx'</script>");
        }
    }

    protected void Button2_Click(object sender, EventArgs e)//取消;
    {
        Response.Redirect("查询机票2.aspx");
    }
}