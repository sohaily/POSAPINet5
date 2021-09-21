using Dapper;
using Pos.DAL.Core;
using Pos.Entities.Models;
using System;
using System.Collections.Generic;
using System.Text;
using static Pos.Entities.Common.DataTables;

namespace Pos.DAL
{
    public class CategoryDAL : DapperContext
    {
        public int SaveCategory(Category category)
        {
            return Insert<Category>(category);
        }

        public int UpdateCategory(Category category)
        {
            return Update<Category>(category, $" WHERE CategoryID = {category.CategoryID}");
        }

        public int DeleteCategory(int categoryID)
        {
            return Delete<Category>($" WHERE CategoryID = {categoryID}");
        }

        public IEnumerable<Category> GetAllWithPagination(Paging paging)
        {
            var values = new DynamicParameters();
           // values.AddDynamicParams(new { PageOffset = paging.PageNo-1, MaxRecords = paging.PageSize, SortOrder =paging.SortOrder, SearchParam =paging.SearchParam, Action ="" });
            values.AddDynamicParams(new { PageOffset = GetOffset(paging.PageSize, paging.PageNo), MaxRecords = paging.PageSize, SortOrder =paging.SortOrder, SearchParam =paging.SearchParam, Action ="" });
            return GetAllWithPagination<Category>("SP_GetCategories", values);
        }
        public IEnumerable<Category> GetAllCategories()
        {
            var values = new DynamicParameters();
            values.AddDynamicParams(new { Action = "getAll" });
            return GetAllWithPagination<Category>("SP_GetCategories", values);
        }

        public Category GetCategoryById(int categoryID)
        {
            return SingleOrDefault<Category>($" WHERE CategoryID = {categoryID} ");
        }
        public int GetOffset(int pageSize, int pageNumber)
        {
            return (pageNumber - 1) * pageSize;
        }
    }
}
