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
    //controller to create,delete and update product attributes
    [ApiController]
    [EnableCors("AllowAllHeaders")]
    public class ProductAttributesController : ControllerBase
    {
        private readonly IDapper _dapper;
        public ProductAttributesController(IDapper dapper)
        {
            _dapper = dapper;
        }
        //create product attribute
        [HttpPost("productAttributes")]
        public async Task<int> Create(ProductAttributeValueParameters data)
        {
            var dbparams = new DynamicParameters();
            dbparams.Add("ProductAttributeId", data.ProductAttributeId, DbType.Int32);
            dbparams.Add("AttributeValue", data.AttributeValue, DbType.String);

            var result = await Task.FromResult(_dapper.Insert<int>("[dbo].[p_CreateAttributesValues]"
                , dbparams,
                commandType: CommandType.StoredProcedure));
            return result;
        }
        //get product attribute by id
        [HttpGet("productAttributes/{attributeId}")]
        public async Task<ProductAttributeValueParameters> Get(int attributeId)
        {
            var dbparams = new DynamicParameters();
            dbparams.Add("Id", attributeId, DbType.Int32);
            var result = await Task.FromResult(_dapper.Get<ProductAttributeValueParameters>("[dbo].[p_GetProductAttributesValuesByAttributeId]",
                    dbparams, commandType: CommandType.StoredProcedure));
            return result;
        }
        //get all product attributes
        [HttpGet("productAttributes")]
        public async Task<List<ProductAttributeValueParameters>> Get()
        {
            var result = await Task.FromResult(_dapper.GetAll<ProductAttributeValueParameters>("[dbo].[p_GetProductAttributesValues]",
                    null, commandType: CommandType.StoredProcedure));
            return result;
        }
        //delete product attribute
        [HttpDelete("productAttributes/{Id}")]
        public async Task<int> Delete(int Id)
        {
            var dbparams = new DynamicParameters();
            dbparams.Add("Id", Id, DbType.Int32);
            var result = await Task.FromResult(_dapper.Execute("[dbo].[p_DeleteAttributesValuesById]",
                dbparams, commandType: CommandType.StoredProcedure));
            return result;
        }
        //update product attribute
        [HttpPut("productAttributes/{Id}")]
        public Task<int> Update(int Id, ProductAttributeValueParameters data)
        {
            var dbParams = new DynamicParameters();
            dbParams.Add("Id", Id);
            dbParams.Add("ProductAttributeId", data.ProductAttributeId, DbType.Int32);
            dbParams.Add("AttributeValue", data.AttributeValue, DbType.String);

            var updateAttributes = Task.FromResult(_dapper.Update<int>("[dbo].[p_UpdateAttributesValues]",
                            dbParams,
                            commandType: CommandType.StoredProcedure));
            return updateAttributes;
        }
    }
}
