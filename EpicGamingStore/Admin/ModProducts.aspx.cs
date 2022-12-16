using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
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
        public static List<Categoria> CatList = new List<Categoria>();
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
                    PrezzoIntero.Value = reader["PrezzoIntero"].ToString();
                    PrezzoSaldo.Value = reader["PrezzoSaldo"].ToString();
                    InSaldo.Checked = Convert.ToBoolean(reader["InSaldo"]);
                    Sviluppatore.Value = reader["Sviluppatore"].ToString();
                    Publisher.Value = reader["Publisher"].ToString();
                    DataRilascio.Value = Convert.ToDateTime(reader["DataRilascio"]).ToString("yyyy-MM-dd");
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
               CoverUpload.SaveAs(Server.MapPath("~/Assets/img/front/" + URLImgCopertina));
            }
            if (Gallery1.HasFile)
            {
                URLGallery1 = Gallery1.FileName;
                Gallery1.SaveAs(Server.MapPath("~/Assets/img/front/" + URLGallery1));
            }
            if (Gallery2.HasFile)
            {
                URLGallery2 = Gallery2.FileName;
                Gallery2.SaveAs(Server.MapPath("~/Assets/img/front/" + URLGallery2));
            }
            if (Gallery3.HasFile)
            {
                URLGallery3 = Gallery3.FileName;
                Gallery3.SaveAs(Server.MapPath("~/Assets/img/front/" + URLGallery3));
            }
            if (Gallery4.HasFile)
            {
                URLGallery4 = Gallery4.FileName;
                Gallery4.SaveAs(Server.MapPath("~/Assets/img/front/" + URLGallery4));
            }

            foreach (ListItem cb in CheckBoxPiattaforma.Items)
            {
                if (cb.Selected)
                {
                    PiattaformaSelezionata += $"{cb.Text} - ";
                }
            }

            PiattaformaSelezionata = PiattaformaSelezionata.Remove(PiattaformaSelezionata.Length - 3, 3);
            //int inSaldoBit = 0;
            //if (InSaldo.Checked)
            //{
            //    inSaldoBit = 1;
            //}

            int id = Convert.ToInt32(Request.QueryString["idprod"]);
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnStringEpicGaming"].ToString();
            con.Open();

            SqlCommand command = new SqlCommand();
            command.CommandText = $"UPDATE ProdottiTab SET NomeProdotto='{Nome.Value}', DescrizioneProdotto='{Descrizione.Value}', Piattaforma='{PiattaformaSelezionata}', PrezzoIntero={Convert.ToDouble(PrezzoIntero.Value)}, PrezzoSaldo={Convert.ToDouble(PrezzoSaldo.Value)}, InSaldo='{InSaldo.Checked}', Sviluppatore='{Sviluppatore.Value}', Publisher='{Publisher.Value}', DataRilascio='{DataRilascio.Value}', URLImg='{URLImg}', URLImgCopertina='{URLImgCopertina}', URLGallery1='{URLGallery1}', URLGallery2='{URLGallery2}', URLGallery3='{URLGallery3}', URLGallery4='{URLGallery4}', URLVideoTrailer='{VideoUrl.Value}' , IDCategoria={Convert.ToInt32(DDLCategory.SelectedValue)} WHERE IDProdotto={id}";
            command.Connection = con;
            int row = command.ExecuteNonQuery();
            if (row > 0)
            {
                LabelEX.Text = "Ins Effettuato correttamente!";
            }
            else
            {
                LabelEX.Text = "Sei uno stronzo";
            }

            con.Close();
        }
    }
}