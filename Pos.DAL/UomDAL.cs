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
    public class UomDAL : DapperContext
    {
        public int SaveUom(Uom uom)
        {
            return Insert<Uom>(uom);
        }

        public int UpdateUom(Uom uom)
        {
            return Update<Uom>(uom, $" WHERE UomId = {uom.UomId}");
        }

        public int DeleteUom(int uomId)
        {
            return Delete<Uom>($" WHERE UomId = {uomId}");
        }

        public IEnumerable<Uom> GetAllWithPagination(Paging paging)
        {
            var values = new DynamicParameters();
            // values.AddDynamicParams(new { PageOffset = paging.PageNo-1, MaxRecords = paging.PageSize, SortOrder =paging.SortOrder, SearchParam =paging.SearchParam, Action ="" });
            values.AddDynamicParams(new { PageOffset = GetOffset(paging.PageSize, paging.PageNo), MaxRecords = paging.PageSize, SortOrder = paging.SortOrder, SearchParam = paging.SearchParam, Action = "" });
            return GetAllWithPagination<Uom>("SP_GetUoms", values);
        }
        public IEnumerable<Uom> GetAllUoms()
        {
            var values = new DynamicParameters();
            values.AddDynamicParams(new { Action = "getAll" });
            return GetAllWithPagination<Uom>("SP_GetUoms", values);
        }

        public Uom GetUomById(int uomId)
        {
            return SingleOrDefault<Uom>($" WHERE UomId = {uomId} ");
        }
    }
}
