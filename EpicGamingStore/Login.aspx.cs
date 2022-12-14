using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EpicGamingStore
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Invio_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnStringEpicGaming"].ToString();
            con.Open();

            SqlCommand command = new SqlCommand();

            command.CommandText = "Select * from AdminTab" ;
            command.Connection = con;
            SqlDataReader reader = command.ExecuteReader();
           
            List<AdminClass> ListAdmin = new List<AdminClass>(); 

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
        }

        
    }
}