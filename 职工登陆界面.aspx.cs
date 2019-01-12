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
        String strSQL = "Select * From 职工";
        SqlCommand command = new SqlCommand(strSQL, Connection);
        SqlDataReader Dr;
        Dr = command.ExecuteReader();
        while (Dr.Read())
        {
            if ((UserName == Dr["职工号"].ToString()) & (Password == Dr["职工密码"].ToString()))
            {
                boolReturnValue = true;
                Session["职工号呢"] = UserName.ToString();
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
            Response.Redirect("职工管理界面.aspx");
        }
    }
}