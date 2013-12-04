using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MyInfo.DTO
{
    public class ItemDTO
    {
        public string Name { get; set; }
        public object Value { get; set; }
        public DateTime iDate { get; set; }
        public string iUser { get; set; }
    }
}