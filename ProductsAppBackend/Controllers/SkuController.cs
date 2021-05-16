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
    //controller to create,update and delete SKUs
    [ApiController]
    [EnableCors("AllowAllHeaders")]
    public class SkuController : ControllerBase
    {
        private readonly IDapper _dapper;
        public SkuController(IDapper dapper)
        {
            _dapper = dapper;
        }
        //create SKU
        [HttpPost("sku")]
        public async Task<int> Create(SkuParameters data)
        {
            var dbparams = new DynamicParameters();
            dbparams.Add("SkuName", data.SkuName, DbType.String);
            var result = await Task.FromResult(_dapper.Insert<int>("[dbo].[p_CreateSku]"
                , dbparams,
                commandType: CommandType.StoredProcedure));
            return result;
        }
        //get SKU by id
        [HttpGet("sku/{Id}")]
        public async Task<SkuParameters> GetById(int Id)
        {
            var dbparams = new DynamicParameters();
            dbparams.Add("Id", Id, DbType.Int32);
            var result = await Task.FromResult(_dapper.Get<SkuParameters>("[dbo].[p_GetSkuById]",
                    dbparams, commandType: CommandType.StoredProcedure));
            return result;
        }
        //get all SKUs
        [HttpGet("sku")]
        public async Task <List<SkuParameters>> Get()
        {
            var result = await Task.FromResult(_dapper.GetAll<SkuParameters>("[dbo].[p_GetSku]",
                    null, commandType: CommandType.StoredProcedure));
            return result;
        }
        //delete SKU
        [HttpDelete("sku/{Id}")]
        public async Task<int> Delete(int Id)
        {
            var dbparams = new DynamicParameters();
            dbparams.Add("Id", Id, DbType.Int32);
            var result = await Task.FromResult(_dapper.Execute("[dbo].[p_DeleteSkuById]", 
                dbparams, commandType: CommandType.StoredProcedure));
            return result;
        }
        //update SKU
        [HttpPut("sku/{Id}")]
        public Task<int> Update(int Id,SkuParameters data)
        {
            var dbPara = new DynamicParameters();
            dbPara.Add("Id", Id);
            dbPara.Add("Name", data.SkuName, DbType.String);

            var updateSku = Task.FromResult(_dapper.Update<int>("[dbo].[p_UpdateSku]",
                            dbPara,
                            commandType: CommandType.StoredProcedure));
            return updateSku;
        }
    }
}
