using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MyInfo.DTO;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections.Specialized;
using System.Collections;
using System.Reflection;
using System.Data;


namespace MyInfo.DAL
{
    class ItemRepositorySqlServer : IItemRepository
    {
        
        public ItemRepositorySqlServer()
        { 
        }

        // return all items : Currently not used
        //public List<InfoDTO> Infos(string ID)
        //{
        //    // Sql: exec dbo.pInfo @mode='list'
        //    using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings[ConfigurationManager.AppSettings["connection"]].ConnectionString))
        //    {
        //        conn.Open();

        //        var parameter = (ID == "root" ? DBNull.Value.ToString() : ID);

        //        using (SqlCommand cmd = new SqlCommand("pInfo", conn))
        //        {
        //            cmd.CommandType = System.Data.CommandType.StoredProcedure;
             
        //            cmd.Parameters.Add(new SqlParameter("@mode", "list"));
        //            cmd.Parameters.Add(new SqlParameter("@id", parameter));
        //            SqlDataReader dr =  cmd.ExecuteReader();

        //            List<InfoDTO> infoList = DataReader2Object.GetList<InfoDTO>(dr);
        //            return infoList;
        //        }
        //    }
        // }
   

   
        public int Add(MyInfo.DTO.ItemDTO item)
        {
            if (item == null)
            {
                throw new ArgumentException("item");
            }

            // Sql: exec dbo.pInfo @mode='add', @text='Tasks', @parentID=6
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["localProject"].ConnectionString))
            {
                conn.Open();

                // exec dbo.pItemInsert @name='Gugus', @value='gaga'
                using (SqlCommand cmd = new SqlCommand("pItem", conn))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@Name", item.Name));
                    cmd.Parameters.Add( new SqlParameter("@Value", item.Value));
                    
                    cmd.ExecuteNonQuery();
                }
            }
            return 0;
        }
    }
}
