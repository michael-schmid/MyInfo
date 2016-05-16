using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using MyWebApi.Models;
using MyInfo.Model;
using System.Web.Http.Cors;
using MyInfo.DTO;

namespace MyWebApi
{
    public class InfoController : ApiController
    {
        // PUT 
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        public int Post([FromBody] MyInfo.Model.Info info)
        {
            // t.id = tasks.Count;
            // MyInfo.Model.Task task = new MyInfo.Model.Task();
            return  info.Save();
        }

        // GET api/<controller>/5
        // can either be name or id
        //[EnableCors(origins: "*", headers: "*", methods: "*")]
        //public Object Get(string id = null)
        //{
           
        //}


        // GET api/info/5/journal
        // get a particular view on a object
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        public Object Get(string id = null, string view = null)
        {
          
            // get list of information when no id is given
            if (view == "journal")
            {
                InfoJournal infos = new InfoJournal();
                return infos.InfoList();
            }
            else
                // get list of information when no id is given
                if (id == null)
                {
                    Infos infos = new Infos();
                    return infos.InfoList(0);
                }
                else
                {
                    // retrieve single information by its id
                    // return new Info(Convert.ToInt32(id));

					Infos infos = new Infos();
					return infos.InfoList(Convert.ToInt32(id));

                }
        }


        // PUT 
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        public void Put(string id, [FromBody] MyInfo.Model.Info info)
        {
            // Important to set the Id
            // this distinquished add from update !!!
            info.Id = Convert.ToInt32(id);
            info.Save();
        }

        // DELETE api/<controller>/5
         [EnableCors(origins: "*", headers: "*", methods: "*")]
        public void Delete(int id)
        {
            Info i = new Info(id);
            i.Delete();
        }
    }
}