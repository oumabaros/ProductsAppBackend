using Microsoft.EntityFrameworkCore;
using ProductsAppBackend.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ProductsAppBackend.DataContext
{
    public class ApplicationContext:DbContext
    {
        public ApplicationContext() { }
        public ApplicationContext(DbContextOptions<ApplicationContext> options) : base(options) { }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<ProductProductAttributeValue>()
                .HasKey(bc => new { bc.ProductId, bc.ProductAttributeValueId });
            modelBuilder.Entity<ProductProductAttributeValue>()
                .HasOne(bc => bc.Product)
                .WithMany(b => b.ProductProductAttributeValues)
                .HasForeignKey(bc => bc.ProductId);
            modelBuilder.Entity<ProductProductAttributeValue>()
                .HasOne(bc => bc.ProductAttributeValue)
                .WithMany(c => c.ProductProductAttributeValues)
                .HasForeignKey(bc => bc.ProductAttributeValueId);
        }

        public DbSet<Product> Products { get; set; }
        public DbSet<Category> Categories { get; set; }
        public DbSet<ProductAttribute> ProductAttributes { get; set; }
        public DbSet<ProductAttributeValue> ProductAttributeValues { get; set; }
        public DbSet<Sku> Skus { get; set; }
        public DbSet<ProductProductAttributeValue> ProductProductAttributeValues { get; set; }
    }
}
