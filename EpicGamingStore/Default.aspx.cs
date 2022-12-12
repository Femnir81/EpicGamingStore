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
            if (!IsPostBack)
            {
                Prodotto.getInventory(0).Clear();
                Prodotto.getInventory(0);
                
            }
            Repeater1.DataSource = Prodotto.getInventory(0);
            Repeater1.DataBind();
        }
    }
}