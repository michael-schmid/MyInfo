using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using MyWebApi.Models;
using MyInfo.Model;
using System.Web.Http.Cors;
using MyInfo.DAL;
using MyInfo.DTO;


namespace MyWebApi
{
    public class InfoHistoryController : ApiController
    {

		// GET /api/infohistory/
        // get a particular view on a object
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        public Object Get(string id = null, string view = null)
        {
        	List<InfoDTO> InfoList = new List<InfoDTO>();
			IInfoHistoryRepository infoRepository = new InfoHistoryRepositorySqlServer();
			return infoRepository.InfoHistory();
        }
    }
}