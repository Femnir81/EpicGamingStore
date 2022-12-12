using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Policy;
using System.Web;

namespace EpicGamingStore
{
    public class Prodotto
    {
        public int IDProdotto { get; set; }
        public string NomeProdotto { get; set; }
        public string DescrizioneProdotto { get; set; }
        public string Piattaforma { get; set; }
        public double PrezzoIntero { get; set; }
        public double PrezzoSaldo { get; set; }
        public bool InSaldo { get; set; }
        public string Sviluppatore { get; set; }
        public string Publisher { get; set; }
        public string DataRilascio { get; set; }
        public string URLImg { get; set; }
        public string URLImgCopertina { get; set; }
        public string URLGallery1 { get; set; }
        public string URLGallery2 { get; set; }
        public string URLGallery3 { get; set; }
        public string URLGallery4 { get; set; }
        public string URLVideoTrailer { get; set; }
        public int IDCategoria { get; set; }
        public string NomeCategoria { get; set; }

        //public static List<Prodotto> Inventory = new List<Prodotto>();

        //public static List<Prodotto> Cart = new List<Prodotto>();

        public static List<Prodotto> getInventory(int categoria)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnStringEpicGaming"].ToString();
            con.Open();

            SqlCommand command = new SqlCommand();

            if (categoria == 0)
            {
                command.CommandText = $"Select *, NomeCategoria from ProdottiTab" +
                    $" inner join CategorieTab on ProdottiTab.IDCategoria = CategorieTab.IDCategoria";               
            }
            else {
                command.CommandText = $"Select *, NomeCategoria from ProdottiTab" +
                    $" inner join CategorieTab on ProdottiTab.IDCategoria = CategorieTab.IDCategoria" +
                    $"where IDCategoria == {categoria}";
            }
            
            command.Connection= con;

            List<Prodotto> Inventory= new List<Prodotto>();

            String format = "dd MMM yyyy";

            SqlDataReader reader= command.ExecuteReader();

            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    Prodotto p = new Prodotto();
                    p.IDProdotto = Convert.ToInt32(reader["IDProdotto"]);
                    p.NomeProdotto = reader["NomeProdotto"].ToString();
                    p.DescrizioneProdotto = reader["DescrizioneProdotto"].ToString();
                    p.Piattaforma = reader["Piattaforma"].ToString();
                    p.PrezzoIntero = Convert.ToDouble(reader["PrezzoIntero"]);
                    p.PrezzoSaldo = Convert.ToDouble(reader["PrezzoSaldo"]);
                    p.InSaldo = Convert.ToBoolean(reader["InSaldo"]);
                    p.Sviluppatore = reader["Sviluppatore"].ToString();
                    p.Publisher = reader["Publisher"].ToString();
                    if (reader["DataRilascio"] == DBNull.Value)
                    {
                        p.DataRilascio = null;
                    }
                    else
                    {
                    p.DataRilascio = Convert.ToDateTime(reader["DataRilascio"]).ToString(format);
                    }
                    p.URLImg = reader["URLImg"].ToString();
                    p.URLImgCopertina = reader["URLImgCopertina"].ToString();
                    p.URLGallery1 = reader["URLGallery1"].ToString();
                    p.URLGallery2 = reader["URLGallery2"].ToString();
                    p.URLGallery3 = reader["URLGallery3"].ToString();
                    p.URLGallery4 = reader["URLGallery4"].ToString();
                    p.URLVideoTrailer = reader["UrlVideoTrailer"].ToString();
                    p.IDCategoria = Convert.ToInt32(reader["IDCategoria"]);
                    p.NomeCategoria = reader["NomeCategoria"].ToString();
                    Inventory.Add(p);    
                }
            }


            con.Close();

            return Inventory;
        }

      
    }
}