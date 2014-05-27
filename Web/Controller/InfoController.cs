using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using MyWebApi.Models;
using MyInfo.Model;
using System.Web.Http.Cors;

namespace MyWebApi
{
    public class InfoController : ApiController
    {
        // Data initialization
        static List<MyInfo.Model.Info> tasks = new List<MyInfo.Model.Info>();
             
        // PUT 
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        public void Post([FromBody] MyInfo.Model.Info info)
        {
            // t.id = tasks.Count;
            // MyInfo.Model.Task task = new MyInfo.Model.Task();
            info.Save();
        }

        //// GET api/<controller>
        //public IEnumerable<Info> Get()
        //{
            
        //    var tasks = trep.Tasks();
        //    return tasks;
        //}

        // GET api/<controller>/5
        // can either be name or id
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        public Info Get(string id)
        {
            Info i = new Info(id);
            
            return i;
        }
        
        //// PUT api/<controller>/5
        //public void Post([FromBody] Task t)
        //{
        //    t.id = tasks.Count;
        //    tasks.Add(t);
        //}

        //// PUT api/<controller>/5
        //public void Put(int id, [FromBody] Task t)
        //{
        //    Task task = (from c in tasks
        //                where c.id == id
        //                select c).FirstOrDefault();

        //    task.Name = t.Name;
        //    task.Description = t.Description;
        //    task.Status = t.Status;

        //}

        //// DELETE api/<controller>/5
        //public void Delete(int id)
        //{
        //    Task task = (from c in tasks
        //                where c.id == id
        //                select c).FirstOrDefault();

        //    tasks.Remove(task);
        //}
    }
}