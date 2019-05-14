using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;


namespace Apartment
{
    public partial class _Default : Page
    {

        public SqlConnection conn = new SqlConnection();

        SqlCommand cmd = new SqlCommand();

        SqlDataReader dr;
        DataSet ds = new DataSet();
        public string connectionString = @"Data Source = (localdb)\MSSQLLocalDB; Initial Catalog = master; Integrated Security = True";
        string priority, technician;
        protected void Page_Load(object sender, EventArgs e)
        {
            conn.ConnectionString = connectionString;
            conn.Open();


        }

        protected void btn_add_Click(object sender, EventArgs e)
        {
            try
            {

                if(rbtn_low.Checked== true)
                {
                    priority = "low";
                }
                else if (rbtn_medium.Checked == true)
                {
                    priority = "medium";
                }
                else
                {
                    priority = "high";
                }

                if (cb_tech.SelectedIndex >= 0)
                {
                    string tech = "";
                    foreach (ListItem s in cb_tech.Items)
                    {
                        if (s.Selected)
                        {

                            tech += s + ",";

                        }
                    }
                    tech = tech.Substring(0, tech.Length - 1);

                    technician = tech;



                }
                else
                {
                    technician = "";
                }
            

                string insert_query = "insert into maintenance (fname,lname,aptno,priority_rbtn,descr,technician,permit) values ('" + txt_fname.Text + "','" + txt_lname.Text + "','" + ddl_aptno.SelectedItem.ToString() + "','" + priority.ToString() + "','" + txt_desc.Text + "','" + technician.ToString() + "','" + rbtn_permit.SelectedValue.ToString() + "')";
                cmd = new SqlCommand(insert_query, conn);

                cmd.ExecuteNonQuery();


                conn.Close();
                Response.Redirect("Default.aspx");
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }


        }
    }
}