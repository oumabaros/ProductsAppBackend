using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ProductsAppBackend.Services
{
    // //parameters to map  query results and input
    public class ProductParameters
    {
        public int ProductId { get; set; }
        public string ProductName { get; set; }
        public int SkuId { get; set; }
        public double Price { get; set; }
        public int CategoryId { get; set; }
        public string CategoryName { get; set; }
        public string SkuName { get; set; }
        public string Attributes { get; set; }
        public string AttributeIds { get; set; }
    }
}
