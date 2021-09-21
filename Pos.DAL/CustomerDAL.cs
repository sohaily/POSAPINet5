using Dapper;
using Pos.DAL.Core;
using Pos.Entities.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static Pos.Entities.Common.DataTables;

namespace Pos.DAL
{
    public class CustomerDAL : DapperContext
    {
        public int SaveCustomer(Customer customer)
        {
            return Insert<Customer>(customer);
        }

        public int UpdateCustomer(Customer customer)
        {
            return Update<Customer>(customer, $" WHERE CustomerID = {customer.CustomerID}");
        }

        public int DeleteCustomer(int customerID)
        {
            return Delete<Customer>($" WHERE CustomerID = {customerID}");
        }

        public IEnumerable<Customer> GetAllWithPagination(Paging paging)
        {
            var values = new DynamicParameters();
            // values.AddDynamicParams(new { PageOffset = paging.PageNo-1, MaxRecords = paging.PageSize, SortOrder =paging.SortOrder, SearchParam =paging.SearchParam, Action ="" });
            values.AddDynamicParams(new { PageOffset = GetOffset(paging.PageSize, paging.PageNo), MaxRecords = paging.PageSize, SortOrder = paging.SortOrder, SearchParam = paging.SearchParam, Action = "" });
            return GetAllWithPagination<Customer>("SP_GetCustomers", values);
        }
        public IEnumerable<Customer> GetAllCustomers()
        {
            var values = new DynamicParameters();
            values.AddDynamicParams(new { Action = "getAll" });
            return GetAllWithPagination<Customer>("SP_GetCustomers", values);
        }

        public Customer GetCustomerById(int categoryID)
        {
            return SingleOrDefault<Customer>($" WHERE CustomerID = {categoryID} ");
        }
       
    }
}
