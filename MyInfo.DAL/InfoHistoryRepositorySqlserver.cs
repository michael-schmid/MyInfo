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
    public class InfoHistoryRepositorySqlServer : IInfoHistoryRepository
    {
        private List<InfoDTO> infos = new List<InfoDTO>();

        public InfoHistoryRepositorySqlServer()
        { 
        }

        // return info journal
        public List<InfoDTO> InfoHistory()
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings[ConfigurationManager.AppSettings["connection"]].ConnectionString))
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand("pInfoHistory", conn))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    // cmd.Parameters.Add(new SqlParameter("@view", "list"));
                    SqlDataReader dr = cmd.ExecuteReader();
                    List<InfoDTO> infoList = DataReader2Object.GetList<InfoDTO>(dr);
                    return infoList;
                }
            }
        }
    }
}