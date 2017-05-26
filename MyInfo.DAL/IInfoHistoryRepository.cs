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
        List<InfoDTO> InfoJournal();
        InfoDTO Get(string Name);
        List<InfoDTO> Add(InfoDTO item);
        void Delete(int Id);
        List<InfoDTO> Update(InfoDTO item);
    }
}