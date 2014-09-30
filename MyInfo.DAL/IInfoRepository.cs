using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MyInfo.DTO;

namespace MyInfo.DAL
{
    public interface IInfoRepository
    {
        List<InfoDTO> Infos(int InfoID);
        InfoDTO Get(string Name);
        int Add(InfoDTO item);
        void Delete(int Id);
        bool Update(InfoDTO item);
    }
}