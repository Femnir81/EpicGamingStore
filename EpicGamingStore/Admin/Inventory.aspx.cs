using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EpicGamingStore.Admin
{
    public partial class Inventory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            
            Label1.Text = $"Utente Loggato: {User.Identity.Name}";

            if (!IsPostBack)
            {
                Prodotto.getInventory(0).Clear();
                Prodotto.getInventory(0);
            }
            GrigliaInventario.DataSource = Prodotto.getInventory(0);
            GrigliaInventario.DataBind();
            
        }


        protected void Logout(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Response.Redirect(FormsAuthentication.LoginUrl);
        }

        protected void Elimina_Click(object sender, EventArgs e)
        {
            try
            {
                Button btn = (Button)sender;
                string id = btn.CommandArgument;
                Prodotto.DeleteProdotto(Convert.ToInt32(id));

                DeleteMessage.Visible = true;
                DeleteMessage.Text = "Il prodotto è stato eliminato correttamente";
                Response.Redirect("Inventory.aspx");


            }catch(Exception ex)
            {
                DeleteMessage.Visible = true;
                DeleteMessage.Text = ex.Message; 
            }
        }
    }
}