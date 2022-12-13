using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EpicGamingStore
{
    public partial class Cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            foreach(Prodotto gameCart in Cart.UserCart)
            {
                itemCarrello.Text += $"<li>{gameCart.NomeProdotto.ToString()}";
            }
        }


        public static List<Prodotto> UserCart = new List<Prodotto>();

        protected void Button1_Click(object sender, EventArgs e)
        {
            Cart.UserCart.Clear();
            itemCarrello.Text = "Carrello svuotato!";
        }
    }
}