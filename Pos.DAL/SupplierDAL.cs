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
    public class SupplierDAL : DapperContext
    {
        public int SaveSupplier(Supplier supplier)
        {
            return Insert<Supplier>(supplier);
        }

        public int UpdateSupplier(Supplier supplier)
        {
            return Update<Supplier>(supplier, $" WHERE SupplierID = {supplier.SupplierId}");
        }

        public int DeleteSupplier(int supplierID)
        {
            return Delete<Supplier>($" WHERE SupplierID = {supplierID}");
        }

        public IEnumerable<Supplier> GetAllWithPagination(Paging paging)
        {
            var values = new DynamicParameters();
            // values.AddDynamicParams(new { PageOffset = paging.PageNo-1, MaxRecords = paging.PageSize, SortOrder =paging.SortOrder, SearchParam =paging.SearchParam, Action ="" });
            values.AddDynamicParams(new { PageOffset = GetOffset(paging.PageSize, paging.PageNo), MaxRecords = paging.PageSize, SortOrder = paging.SortOrder, SearchParam = paging.SearchParam, Action = "" });
            return GetAllWithPagination<Supplier>("SP_GetSuppliers", values);
        }
        public IEnumerable<Supplier> GetAllSuppliers()
        {
            var values = new DynamicParameters();
            values.AddDynamicParams(new { Action = "getAll" });
            return GetAllWithPagination<Supplier>("SP_GetSuppliers", values);
        }

        public Supplier GetSupplierById(int supplierID)
        {
            return SingleOrDefault<Supplier>($" WHERE SupplierID = {supplierID} ");
        }
    }
}
