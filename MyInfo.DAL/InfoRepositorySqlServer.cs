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
        // return list of information
        public List<InfoDTO> Infos(int ID)
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings[ConfigurationManager.AppSettings["connection"]].ConnectionString))
            {
                conn.Open();

                Object infoID;
                if (ID == 0)
                    infoID = DBNull.Value;
                else
                    infoID = ID;

                using (SqlCommand cmd = new SqlCommand("pInfoGet", conn))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    
                    cmd.Parameters.Add(new SqlParameter("@id", infoID));
                    cmd.Parameters.Add(new SqlParameter("@parentId", infoID));
                    SqlDataReader dr =  cmd.ExecuteReader();

                    List<InfoDTO> infoList = DataReader2Object.GetList<InfoDTO>(dr);
                    return infoList;
                }
            }
        }
   
        public InfoDTO Get(string Name)
        {
            // not yet implemented
            return null; // tasks.Find(t => t.Name == Name);
        }

        // delete an information from storage
        public void Delete(int Id)
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings[ConfigurationManager.AppSettings["connection"]].ConnectionString))
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand("dbo.pInfoDelete", conn))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@Id", Id));
                    cmd.ExecuteNonQuery();
                }
            }
        }

        /// <summary>
        /// Add a new information
        /// </summary>
        /// <param name="item"></param>
        /// <returns></returns>
        public int Add(MyInfo.DTO.InfoDTO item)
        {
            if (item == null)
            {
                throw new ArgumentException("item missing");
            }

            // new 29.09.2014: storing hierarchical information : returns the id of the newly created information node
            // dbo.pInfoAdd	 @name='test', @key='key', @Value='Value', @Url='Url', @parentId=1
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings[ConfigurationManager.AppSettings["connection"]].ConnectionString))
            {
                conn.Open();

                using (SqlCommand cmd = new SqlCommand("dbo.pInfoAdd", conn))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@parentID", item.parentId));
                    cmd.Parameters.Add( new SqlParameter("@Name", item.Name));
                    cmd.Parameters.Add(new SqlParameter("@Key", item.Key));
                    cmd.Parameters.Add(new SqlParameter("@Value", item.Value));
                    cmd.Parameters.Add(new SqlParameter("@Url", item.Url));

                    // output parameter for stored procedure value which returns the created informaiton id
                    SqlParameter returnParam = new SqlParameter("CreateReturnValue", SqlDbType.Int);
                    returnParam.Direction = ParameterDirection.ReturnValue;
                    cmd.Parameters.Add(returnParam);

                    cmd.ExecuteNonQuery();
                    return (int)returnParam.Value;
                }
            }
        }
       /// <summary>
       /// Update an existing information
       /// </summary>
       /// <param name="item"></param>
       /// <returns></returns>
        public bool Update(InfoDTO item)
        {
            if (item == null)
            {
                throw new ArgumentException("item missing");
            }
            // dbo.pInfoUpdate	@id=1, @name='test', @key='key', @Value='Value', @Url='Url'
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings[ConfigurationManager.AppSettings["connection"]].ConnectionString))
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand("dbo.pInfoUpdate", conn))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@Id", item.Id));
                    cmd.Parameters.Add(new SqlParameter("@Name", item.Name));
                    cmd.Parameters.Add(new SqlParameter("@Key", item.Key));
                    cmd.Parameters.Add(new SqlParameter("@Value", item.Value));
                    cmd.Parameters.Add(new SqlParameter("@Url", item.Url));
                    cmd.ExecuteNonQuery();
                }
            }
            return true;
        }
    }
}