using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EpicGamingStore.Admin
{
    public partial class AddProducts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            foreach (ListItem item in CheckBoxPiattaforma.Items)
            {
                item.Attributes.Add("style", "margin-bottom:25px, margin-left:10px"); 
            }
            if (!IsPostBack) 
            {
                SqlConnection con = new SqlConnection();
                con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnStringEpicGaming"].ToString();
                con.Open();
                SqlCommand command = new SqlCommand();
                command.CommandText = "SELECT * from CategorieTab";
                command.Connection = con;
                SqlDataReader reader = command.ExecuteReader();
                if (reader.HasRows) 
                {
                    while (reader.Read()) 
                    { 
                        Categoria categoria = new Categoria();
                        categoria.IDCategoria = Convert.ToInt32(reader["IDCategoria"]);
                        categoria.NomeCategoria = reader["NomeCategoria"].ToString();
                        CatList.Add(categoria);
                    }
                }
                con.Close();
                foreach(Categoria c in CatList) 
                { 
                    ListItem l = new ListItem(c.NomeCategoria, c.IDCategoria.ToString());
                    DDLCategory.Items.Add(l);
                }
            }
        }
        public static List<Categoria> CatList = new List<Categoria>() ;

        protected void Aggiungi_Click(object sender, EventArgs e)
        {
            Prodotto p = new Prodotto();
            p.NomeProdotto = Nome.Value;
            p.DescrizioneProdotto = Descrizione.Value;
            p.PrezzoIntero = Convert.ToInt32(PrezzoIntero.Value);
            p.PrezzoSaldo = Convert.ToInt32(PrezzoSaldo.Value);
            p.Sviluppatore = Sviluppatore.Value;
            p.Publisher = Publisher.Value;
            p.DataRilascio = DataRilascio.Value;
            p.URLVideoTrailer = VideoUrl.Value;

            string PiattaformaSelezionata = "";

            foreach (ListItem cb in CheckBoxPiattaforma.Items) 
            {
                if (cb.Selected) 
                { 
                    PiattaformaSelezionata += $"{cb.Text} - ";
                }
            }

            p.Piattaforma = PiattaformaSelezionata.Remove(PiattaformaSelezionata.Length - 3, 3);
            
            

            p.InSaldo = InPromo.Checked;

            string FrontName = FrontUpload.FileName;
            FrontUpload.SaveAs(Server.MapPath("~/Assets/img/front/"+ FrontName));

            string CoverName = CoverUpload.FileName;
            CoverUpload.SaveAs(Server.MapPath("~/Assets/img/copertina/" + CoverName));

            string Gallery1Name = Gallery1.FileName;
            Gallery1.SaveAs(Server.MapPath("~/Assets/img/gallery/" + Gallery1Name));

            string Gallery2Name = Gallery2.FileName;
            Gallery2.SaveAs(Server.MapPath("~/Assets/img/gallery/" + Gallery2Name));

            string Gallery3Name = Gallery3.FileName;
            Gallery3.SaveAs(Server.MapPath("~/Assets/img/gallery/" + Gallery3Name));

            string Gallery4Name = Gallery4.FileName;
            Gallery4.SaveAs(Server.MapPath("~/Assets/img/gallery/" + Gallery4Name));

            p.URLImg = FrontName;
            p.URLImgCopertina = CoverName;
            p.URLGallery1 = Gallery1Name;
            p.URLGallery2 = Gallery2Name;
            p.URLGallery3 = Gallery3Name;
            p.URLGallery4 = Gallery4Name;

            p.IDCategoria = Convert.ToInt32(DDLCategory.SelectedValue);
            //foreach(Categoria c in CatList) 
            //{ 
            //    if(c.IDCategoria == Convert.ToInt32(DDLCategory.SelectedValue)) 
            //    {
            //        p.NomeCategoria = c.NomeCategoria;
            //        break;
            //    }
            //}
            //AddProduct(p);


            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnStringEpicGaming"].ToString();
            con.Open();


            AddProduct(p, con);

            con.Close();
            

        }
        public void AddProduct(Prodotto p, SqlConnection con)
        {
            SqlCommand command = new SqlCommand();
                command.CommandText = $"Insert into ProdottiTab values ('{p.NomeProdotto}','{p.DescrizioneProdotto}','{p.Piattaforma}','{p.PrezzoIntero}','{p.PrezzoSaldo}','{p.InSaldo}','{p.Sviluppatore}','{p.Publisher}','{p.DataRilascio}','{p.URLImg}','{p.URLImgCopertina}','{p.URLGallery1}','{p.URLGallery2}','{p.URLGallery3}','{p.URLGallery4}','{p.URLVideoTrailer}','{p.IDCategoria}')";
                command.Connection = con;
                int row = command.ExecuteNonQuery();
                if(row > 0)
                {
                    LabelEX.Text = "Ins Effettuato correttamente!";
                }
                else
                {
                    LabelEX.Text = "Sei uno stronzo";
                }

        }
    }
}