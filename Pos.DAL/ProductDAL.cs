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
    public class ProductDAL : DapperContext
    {
        public int SaveProduct(Product product)
        {
            return Insert<Product>(product);
        }

        public int UpdateProduct(Product product)
        {
            return Update<Product>(product, $" WHERE ProductId = {product.ProductId}");
        }

        public int DeleteProduct(int productId)
        {
            return Delete<Product>($" WHERE ProductId = {productId}");
        }

        public IEnumerable<Product> GetAllWithPagination(Paging paging)
        {
            var values = new DynamicParameters();
            // values.AddDynamicParams(new { PageOffset = paging.PageNo-1, MaxRecords = paging.PageSize, SortOrder =paging.SortOrder, SearchParam =paging.SearchParam, Action ="" });
            values.AddDynamicParams(new { PageOffset = GetOffset(paging.PageSize, paging.PageNo), MaxRecords = paging.PageSize, SortOrder = paging.SortOrder, SearchParam = paging.SearchParam, Action = "" });
            return GetAllWithPagination<Product>("SP_GetProducts", values);
        }
        public IEnumerable<Product> GetAllProducts()
        {
            var values = new DynamicParameters();
            values.AddDynamicParams(new { Action = "getAll" });
            return GetAllWithPagination<Product>("SP_GetProducts", values);
        }

        public Product GetProductById(string searchValue)
        {
            return SingleOrDefault<Product>($" WHERE Barcode = '{searchValue}' OR ProductName = '{searchValue}' OR ProductCode = '{searchValue}' ");
        }
    }
}
