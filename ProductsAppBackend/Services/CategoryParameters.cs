using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ProductsAppBackend.Services
{
    //parameters to map in category query results and input
    public class CategoryParameters
    {
        public int Id { get; set; }
        public string CategoryName { get; set; }
    }
}
