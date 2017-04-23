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
    public class InfoDayController : ApiController
    {
		// GET /api/infoday/2017-01-01
        // get a particular day and its information nodes
        public Object Get(string id = null)
        {
        	List<InfoDTO> InfoList = new List<InfoDTO>();
			IInfoDayRepository infoDayRepository = new InfoDayRepositorySqlServer();
            return infoDayRepository.InfoDay(id);
        }
    }
}