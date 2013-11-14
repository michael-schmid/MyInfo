using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Configuration;


namespace MyInfo.DAL
{
    public class ConnectionHelper 
    {
        

        public string GetSqlConnection (string webConfigName)
        {
            
            //System.Configuration.Configuration rootWebConfig =
            //   System.Configuration.WebConfigurationManager.OpenWebConfiguration("/MyWebSiteRoot");
            //System.Configuration.ConnectionStringSettings connString;
            //if (rootWebConfig.ConnectionStrings.ConnectionStrings.Count > 0)
            //{
            //    connString =
            //        rootWebConfig.ConnectionStrings.ConnectionStrings["NorthwindConnectionString"];
            //    if (connString != null)
            //        Console.WriteLine("Northwind connection string = \"{0}\"",
            //            connString.ConnectionString);
            //    else
            //        Console.WriteLine("No Northwind connection string");
            //}
            return null;
           
        }

       

    }
}
