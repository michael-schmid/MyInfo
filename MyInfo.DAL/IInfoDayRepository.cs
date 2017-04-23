using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MyInfo.DTO;

namespace MyInfo.DAL
{
    public interface IInfoDayRepository
    {
        List<InfoDTO> InfoDay(string InfoID);
    }
}