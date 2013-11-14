using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MyInfo.DTO;

namespace MyInfo.DAL
{
    public interface IInfoRepository
    {
        List<InfoDTO> Infos(string InfoID);
        InfoDTO Get(string Name);
        int Add(InfoDTO item);
        bool Update(InfoDTO item);
    }
}