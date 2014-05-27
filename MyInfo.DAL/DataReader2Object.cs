using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Collections.Specialized;
using System.Collections;
using System.Reflection;
using System.Data;

namespace MyInfo.DAL
{
    static class DataReader2Object
    {
        // map datareader to an business object
        public static List<T> GetList<T>(IDataReader dr)
       where T : new()
            {
                Type businessEntityType = typeof(T);
                List<T> entitys = new List<T>();
                Hashtable hashtable = new Hashtable();
                PropertyInfo[] properties = businessEntityType.GetProperties();
                foreach (PropertyInfo info in properties)
                {
                    hashtable[info.Name.ToUpper()] = info;
                }
                while (dr.Read())
                {
                    T newObject = new T();
                    for (int index = 0; index < dr.FieldCount; index++)
                    {
                        PropertyInfo info = (PropertyInfo)
                        hashtable[dr.GetName(index).ToUpper()];

                        if ((info != null) && info.CanWrite)
                        {
                            if (!dr.IsDBNull(index))
                                info.SetValue(newObject, dr.GetValue(index), null);
                        }
                    }
                    entitys.Add(newObject);
                }
                dr.Close();
                return entitys;
            }
    }
}
