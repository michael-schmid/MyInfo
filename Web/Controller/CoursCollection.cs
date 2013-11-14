using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Cors;

namespace MyWebApi
{
    /*  Derrived from Plural Sight Web API Course : Jon Flanders, Example Module 2
     */

    public class CourseController : ApiController
    {
        static List<Course> _courses = InitCourses();

        // [EnableCors]
        private static List<Course> InitCourses()
        {
            var ret = new List<Course>();
            ret.Add(new Course { id = 0, name = "HTTP Fundamentals" });
            ret.Add(new Course { id = 1, name = "REST Fundamentals" });


            return ret;
        }
        // uri: /api/courses
        [HttpGet]
        public IEnumerable<Course> ZAllCourses()
        {
            return _courses;
        }
        // uri: /api/courses/{id}
        public Course Get(int id)
        {
            Course ret = null;
            ret = (from c in _courses
                   where c.id == id
                   select c).FirstOrDefault();
            if (ret == null)
            {
                //TODO: return 404 
            }

            return ret; 
        }
        public Course Post(Course newCourse)
        {
            newCourse.id = _courses.Count;
            _courses.Add(newCourse);
            //TODO: return 201
            return newCourse;
        }
        public void Delete(int id)
        {
            Course ret = null;
            ret = (from c in _courses
                   where c.id == id
                   select c).FirstOrDefault();
            if (ret!= null)
            {
                _courses.Remove(ret);
            }

        }
        public void Put(int id, Course updatedCourse)
        {
            Course ret = null;
            ret = (from c in _courses
                   where c.id == id
                   select c).FirstOrDefault();
            if (ret == null)
            {
                //TODO: return 404 
            }
            _courses.Remove(ret);
            _courses.Add(updatedCourse);

        }
    }

    public class Course
    {
        public int id { get; set; }
        public string name { get; set; }

    }
}
