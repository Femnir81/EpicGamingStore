using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EpicGamingStore
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            string id = Request.QueryString["idcat"];
            if (!IsPostBack)
            {
                
                Prodotto.getInventory(0).Clear();
                Prodotto.getInventory(0);

                Categoria.getCategories().Clear();
                Categoria.getCategories();
                
            }
            if (id == null)
            {
            Repeater1.DataSource = Prodotto.getInventory(0);
            } else
            {
                Repeater1.DataSource = Prodotto.getInventory(Convert.ToInt32(id));
            }
            Repeater1.DataBind();

            RepeaterCat.DataSource = Categoria.getCategories();
            RepeaterCat.DataBind();
        }

        
    }
}