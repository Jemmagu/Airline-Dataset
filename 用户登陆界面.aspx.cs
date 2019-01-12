﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

public partial class 登陆界面 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    
    private bool SiteLevelCustomAuthenticationMethod(string UserName, string Password)
    {
        bool boolReturnValue = false;
        string strConnection = "Data Source=.;Initial Catalog=flight_ticket;User ID=sa;Password=sql";
        SqlConnection Connection = new SqlConnection(strConnection);
        Connection.Open();
        String strSQL = "Select * From 乘客";
        SqlCommand command = new SqlCommand(strSQL, Connection);
        SqlDataReader Dr;
        Dr = command.ExecuteReader();
        while (Dr.Read())
        {
            if ((UserName == Dr["证件号"].ToString()) & (Password == Dr["乘客密码"].ToString()))
            {
                boolReturnValue = true;
                Session["登录号"] = UserName.ToString();//用于之后查看该账户预订的所以航班;
            }
        }
        Dr.Close();
        return boolReturnValue;
    }

    protected void Login1_Authenticate1(object sender, AuthenticateEventArgs e)
    {
        bool Authenticated = false;
        Authenticated = SiteLevelCustomAuthenticationMethod(Login1.UserName, Login1.Password);
        e.Authenticated = Authenticated;
        if (Authenticated == true)
        {
            Response.Redirect("查询机票2.aspx");
        }
    }
}