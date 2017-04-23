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
    public class InfoDayRepositorySqlServer : IInfoDayRepository
    {
        private List<InfoDTO> infos = new List<InfoDTO>();

        public InfoDayRepositorySqlServer()
        { 
        }

        // return info journal
        public List<InfoDTO> InfoDay(string DayName)
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings[ConfigurationManager.AppSettings["connection"]].ConnectionString))
            {
                conn.Open();
                // exec dbo.pInfoDayGet @Name = '2017-04-01'
                using (SqlCommand cmd = new SqlCommand("pInfoDayGet", conn))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@Name", DayName));
                    SqlDataReader dr = cmd.ExecuteReader();
                    List<InfoDTO> infoList = DataReader2Object.GetList<InfoDTO>(dr);
                    return infoList;
                }
            }
        }
    }
}