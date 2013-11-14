using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MyInfo.DTO
{
    public class TaskDTO
    {
        public virtual int id { get; set; }
        public virtual string Name { get; set; }
        public virtual string Description { get; set; }
        public virtual string Status { get; set; }

    }
}