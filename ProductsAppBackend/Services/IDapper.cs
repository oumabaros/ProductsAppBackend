using Dapper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Linq;
using System.Threading.Tasks;

namespace ProductsAppBackend.Services
{
    //Interface for Dapper ORM
    public interface IDapper:IDisposable
    {
        //get connection to database
        DbConnection GetDbconnection();
        //get single row data
        T Get<T>(string sp, DynamicParameters parms, CommandType commandType = CommandType.StoredProcedure);
       //get multi-row data
        List<T> GetAll<T>(string sp, DynamicParameters parms, CommandType commandType = CommandType.StoredProcedure);
        //for delete or count
        int Execute(string sp, DynamicParameters parms, CommandType commandType = CommandType.StoredProcedure);
        //insert data
        T Insert<T>(string sp, DynamicParameters parms, CommandType commandType = CommandType.StoredProcedure);
        //update data
        T Update<T>(string sp, DynamicParameters parms, CommandType commandType = CommandType.StoredProcedure);
    }
 

    
}
