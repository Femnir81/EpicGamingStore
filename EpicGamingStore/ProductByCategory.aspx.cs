using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EpicGamingStore
{
    public partial class ProductByCategory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            int category = Convert.ToInt32(Request.QueryString["idcat"]);

            Repeater1.DataSource = Prodotto.getInventory(category);
            Repeater1.DataBind();

            
            
        }
    }
}