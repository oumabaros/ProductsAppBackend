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
    //controller to create,delete and update categories
    [ApiController]
    [EnableCors("AllowAllHeaders")]
    public class CategoriesController : ControllerBase
    {
        private readonly IDapper _dapper;
        public CategoriesController(IDapper dapper)
        {
            _dapper = dapper;
        }
        //create categories
        [HttpPost("productCategories")]
        public async Task<int> Create(CategoryParameters data)
        {
            var dbparams = new DynamicParameters();
            dbparams.Add("CategoryName", data.CategoryName, DbType.String);
            
            var result = await Task.FromResult(_dapper.Insert<int>("[dbo].[p_CreateCategory]"
                , dbparams,
                commandType: CommandType.StoredProcedure));
            return result;
        }
        //get category by categoryid
        [HttpGet("productCategories/{Id}")]
        public async Task<CategoryParameters> Get(int Id)
        {
            var dbparams = new DynamicParameters();
            dbparams.Add("Id", Id, DbType.Int32);
            var result = await Task.FromResult(_dapper.Get<CategoryParameters>("[dbo].[p_GetCategoryById]",
                    dbparams, commandType: CommandType.StoredProcedure));
            return result;
        }
        //get all categories
        [HttpGet("productCategories")]
        public async Task<List<CategoryParameters>> Get()
        {
            var result = await Task.FromResult(_dapper.GetAll<CategoryParameters>("[dbo].[p_GetCategory]",
                    null, commandType: CommandType.StoredProcedure));
            return result;
        }
        //delete a category
        [HttpDelete("productCategories/{Id}")]
        public async Task<int> Delete(int Id)
        {
            var dbparams = new DynamicParameters();
            dbparams.Add("Id", Id, DbType.Int32);
            var result = await Task.FromResult(_dapper.Execute("[dbo].[p_DeleteCategoryById]",
                dbparams, commandType: CommandType.StoredProcedure));
            return result;
        }
        //update a category

        [HttpPut("productCategories/{Id}")]
        public Task<int> Update(int Id, CategoryParameters data)
        {
            var dbParams = new DynamicParameters();
            dbParams.Add("Id", Id);
            dbParams.Add("CategoryName", data.CategoryName, DbType.String);
            
            var updateCategory = Task.FromResult(_dapper.Update<int>("[dbo].[p_UpdateCategory]",
                            dbParams,
                            commandType: CommandType.StoredProcedure));
            return updateCategory;
        }
    }
}
