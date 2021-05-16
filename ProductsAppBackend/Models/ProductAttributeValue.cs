using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace ProductsAppBackend.Models
{
    //product attribute values model class
    public class ProductAttributeValue
    {
        public int Id { get; set; }
        [Required(ErrorMessage = "Attribute is Required")]
        public int ProductAttributeId { get; set; }
        [Required(ErrorMessage = "Attribute Value is Required")]
        public string AttributeValue { get; set; }
        public ProductAttribute ProductAttribute { get; set; }
        public ICollection<ProductProductAttributeValue> ProductProductAttributeValues { get; set; }

    }
}
