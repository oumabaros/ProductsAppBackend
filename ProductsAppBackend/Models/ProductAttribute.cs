using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace ProductsAppBackend.Models
{
    //product attribute model class
    public class ProductAttribute
    {
        public int Id { get; set; }
        [Required(ErrorMessage = "Attribute Name is Required")]
        public string AttributeName { get; set; }
    }
}
