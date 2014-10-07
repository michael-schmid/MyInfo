using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyInfo.DTO
{
    public class InfoDTO
    {
        public int Id { get; set; }
        public string parentId { get; set; }
        public int Level { get; set; }
        public string Name { get; set; }
        public string Key { get; set; }
        public string Value { get; set; }
        public string Url { get; set; }
        public string iDate { get; set; }
        public DateTime cDate { get; set; }
    }
}
