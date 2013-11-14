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
    public class InfoRepositorySqlServer : IInfoRepository
    {
        private List<InfoDTO> infos = new List<InfoDTO>();

        public InfoRepositorySqlServer()
        { 
        }
        // return all tasks
        public List<InfoDTO> Infos(string ID)
        {
            // Sql: exec dbo.pInfo @mode='list'
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["localProject"].ConnectionString))
            {
                conn.Open();

                using (SqlCommand cmd = new SqlCommand("pInfo", conn))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
             
                    cmd.Parameters.Add(new SqlParameter("@mode", "list"));
                    cmd.Parameters.Add(new SqlParameter("@id", ID));
                    SqlDataReader dr =  cmd.ExecuteReader();

                    List<InfoDTO> infoList = MapDataToBusinessEntityCollection<InfoDTO>(dr);
                    return infoList;
                }
            }
        }
    // map datareader to an business object
        public static List<T> MapDataToBusinessEntityCollection<T>(IDataReader dr)

   where T : new()
        {
            Type businessEntityType = typeof(T);
            List<T> entitys = new List<T>();
            Hashtable hashtable = new Hashtable();
            PropertyInfo[] properties = businessEntityType.GetProperties();
            foreach (PropertyInfo info in properties)
            {
                hashtable[info.Name.ToUpper()] = info;
            }
            while (dr.Read())
            {
                T newObject = new T();
                for (int index = 0; index < dr.FieldCount; index++)
                {
                    PropertyInfo info = (PropertyInfo)
                    hashtable[dr.GetName(index).ToUpper()];

                    if ((info != null) && info.CanWrite)
                    {
                        info.SetValue(newObject, dr.GetValue(index), null);
                    }
                }
                entitys.Add(newObject);
            }
            dr.Close();
            return entitys;
        }

        public InfoDTO Get(string Name)
        {
            // not yet implemented
            return null; // tasks.Find(t => t.Name == Name);
        }
        public int Add(MyInfo.DTO.InfoDTO item)
        {
            if (item == null)
            {
                throw new ArgumentException("item");
            }

            // Sql: exec dbo.pInfo @mode='add', @text='Tasks', @parentID=6
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["localProject"].ConnectionString))
            {
                conn.Open();

                using (SqlCommand cmd = new SqlCommand("pInfo", conn))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@parentID", item.parentID));
                    cmd.Parameters.Add( new SqlParameter("@text", item.Text));
                    cmd.Parameters.Add(new SqlParameter("@mode", "add"));
                    cmd.ExecuteNonQuery();
                }
            }
            return 0;
        }
        public void Remove(string Name)
        {
           // tasks.RemoveAll(t => t.Name == Name);
        }
        public bool Update(InfoDTO item)
        {
            // note yet implemented
            if (item == null)
            {
                throw new ArgumentException("item");
            }
            //int index = tasks.FindIndex(t => t.Name == item.Name);
            //tasks.RemoveAt(index);
            return true;
        }
    }
}