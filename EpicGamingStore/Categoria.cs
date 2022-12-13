using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace EpicGamingStore
{
    public class Categoria
    {
        public int IDCategoria { get; set; }

        public string NomeCategoria { get; set; }

        //public List<Categoria> CategoryList = new List<Categoria>();

        public static List<Categoria> getCategories()
        {
            List<Categoria> Categories = new List<Categoria>();

            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnStringEpicGaming"].ToString();
            con.Open();

            SqlCommand command = new SqlCommand();
            command.CommandText = "SELECT * FROM CategorieTab";
            command.Connection = con;

            SqlDataReader reader = command.ExecuteReader();

            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    Categoria cat = new Categoria();

                    cat.IDCategoria = Convert.ToInt32(reader["IDCategoria"]);
                    cat.NomeCategoria = reader["NomeCategoria"].ToString();

                    Categories.Add(cat);
                        
                }

            }

            con.Close();

            return Categories;
        }


    }
}