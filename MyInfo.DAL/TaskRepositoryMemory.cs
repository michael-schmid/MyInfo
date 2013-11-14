using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MyWebApi.Models
{
    public class TaskRepositoryMemory :ITaskRepository
    {

        private List<Task> tasks = new List<Task>();

        public TaskRepositoryMemory  ()
        { 
             
        }

        public IEnumerable<Task> Tasks()
        {
            return tasks;
        }

        public Task Get(string Name)
        {
            return tasks.Find(t => t.Name == Name);
        }

        public Task Add(Task item)
        {
            if (item == null)
            {
                throw new ArgumentException("item");
            }
            tasks.Add(item);
            return item;
        }

        public void Remove(string Name)
        {
            tasks.RemoveAll(t => t.Name == Name);
        }
        public bool Update(Task item)
        {
            if (item == null)
            {
                throw new ArgumentException("item");
            }
            int index = tasks.FindIndex(t => t.Name == item.Name);
            tasks.RemoveAt(index);
            return true;
        }

    }

   
}