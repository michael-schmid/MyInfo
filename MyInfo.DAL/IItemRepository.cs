using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyInfo.DAL
{
    public interface IItemRepository
    {
        string Name { get; set; }
        object  Value { get; set; }
        DateTime iDate { get; set; }
        string iUser { get; set; }
        
    }
}
