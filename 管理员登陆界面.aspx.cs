using System;
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
        String strSQL = "Select * From 管理员";
        SqlCommand command = new SqlCommand(strSQL, Connection);
        SqlDataReader Dr;
        Dr = command.ExecuteReader();
        while (Dr.Read())
        {
            if ((UserName == Dr["管理员号"].ToString()) & (Password == Dr["管理员密码"].ToString()))
            {
                boolReturnValue = true;
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
            Response.Redirect("管理员管理界面.aspx");
        }
    }
}