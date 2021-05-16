using Dapper;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ProductsAppBackend.Services;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;

namespace ProductsAppBackend.Controllers
{
    //controller to create,delete and update products

    [ApiController]
    [EnableCors("AllowAllHeaders")]
    public class ProductsController : ControllerBase
    {
        private readonly IDapper _dapper;
        public ProductsController(IDapper dapper)
        {
            _dapper = dapper;
        }
        //create products
        [HttpPost("products")]
        public async Task<int> Create(ProductParameters data)
        {
            var dbparams = new DynamicParameters();
            dbparams.Add("ProductName", data.ProductName, DbType.String);
            dbparams.Add("SkuId", data.SkuId, DbType.Int32);
            dbparams.Add("Price", data.Price, DbType.Decimal);
            dbparams.Add("CategoryId", data.CategoryId, DbType.Int32);
            
            var result = await Task.FromResult(_dapper.Insert<int>("[dbo].[p_CreateProducts]"
                , dbparams,
                commandType: CommandType.StoredProcedure));
            return result;
        }
        //get products by id
        [HttpGet("productsById/{Id}")]
        public async Task<ProductParameters> GetById(int Id)
        {
            var dbparams = new DynamicParameters();
            dbparams.Add("Id", Id, DbType.Int32);
            var result = await Task.FromResult(_dapper.Get<ProductParameters>("[dbo].[p_GetProductById]",
                    dbparams, commandType: CommandType.StoredProcedure));
            return result;
        }
        //create products by category
        [HttpGet("products/{Id}")]
        public async Task<ProductParameters> GetByCategoryId(int Id)
        {
            var dbparams = new DynamicParameters();
            dbparams.Add("CategoryId", Id, DbType.Int32);
            var result = await Task.FromResult(_dapper.Get<ProductParameters>("[dbo].[p_GetProductsByCategoryId]",
                    dbparams, commandType: CommandType.StoredProcedure));
            return result;
        }
        //get selected products
        [HttpGet("attributesData/{Id}")]
        public async Task<List<ProductProductAttributeValueParameters>> GetAttributesData(int Id)
        {
            var dbparams = new DynamicParameters();
            dbparams.Add("ProductId", Id, DbType.Int32);
            var result = await Task.FromResult(_dapper.GetAll<ProductProductAttributeValueParameters>("[dbo].[GetSelectedAtrributes ]",
                    dbparams, commandType: CommandType.StoredProcedure));
            return result;
        }
        //get all products
        [HttpGet("products")]
        public async Task<List<ProductParameters>> Get()
        {
            var result = await Task.FromResult(_dapper.GetAll<ProductParameters>("[dbo].[p_GetProducts]",
                    null, commandType: CommandType.StoredProcedure));
            return result;
        }
        //delete products
        [HttpDelete("products/{Id}")]
        public async Task<int> Delete(int Id)
        {
            var dbparams = new DynamicParameters();
            dbparams.Add("Id", Id, DbType.Int32);
            var result = await Task.FromResult(_dapper.Execute("[dbo].[p_DeleteProductById]",
                dbparams, commandType: CommandType.StoredProcedure));
            return result;
        }
        //update products
        [HttpPut("products/{Id}")]
        public Task<int> Update(int Id, ProductParameters data)
        {
            var dbParams = new DynamicParameters();
            dbParams.Add("Id", Id);
            dbParams.Add("ProductName", data.ProductName, DbType.String);
            dbParams.Add("SkuId", data.SkuId, DbType.Int32);
            dbParams.Add("Price", data.Price, DbType.Decimal);
            dbParams.Add("CategoryId", data.CategoryId, DbType.Int32);
            dbParams.Add("Attributes", data.Attributes, DbType.String);

            var updateProduct = Task.FromResult(_dapper.Update<int>("[dbo].[p_UpdateProduct]",
                            dbParams,
                            commandType: CommandType.StoredProcedure));
            return updateProduct;
        }
    }
}
