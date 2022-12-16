using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EpicGamingStore.Admin
{
    public partial class AddProducts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Text = $"Utente Loggato: {User.Identity.Name}";
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
        public List<Categoria> CatList = new List<Categoria>() ;
        protected void Logout(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Response.Redirect(FormsAuthentication.LoginUrl);
        }

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

            p.Piattaforma = PiattaformaSelezionata.Remove(PiattaformaSelezionata.Length - 3, 3); //Pulisce la stringa di Piattaforma dagli ultimi caratteri
                                                                                                 // " - "
            

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
            


            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnStringEpicGaming"].ToString();
            con.Open();


            AddProduct(p, con);

            con.Close();
            

        }
        public void AddProduct(Prodotto p, SqlConnection con)
        {


            SqlCommand command = new SqlCommand();

            // AGGIUNTA DEI PARAMETRI RICHIESTI DA MARCO. NECESSARI? (IL METODO PREVEDE IL PASSAGGIO DI UN OGGETTO. è PIù SICURO?)
            command.Parameters.AddWithValue("@Nome", p.NomeProdotto);
            command.Parameters.AddWithValue("@Descrizione", p.DescrizioneProdotto);
            command.Parameters.AddWithValue("@Piattaforma", p.Piattaforma);
            command.Parameters.AddWithValue("@PrezzoInt", p.PrezzoIntero);
            command.Parameters.AddWithValue("@PrezzoSaldo", p.PrezzoSaldo);
            command.Parameters.AddWithValue("@InSaldo", p.InSaldo);
            command.Parameters.AddWithValue("@Sviluppatore", p.Sviluppatore);
            command.Parameters.AddWithValue("@Publisher", p.Publisher);
            command.Parameters.AddWithValue("@DataRilascio", p.DataRilascio); 
            command.Parameters.AddWithValue("@URLImg", p.URLImg); 
            command.Parameters.AddWithValue("@URLImgCopertina", p.URLImgCopertina);
            command.Parameters.AddWithValue("@Gallery1", p.URLGallery1);
            command.Parameters.AddWithValue("@Gallery2", p.URLGallery2);
            command.Parameters.AddWithValue("@Gallery3", p.URLGallery3);
            command.Parameters.AddWithValue("@Gallery4", p.URLGallery4);
            command.Parameters.AddWithValue("@VideoTrailer", p.URLVideoTrailer);
            command.Parameters.AddWithValue("@Category", p.IDCategoria);


            command.CommandText = "Insert into ProdottiTab values (@Nome, " +
                                                                  "@Descrizione, " +
                                                                  "@Piattaforma, " +
                                                                  "@PrezzoInt, " +
                                                                  "@PrezzoSaldo, " +
                                                                  "@InSaldo, " +
                                                                  "@Sviluppatore, " +
                                                                  "@Publisher," +
                                                                  "@DataRilascio, " +
                                                                  "@URLImg, " +
                                                                  "@URLImgCopertina, " +
                                                                  "@Gallery1," +
                                                                  "@Gallery2," +
                                                                  "@Gallery3, " +
                                                                  "@Gallery4," +
                                                                  "@VideoTrailer," +
                                                                  "@Category )";
                command.Connection = con;
            int row;

            try
            {
                row = command.ExecuteNonQuery();
                if (row > 0)
                {
                    LabelEX.Text = "Inserimento effettuato correttamente!";
                }
                else
                {
                    LabelEX.Text = "Inserimento non riuscito.";
                }
            }
            catch(Exception ex)
            {
                LabelEX.Text = ex.Message;
            }
            finally
            {
                Nome.Value = "";
                Descrizione.Value = "";
                foreach(ListItem cb in CheckBoxPiattaforma.Items)
                {
                    cb.Selected = false;
                }
                PrezzoIntero.Value = "";
                PrezzoSaldo.Value = "";
                InPromo.Checked = false;
                Sviluppatore.Value = "";
                Publisher.Value = "";
                DataRilascio.Value = "";
                FrontUpload.EnableViewState = false;
                CoverUpload.EnableViewState = false;
                Gallery1.EnableViewState = false;
                Gallery2.EnableViewState = false;
                Gallery3.EnableViewState = false;
                Gallery4.EnableViewState = false;
                VideoUrl.Value = "";
                DDLCategory.SelectedValue = DDLCategory.Items[0].Value;


            }
                
               
               

        }
    }
}