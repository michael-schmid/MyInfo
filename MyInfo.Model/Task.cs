using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MyInfo.DAL;
using MyInfo.DTO;

namespace MyInfo.Model 
{
    public class Task
    {
        public virtual int id { get; set; }
        public virtual string Name { get; set; }
        public virtual string Description { get; set; }
        public virtual string Status { get; set; }

        /// <summary>
        /// Persist the new task in the repository
        /// </summary>
        public void Save()
        {
            // create new object and send to server
            TaskDTO td = new TaskDTO();
            td.Name = this.Name;
            td.Description = this.Description;
            td.Status = this.Status;

            ITaskRepository taskRepository = new TaskRepositorySqlServer();
            taskRepository.Add(td);
        }
    }
}