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
    //controller to create,delete and update product attributes types
    [ApiController]
    [EnableCors("AllowAllHeaders")]
    public class ProductAttributeTypesController : ControllerBase
    {
        private readonly IDapper _dapper;
        public ProductAttributeTypesController(IDapper dapper)
        {
            _dapper = dapper;
        }
        //create product attributes types
        [HttpPost("attributeTypes")]
        public async Task<int> Create(ProductAttributeTypesParameters data)
        {
            var dbparams = new DynamicParameters();
                dbparams.Add("AttributeName", data.AttributeName, DbType.String);
            
            var result = await Task.FromResult(_dapper.Insert<int>("[dbo].[p_CreateAttributes]"
                , dbparams,
                commandType: CommandType.StoredProcedure));
            return result;
        }
        //get product attributes types by id
        [HttpGet("attributeTypes/{Id}")]
        public async Task<ProductAttributeTypesParameters> GetById(int Id)
        {
            var dbparams = new DynamicParameters();
            dbparams.Add("Id", Id, DbType.Int32);
            var result = await Task.FromResult(_dapper.Get<ProductAttributeTypesParameters>("[dbo].[p_GetAttributesById]",
                    dbparams, commandType: CommandType.StoredProcedure));
            return result;
        }
        //get all product attributes types
        [HttpGet("attributeTypes")]
        public async Task<List<ProductAttributeTypesParameters>> Get()
        {
            var result = await Task.FromResult(_dapper.GetAll<ProductAttributeTypesParameters>("[dbo].[p_GetAttributes]",
                    null, commandType: CommandType.StoredProcedure));
            return result;
        }
        //delete product attributes types
        [HttpDelete("attributeTypes/{Id}")]
        public async Task<int> Delete(int Id)
        {
            var dbparams = new DynamicParameters();
            dbparams.Add("Id", Id, DbType.Int32);
            var result = await Task.FromResult(_dapper.Execute("[dbo].[p_DeleteAttributesById]",
                dbparams, commandType: CommandType.StoredProcedure));
            return result;
        }
        //update product attributes types
        [HttpPut("attributeTypes/{Id}")]
        public Task<int> Update(int Id, ProductAttributeTypesParameters data)
        {
            var dbParams = new DynamicParameters();
            dbParams.Add("Id", Id);
            var dbparams = new DynamicParameters();
            dbparams.Add("AttributeName", data.AttributeName, DbType.String);

            var updateProductAttributeTypes = Task.FromResult(_dapper.Update<int>("[dbo].[p_UpdateAttributes]",
                            dbParams,
                            commandType: CommandType.StoredProcedure));
            return updateProductAttributeTypes;
        }
    }
}
