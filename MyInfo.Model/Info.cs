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
        public Info() { }
        public Info(int Id)
        {
            List<InfoDTO> InfoList = new List<InfoDTO>();
            IInfoRepository infoRepository = new InfoRepositorySqlServer();
            InfoList = infoRepository.Infos(Id);

            InfoDTO i = InfoList[0];
            this.Name = i.Name;
            this.Key = i.Key;
            this.Value = i.Value;
            this.Url = i.Url;
            this.iDate = i.iDate;
            this.Id = Id;
        }
        //public Info()
        //{
        //   // InfoList = new List<InfoDTO>();
        //}
        public int Id { get; set; }
        public string Name { get; set; }
        public int Level { get; set; }
        public string Key { get; set; }
        public string Value { get; set; }
        public string Url { get; set; }
        public string iDate { get; set; }
        public DateTime cDate { get; set; }
        // public List<MyInfo.DTO.InfoDTO> InfoList { get; set; }

        /// <summary>
        /// Persist the new task in the repository
        /// </summary>
        public int Save()
        {
            // create new object and send to the repository
            InfoDTO td = new InfoDTO();
            td.Name = this.Name;
            td.Key = this.Key;
            td.Value = this.Value;
            IInfoRepository infoRepository = new InfoRepositorySqlServer();
            
            
            if ( this.Id == 0)
                // add the item in the repository and return the provided generated information id
                return infoRepository.Add(td);
            else
            { 
                // Id exist: update existing item
                td.Id = this.Id;
                infoRepository.Update(td);
                return 0;
            }

        }

        public void Delete()
        {
            IInfoRepository infoRepository = new InfoRepositorySqlServer();
            infoRepository.Delete(this.Id);
        }


    }
}
