using Dapper;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection;
using System.Text;

namespace Pos.DAL.Core
{
    public abstract class DapperContext
    {
        protected string connectionString = "Data Source=DESKTOP-2Q2AIBL;Database=Pos;User Id=sa;Pwd=123;";
        //protected string connectionString = "Data Source=localhost;Integrated Security=False;User ID=pos_user;Connect Timeout=15;Encrypt=False;Packet Size=4096";
        //protected string connectionString = "Data Source=PK-LHR-CET-036\\SQLEXPRESS;Database=Pos;User Id=sa;Pwd=Abacus123;";
        private SqlConnection SqlConnection()
        {
            return new SqlConnection(connectionString);
        }

        public IDbConnection CreateConnection()
        {
            var conn = SqlConnection();
            conn.Open();
            return conn;
        }

        private string GenerateInsertQuery<T>()
        {
            var insertQuery = new StringBuilder($"INSERT INTO {GetTableName(typeof(T).Name)} ");

            insertQuery.Append("(");

            var properties = GenerateListOfProperties<T>(GetProperties<T>());

            properties.ForEach(prop =>
            {
                if (!prop.Contains("Updated"))
                {
                    insertQuery.Append($"[{prop}],");
                }
            });

            insertQuery.Remove(insertQuery.Length - 1, 1).Append(") VALUES (");

            properties.ForEach(prop =>
            {
                if (!prop.Contains("Updated"))
                {
                    insertQuery.Append($"@{prop},");
                }
            });

            insertQuery.Remove(insertQuery.Length - 1, 1).Append(")");

            insertQuery.Append(";SELECT SCOPE_IDENTITY()");

            return insertQuery.ToString();
        }

        private string GenerateUpdateQuery<T>()
        {
            var updateQuery = new StringBuilder($"UPDATE {GetTableName(typeof(T).Name)} SET ");
            var properties = GenerateListOfProperties<T>(GetProperties<T>());

            properties.ForEach(property =>
            {
                if (!property.Contains("Created"))
                {
                    updateQuery.Append($"{property}=@{property},");
                }
            });

            updateQuery.Remove(updateQuery.Length - 1, 1); //remove last comma

            return updateQuery.ToString();
        }

        private IEnumerable<PropertyInfo> GetProperties<T>()
        {
            return typeof(T).GetProperties();
        }

        private static List<string> GenerateListOfProperties<T>(IEnumerable<PropertyInfo> listOfProperties)
        {
            return (from prop in listOfProperties
                    let attributes = prop.GetCustomAttributes(typeof(DescriptionAttribute), false)
                    where attributes.Length <= 0 || (attributes[0] as DescriptionAttribute)?.Description != "ignore"
                    select prop.Name).ToList();
        }

        public T SingleOrDefault<T>(string where)
        {
            var query = $"SELECT * FROM {GetTableName(typeof(T).Name)}  {where}";
            using (var connection = CreateConnection())
            {
                var result = connection.QuerySingleOrDefault<T>(query);
                return result;
            }
        }

        public IEnumerable<T> GetAll<T>(string spName = "", DynamicParameters dynamicParameters = null)
        {
            using (var connection = CreateConnection())
            {
                return connection.Query<T>(spName, dynamicParameters, commandType: CommandType.StoredProcedure);
            }
        }
        public IEnumerable<T> GetAllWithPagination<T>(string spName = "", DynamicParameters dynamicParameters = null)
        {
            using (var connection = CreateConnection())
            {
                return connection.Query<T>(spName, dynamicParameters, commandType: CommandType.StoredProcedure);
            }
        }

        private DynamicParameters AddParameters(List<SqlParameter> sqlParameters)
        {
            var dynamicParameters = new DynamicParameters();
            sqlParameters.ForEach(p => dynamicParameters.Add(p.ParameterName, p.Value));
            return dynamicParameters;
        }

        //public int Insert<T>(T t)
        //{
        //    var insertQuery = GenerateInsertQuery<T>();

        //    using (var connection = CreateConnection())
        //    {
        //        return connection.ExecuteScalar<int>(insertQuery, t);
        //    }
        //}

        public int Insert<T>(T t, IDbTransaction transaction = null)
        {
            var insertQuery = GenerateInsertQuery<T>();

            using (var connection = CreateConnection())
            {
                return connection.ExecuteScalar<int>(insertQuery, t, transaction: transaction);
            }
        }

        //public string SaveRange<T>(IEnumerable<T> list)
        //{
        //    var inserted = string.Empty;
        //    var query = GenerateInsertQuery<T>();
        //    using (var connection = CreateConnection())
        //    {
        //        inserted += connection.ExecuteScalar<string>(query, list) + " ";
        //    }
        //    return inserted;
        //}

        public string SaveRange<T>(IEnumerable<T> list, IDbTransaction transaction = null)
        {
            var inserted = string.Empty;
            var query = GenerateInsertQuery<T>();
            using (var connection = CreateConnection())
            {
                inserted += connection.ExecuteScalar<string>(query, list, transaction: transaction) + " ";
            }
            return inserted;
        }

        public int Update<T>(T t, string where)
        {
            var updateQuery = $"{GenerateUpdateQuery<T>()} {where} ;SELECT @@RowCount";

            using (var connection = CreateConnection())
            {
                return connection.Execute(updateQuery, t);
            }
        }

        public int ExecuteQuery(string query, IDbTransaction transaction = null)
        {
            using (var connection = CreateConnection())
            {
                return connection.Execute(query, transaction: transaction);
            }
        }

        public int Delete<T>(string where, IDbTransaction transaction = null)
        {
            var query = $"DELETE FROM {GetTableName(typeof(T).Name)} {where}";

            using (var connection = CreateConnection())
            {
                return connection.Execute(query, transaction: transaction);
            }
        }

        public bool IsExists(string tableName, string columnName, string columnValue)
        {
            var query = $"SELECT COUNT(1) FROM {tableName} WHERE {columnName} = '{columnValue}' ";

            using (var connection = CreateConnection())
            {
                return connection.ExecuteScalar<int>(query) > 0;
            }
        }

        private string GetTableName(string entityName)
        {
            if (entityName.ToLower().EndsWith("y"))
            {
                return entityName.Remove(entityName.Length - 1, 1) + "ies";
            }
            else
            {
                return entityName + "s";
            }
        }

        public int GetOffset(int pageSize, int pageNumber)
        {
            return (pageNumber - 1) * pageSize;
        }

    }
}
