using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace ProductsAppBackend.Models
{
    //product model class
    public class Product
    {
        public int Id { get; set; }
        [Required(ErrorMessage = "Product Name is Required")]
        public string ProductName { get; set; }
        [Required(ErrorMessage = "Sku is Required")]
        public int SkuId { get; set; }
        [Required(ErrorMessage = "Price is Required")]
        public double Price { get; set; }
        [Required(ErrorMessage = "Category is Required")]
        public int CategoryId { get; set; }
        public Sku Sku { get; set; }
        public Category Category { get; set; }
        public ICollection<ProductProductAttributeValue> ProductProductAttributeValues { get; set; }
    }
}
