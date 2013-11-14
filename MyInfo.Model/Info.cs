using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MyInfo.DTO;
using MyInfo.DAL;

namespace MyInfo.Model
{
    public class Info
    {
        public Info(string ID)
        {
            // InfoList = new List<Info>();

            IInfoRepository infoRepository = new InfoRepositorySqlServer();
            InfoList = infoRepository.Infos(ID);
        }
        public Info()
        {
            InfoList = new List<InfoDTO>();
        }
        public int ID { get; set; }
        public string parentID { get; set; }
        public string Text { get; set; }
        public DateTime iDate { get; set; }
        public DateTime cDate { get; set; }
        public List<MyInfo.DTO.InfoDTO> InfoList { get; set; }

        /// <summary>
        /// Persist the new task in the repository
        /// </summary>
        public void Save()
        {
            // create new object and send to server
            InfoDTO td = new InfoDTO();
            td.Text = this.Text;
            td.parentID = this.parentID;
            IInfoRepository infoRepository = new InfoRepositorySqlServer();
            infoRepository.Add(td);
        }
    }
}
