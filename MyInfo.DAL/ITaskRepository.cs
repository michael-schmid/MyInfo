using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MyInfo.DTO;

namespace MyInfo.DAL
{
    public interface ITaskRepository
    {
        IEnumerable<TaskDTO> Tasks();
        TaskDTO Get(string Name);
        TaskDTO Add(TaskDTO item);
        void Remove(string Name);
        bool Update(TaskDTO item);
    }
}