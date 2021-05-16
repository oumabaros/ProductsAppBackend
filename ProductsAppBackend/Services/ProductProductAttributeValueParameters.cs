using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ProductsAppBackend.Services
{
    //parameters to map  query results and input
    public class ProductProductAttributeValueParameters
    {
        public int ProductId { get; set; }
        public int ProductAttributeValueId { get; set; }
        public bool Selected { get; set; }
        public string AttributeName { get; set; }
    }
}
