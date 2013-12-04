using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using MyWebApi.Models;
using MyInfo.Model;

namespace MyWebApi
{
    public class ObjectController : ApiController
    {
        // PUT 
        public void Post([FromBody] MyInfo.Model.Info info)
        {
            // t.id = tasks.Count;
            // MyInfo.Model.Task task = new MyInfo.Model.Task();
            info.Save();
        }
        
    }
}



