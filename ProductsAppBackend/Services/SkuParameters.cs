using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ProductsAppBackend.Services
{
    //parameters to map in SKU query results and input
    public class SkuParameters
    {
        public int Id { get; set; }
        public String SkuName { get; set; }
    }
}
