using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MyInfo.DTO;
using System.Data.SqlClient;
using System.Configuration;


namespace MyInfo.DAL
{
    public class TaskRepositorySqlServer : ITaskRepository
    {
        private List<TaskDTO> tasks = new List<TaskDTO>();
        public TaskRepositorySqlServer()
        { 
        }

        // return all tasks
        public IEnumerable<TaskDTO> Tasks()
        {
           

            return tasks;
        }

        public TaskDTO Get(string Name)
        {
            return tasks.Find(t => t.Name == Name);
        }



        public TaskDTO Add(MyInfo.DTO.TaskDTO item)
        {
            if (item == null)
            {
                throw new ArgumentException("item");
            }


            // store the object in the database 
            // exec pTask @mode='add', @name='gaga', @description='gugus', @description='fettig'
            // using (SqlConnection conn = new SqlConnection("Data Source=(localdb)\\projects;Initial Catalog=Database1;Integrated Security=True"))
            // using (SqlConnection conn = new SqlConnection("Server=SQL5003.Smarterasp.net;initial catalog=DB_996396_michaelS;User Id=DB_996396_michaelS_admin; Password=DB_996396_michaelS"))
           
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["localProject"].ConnectionString))
            {
                conn.Open();

                using (SqlCommand cmd = new SqlCommand("pTask", conn))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;

                    SqlParameter mode = new SqlParameter("@mode", "add");
                    SqlParameter name = new SqlParameter("@name", item.Name);
                    SqlParameter description = new SqlParameter("@description", item.Description);
                    SqlParameter status = new SqlParameter("@status", item.Status);

                    cmd.Parameters.Add(mode);
                    cmd.Parameters.Add(name);
                    cmd.Parameters.Add(description);
                    cmd.Parameters.Add(status);


                    cmd.ExecuteNonQuery();
                }
            }
            return item;
        }

        public void Remove(string Name)
        {
            tasks.RemoveAll(t => t.Name == Name);
        }
        public bool Update(TaskDTO item)
        {
            if (item == null)
            {
                throw new ArgumentException("item");
            }
            int index = tasks.FindIndex(t => t.Name == item.Name);
            tasks.RemoveAt(index);
            return true;
        }

    }

   
}