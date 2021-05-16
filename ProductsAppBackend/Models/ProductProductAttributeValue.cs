using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Threading.Tasks;

namespace ProductsAppBackend.Models
{ 
    //model class for ProductProductAttributeValue
    public class ProductProductAttributeValue
    {
        public int ProductId { get; set; }
        public int ProductAttributeValueId { get; set; }
        [DefaultValue(false)]
        public bool Selected { get; set; }
        public ProductAttributeValue ProductAttributeValue { get; set; }
        public Product Product { get; set; }
    }
}
