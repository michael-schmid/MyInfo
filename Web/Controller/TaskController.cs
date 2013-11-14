using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using MyWebApi.Models;

namespace MyWebApi
{
    public class TaskController : ApiController
    {
        // Data initialization
        static List<Task> tasks = InitTasks();

        private static List<Task> InitTasks()
        {
            var ret = new List<Task>();

            ret.Add(new Task { id=1 ,  Name = "Altpapier", Description = "Papier und Karton wegbringen", Status="open" });
            ret.Add(new Task { id=2 , Name = "Keller", Description = "Papier und Karton wegbringen", Status="open" });
            ret.Add(new Task { id=3 , Name = "Winterreifen", Description = "Schupp und Kiefer wechseln", Status="open" });
            
            return ret;
        }
        
        // GET api/<controller>
        public IEnumerable<Task> Get()
        {
            TaskRepositorySqlServer trep = new TaskRepositorySqlServer();
            var tasks = trep.Tasks();
            

            return tasks;
        }

        // GET api/<controller>/5
        public Task Get(int id)
        {
            var ret = (from c in tasks
                       where c.id == id
                           select c)
                      .FirstOrDefault();
            return ret;
        }
        
        // PUT api/<controller>/5
        public void Post([FromBody] Task t)
        {
            t.id = tasks.Count;
            tasks.Add(t);


       

        }

        // PUT api/<controller>/5
        public void Put(int id, [FromBody] Task t)
        {
            Task task = (from c in tasks
                        where c.id == id
                        select c).FirstOrDefault();

            task.Name = t.Name;
            task.Description = t.Description;
            task.Status = t.Status;

        }

        // DELETE api/<controller>/5
        public void Delete(int id)
        {
            Task task = (from c in tasks
                        where c.id == id
                        select c).FirstOrDefault();

            tasks.Remove(task);
        }
    }
}