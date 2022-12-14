using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EpicGamingStore
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnStringEpicGaming"].ToString();
            con.Open();

            SqlCommand command = new SqlCommand();

            command.CommandText = "Select * from AdminTab";
            command.Connection = con;
            SqlDataReader reader = command.ExecuteReader();

            

            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    AdminClass admin = new AdminClass();
                    admin.IDAmministratore = Convert.ToInt32(reader["IDAmministratore"]);
                    admin.Username = Convert.ToString(reader["username"]);
                    admin.Password = Convert.ToString(reader["password"]);

                    ListAdmin.Add(admin);

                }
            }
            con.Close();
        }

        List<AdminClass> ListAdmin = new List<AdminClass>();
        protected void Logins(object sender, EventArgs e)
        {
            string username = Username1.Value;
            string password = Password1.Value;
            foreach(AdminClass item in ListAdmin)
            {
                if(username == item.Username && password == item.Password)
                {
                    FormsAuthentication.SetAuthCookie(username, true);
                    Response.Redirect(FormsAuthentication.DefaultUrl);

                }
                else
                {
                    Error.Visible = true;
                    Error.Text = "Le credenziali di accesso sono errate, riprova.";
                }
            }

        }

        
    }
}