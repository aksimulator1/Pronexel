using Dapper;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Configuration;
using System.Data;
using Microsoft.Data.SqlClient;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace PRONEXEL_Business.Services
{
    public class DatabaseService
    {

        private readonly IConfiguration _configuration;
        public DatabaseService(IConfiguration _configuration)
        {
            this._configuration = _configuration;
        }
        public async Task<IEnumerable<T>> GetEntitiesAsync<T>(string query, List<SqlParameter> parameters = null)
        {
            using IDbConnection dbConnection = new SqlConnection(_configuration.GetConnectionString("DefaultConnection"));
            dbConnection.Open();

            var dynamicParameters = new DynamicParameters();

            // Add parameters to DynamicParameters
            if (parameters != null)
            {
                foreach (var parameter in parameters)
                {
                    dynamicParameters.Add(parameter.ParameterName, parameter.Value, parameter.DbType, parameter.Direction, parameter.Size);
                }
            }

            var entities = await dbConnection.QueryAsync<T>(new CommandDefinition(query, dynamicParameters, commandType: CommandType.Text));
            return entities;
        }

        public async Task<IEnumerable<T>> ExecuteStoredProcedureAsync<T>(string storedProcedure, object obj = null,string constring=null)
        {
            try
            {
                var parameters=ReturnSqlParameters(obj);
                string con;
                if (constring != null)
                    con = constring;
                else
                    con = _configuration.GetConnectionString("DefaultConnection");
                using (IDbConnection dbConnection = new SqlConnection(con))
                {
                    dbConnection.Open();

                    var dynamicParameters = new DynamicParameters();
                    if (parameters != null)
                    {
                        foreach (var parameter in parameters)
                        {
                            dynamicParameters.Add(parameter.ParameterName, parameter.Value, size: parameter.Size, direction: parameter.Direction, dbType: parameter.DbType);

                        }
                    }

                    var result = await dbConnection.QueryAsync<T>(storedProcedure, dynamicParameters, commandType: CommandType.StoredProcedure);
                    return result;
                }
            }
            catch (Exception ex)
            {
                // Log or handle the exception as needed
                Console.WriteLine($"Error executing stored procedure: {ex.Message}");
                throw;
            }
        }

        public List<SqlParameter> ReturnSqlParameters(object obj)
        {
            try
            {
                if(obj==null)
                {
                    return null;
                }
                List<SqlParameter> parameters = new List<SqlParameter>();
                Type objectType = obj.GetType();
                PropertyInfo[] properties = objectType.GetProperties();
                foreach (PropertyInfo property in properties)
                {
                    parameters.Add(new SqlParameter("@" + property.Name, property.GetValue(obj)));
                }
                return parameters;
            }
            catch (Exception e)
            {

                return null;
            }
           
        }


    }
}
