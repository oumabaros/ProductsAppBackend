using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace ProductsAppBackend.Models
{
    //sku model class
    public class Sku
    {
        public int Id { get; set; }
        [Required(ErrorMessage = "Sku Name is Required")]
        public String SkuName { get; set; }
    }
}
