using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MyWebApi.Models
{
    interface ITaskRepository
    {
        IEnumerable<Task> Tasks();
        Task Get(string Name);
        Task Add(Task item);
        void Remove(string Name);
        bool Update(Task item);
    }
}