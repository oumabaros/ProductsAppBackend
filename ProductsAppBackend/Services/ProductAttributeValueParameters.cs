using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ProductsAppBackend.Services
{
    // //parameters to map  query results and input
    public class ProductAttributeValueParameters
    {
        public int Id { get; set; }
        public int ProductAttributeId { get; set; }
        public string AttributeValue { get; set; }
        public string AttributeName { get; set; }

    }
}
