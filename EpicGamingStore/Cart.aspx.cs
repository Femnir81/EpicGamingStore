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
            if (!IsPostBack)
            {
                if (Cart.UserCart.Count != 0)
                {
                    ContenitoreGriglia.Visible = true;
                    ExMessage.Visible = false;
                    double totale = 0;
                    foreach (Prodotto item in Cart.UserCart)
                    {
                        if (item.InSaldo)
                        {
                            item.PrezzoIntero = item.PrezzoSaldo;
                        }
                        totale += item.PrezzoIntero;
                    }
                    SommaArticoli.Text = $"Totale acquisti: {totale.ToString("c2")}";
                }
                else
                {
                    ContenitoreGriglia.Visible = false;
                    ExMessage.Visible = true;
                    MessaggioCarrelloVuoto.Text = "Il carrello è vuoto, riempilo con qualche acquisto!";
                }
                GrigliaCarrello.DataSource = Cart.UserCart;
                GrigliaCarrello.DataBind();
            }                
        }


        public static List<Prodotto> UserCart = new List<Prodotto>();
        public static List<Prodotto> CurrentUserCart = new List<Prodotto>();

        protected void SvuotaCarrello(object sender, EventArgs e)
        {
            Cart.UserCart.Clear();
            ContenitoreGriglia.Visible = false;
            MessaggioCarrelloVuoto.Visible = true;
            MessaggioCarrelloVuoto.Text = "Il carrello è vuoto, riempilo con qualche acquisto!";
        }

        protected void EliminaArticolo(object sender, EventArgs e)
        {
            Button btn = (Button) sender;
            string id = btn.CommandArgument;
            Prodotto p = new Prodotto();
            foreach (Prodotto item in UserCart)
            {
                if (item.IDProdotto == Convert.ToInt32(id))
                {
                    p = item;
                }
            }
            UserCart.Remove(p);
            Response.Redirect("Cart.aspx");
        }
    }
}