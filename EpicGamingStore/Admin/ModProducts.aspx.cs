using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
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
                
            }
        }

        public void GetProduct(int id)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnStringEpicGaming"].ToString();
            con.Open();

            SqlCommand command = new SqlCommand();
            command.CommandText= $"select * ProdottiTab where IDProdotto = {id}";
            command.Connection= con;
            SqlDataReader reader= command.ExecuteReader();
            if(reader.HasRows)
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
                    DataRilascio.Value = reader["DataRilascio"].ToString();
                    front.Text = reader["URLImg"].ToString();



                }
            }

        }
    }
}