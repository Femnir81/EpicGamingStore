using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EpicGamingStore.Admin
{
    public partial class ModProducts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            int id = Convert.ToInt32(Request.QueryString["idprod"]);
            if(!IsPostBack)
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
                foreach (Categoria c in CatList)
                {
                    ListItem l = new ListItem(c.NomeCategoria, c.IDCategoria.ToString());
                    DDLCategory.Items.Add(l);
                }

                con.Open();
                GetProduct(id, con);
                con.Close();

            }
        }
        public List<Categoria> CatList = new List<Categoria>();
        static string URLImg;
        static string URLImgCopertina;
        static string URLGallery1;
        static string URLGallery2;
        static string URLGallery3;
        static string URLGallery4;


        public void GetProduct(int id, SqlConnection connection)
        {

            //SqlConnection con = new SqlConnection();
            //con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnStringEpicGaming"].ToString();
            //con.Open();

            SqlCommand command = new SqlCommand();
            command.CommandText= $"select * from ProdottiTab where IDProdotto = {id}";
            command.Connection= connection;
            SqlDataReader reader= command.ExecuteReader();

            
            if (reader.HasRows)
            {
                while(reader.Read())
                {
                    Nome.Value = reader["NomeProdotto"].ToString();
                    Descrizione.Value = reader["DescrizioneProdotto"].ToString();
                    foreach(ListItem cb in CheckBoxPiattaforma.Items)
                    {
                        if(reader["Piattaforma"].ToString().ToUpper().Contains(cb.Text.ToUpper()))
                        {
                            cb.Selected= true;
                        }
                    }
                    PrezzoIntero.Value = Convert.ToDouble(reader["PrezzoIntero"]).ToString("0.00");  //Formattazione per la doppia cifra decimale
                    PrezzoSaldo.Value = Convert.ToDouble(reader["PrezzoSaldo"]).ToString("0.00");
                    InSaldo.Checked = Convert.ToBoolean(reader["InSaldo"]);
                    Sviluppatore.Value = reader["Sviluppatore"].ToString();
                    Publisher.Value = reader["Publisher"].ToString();
                    //DataRilascio.Value = Convert.ToDateTime(reader["DataRilascio"]).ToString("yyyy-MM-dd");

                    if (reader["DataRilascio"] != DBNull.Value) 
                    {
                        DataRilascio.Value = Convert.ToDateTime(reader["DataRilascio"]).ToString("yyyy-MM-dd");
                    }
                  
                    //DataRilascio.Value = Convert.ToDateTime(reader["DataRilascio"]).ToString("yyyy-MM-dd");

                    URLImg = reader["URLImg"].ToString();
                    URLImgCopertina = reader["URLImgCopertina"].ToString();
                    URLGallery1 = reader["URLGallery1"].ToString();
                    URLGallery2 = reader["URLGallery2"].ToString();
                    URLGallery3 = reader["URLGallery3"].ToString();
                    URLGallery4 = reader["URLGallery4"].ToString();
                    VideoUrl.Value = reader["URLVideoTrailer"].ToString();
                    DDLCategory.SelectedValue = reader["IDCategoria"].ToString();


                }
            }

        }
        protected void Logout(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Response.Redirect(FormsAuthentication.LoginUrl);
        }

        protected void UpdateBtn_Click(object sender, EventArgs e)
        {
            string PiattaformaSelezionata = "";
            if (FrontUpload.HasFile)
            {
                URLImg = FrontUpload.FileName;
                FrontUpload.SaveAs(Server.MapPath("~/Assets/img/front/" + URLImg));
            }
            if (CoverUpload.HasFile)
            {
                URLImgCopertina = CoverUpload.FileName;
               CoverUpload.SaveAs(Server.MapPath("~/Assets/img/copertina/" + URLImgCopertina));
            }
            if (Gallery1.HasFile)
            {
                URLGallery1 = Gallery1.FileName;
                Gallery1.SaveAs(Server.MapPath("~/Assets/img/gallery/" + URLGallery1));
            }
            if (Gallery2.HasFile)
            {
                URLGallery2 = Gallery2.FileName;
                Gallery2.SaveAs(Server.MapPath("~/Assets/img/gallery/" + URLGallery2));
            }
            if (Gallery3.HasFile)
            {
                URLGallery3 = Gallery3.FileName;
                Gallery3.SaveAs(Server.MapPath("~/Assets/img/gallery/" + URLGallery3));
            }
            if (Gallery4.HasFile)
            {
                URLGallery4 = Gallery4.FileName;
                Gallery4.SaveAs(Server.MapPath("~/Assets/img/gallery/" + URLGallery4));
            }

            foreach (ListItem cb in CheckBoxPiattaforma.Items)
            {
                if (cb.Selected)
                {
                    PiattaformaSelezionata += $"{cb.Text} - ";
                }
            }

            PiattaformaSelezionata = PiattaformaSelezionata.Remove(PiattaformaSelezionata.Length - 3, 3);
            
            
            int id = Convert.ToInt32(Request.QueryString["idprod"]);     //  ---> Riprende l'IDProdotto dalla query-string


            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnStringEpicGaming"].ToString();
            con.Open();

            SqlCommand command = new SqlCommand();

            //Comm Params
            command.Parameters.AddWithValue("@Nome", Nome.Value);
            command.Parameters.AddWithValue("@Descrizione", Descrizione.Value);
            command.Parameters.AddWithValue("@Piattaforma", PiattaformaSelezionata);
            command.Parameters.AddWithValue("@PrezzoInt", Convert.ToDouble(PrezzoIntero.Value));
            command.Parameters.AddWithValue("@PrezzoSaldo", Convert.ToDouble(PrezzoSaldo.Value));
            command.Parameters.AddWithValue("@InSaldo", InSaldo.Checked);
            command.Parameters.AddWithValue("@Sviluppatore", Sviluppatore.Value);
            command.Parameters.AddWithValue("@Publisher", Publisher.Value);
            if(Convert.ToInt32(DDLCategory.SelectedValue) != 7) {
                command.Parameters.AddWithValue("@DataRilascio", DataRilascio.Value);
            }
            else
            {
                command.Parameters.AddWithValue("@DataRilascio", DBNull.Value);
            }
            //command.Parameters.AddWithValue("@DataRilascio", DataRilascio.Value);
            command.Parameters.AddWithValue("@FrontImg", URLImg);
            command.Parameters.AddWithValue("@CoverImg",URLImgCopertina);
            command.Parameters.AddWithValue("@Gallery1", URLGallery1);
            command.Parameters.AddWithValue("@Gallery2", URLGallery2);
            command.Parameters.AddWithValue("@Gallery3", URLGallery3);
            command.Parameters.AddWithValue("@Gallery4", URLGallery4);
            command.Parameters.AddWithValue("@VideoTrailer", VideoUrl.Value);
            command.Parameters.AddWithValue("@Category", Convert.ToInt32(DDLCategory.SelectedValue));


            command.CommandText = $"UPDATE ProdottiTab SET NomeProdotto= @Nome, " +
                                                         $"DescrizioneProdotto= @Descrizione, " +
                                                         $"Piattaforma= @Piattaforma, " +
                                                         $"PrezzoIntero= @PrezzoInt, " +
                                                         $"PrezzoSaldo= @PrezzoSaldo, " +
                                                         $"InSaldo= @InSaldo, " +
                                                         $"Sviluppatore= @Sviluppatore, " +
                                                         $"Publisher= @Publisher, " +
                                                         $"DataRilascio= @DataRilascio, " +
                                                         $"URLImg= @FrontImg, " +
                                                         $"URLImgCopertina= @CoverImg, " +
                                                         $"URLGallery1= @Gallery1, " +
                                                         $"URLGallery2= @Gallery2, " +
                                                         $"URLGallery3= @Gallery3, " +
                                                         $"URLGallery4= @Gallery4, " +
                                                         $"URLVideoTrailer= @VideoTrailer ," +
                                                         $"IDCategoria= @Category " +
                                                         $"WHERE IDProdotto={id}";
            command.Connection = con;
            int row;
            try 
            {
                row = command.ExecuteNonQuery();
                if (row > 0)
                {
                    LabelEX.Text = "Modifica prodotto eseguita correttamente";
                }
                else
                {
                    LabelEX.Text = "Modifica prodotto non riuscita";
                }
            }
            catch(Exception ex)
            {
                LabelEX.Text = ex.Message;
            }
            finally
            {
                Response.Redirect("/Admin/Inventory.aspx");
            }
            

            con.Close();


        }
    }
}