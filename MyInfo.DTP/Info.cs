﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyInfo.DTO
{
    public class InfoDTO
    {
        public int ID { get; set; }
        public string parentID { get; set; }
        public string Text { get; set; }
        public string Topic { get; set; }
        public string Tags { get; set; }
        public string iDate { get; set; }
        public DateTime cDate { get; set; }
    }
}
