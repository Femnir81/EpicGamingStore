using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EpicGamingStore.Admin
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Text = $"Utente Loggato: {User.Identity.Name}";
            this.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;
        }
        protected void Logout(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Response.Redirect(FormsAuthentication.LoginUrl);
        }
        protected void RegisterAdmin(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnStringEpicGaming"].ToString();
            con.Open();

            SqlCommand command = new SqlCommand();
            command.Connection = con;

            
            if(ComparePswValidator.IsValid) 
            {
                command.Parameters.AddWithValue("@Username", Username1.Value);
                command.Parameters.AddWithValue("@Password", Password1.Value);
                command.CommandText = "insert into AdminTab values (@Username, @Password)";
                command.ExecuteNonQuery();
            }
            else 
            {
               
                    PswError.Visible = true;
                    PswError.ForeColor = Color.Red;
                    PswError.Text = ComparePswValidator.ErrorMessage;
            }

            con.Close();




            //if(Password1.Value == Password2.Value && Password1.Value != null)
            //{
            //    command.CommandText = "insert into AdminTab values (@Username, @Password)";
            //    int row = command.ExecuteNonQuery();
            //    if (row > 0)
            //    {
            //        Error.Visible = true;
            //        Error.ForeColor = Color.Green;
            //        Error.Text = "Utente registrato correttamente.";
            //    }
            //    else
            //    {
            //        Error.Visible = true;
            //        Error.ForeColor = Color.Red;
            //        Error.Text = "Registrazione fallita, riprova!";
            //    }
            //}
            //else
            //{
            //    Error.Visible = true;
            //    Error.ForeColor = Color.Red;
            //    Error.Text = "Registrazione fallita, riprova!";
            //    Username1.Value= null;
            //    Password1.Value= null;
            //    Password2.Value = null;
            //}
        }
    }
}