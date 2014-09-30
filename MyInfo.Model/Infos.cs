using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MyInfo.DTO;
using MyInfo.DAL;

namespace MyInfo.Model
{
    /// <summary>
    /// Return list of information
    /// </summary>
    public class Infos
    {
        public Infos() { }

        

        public List<InfoDTO> InfoList (int Id)
        {
            List<InfoDTO> InfoList = new List<InfoDTO>();
            IInfoRepository infoRepository = new InfoRepositorySqlServer();
            return infoRepository.Infos(Id);
        }
    }
}
