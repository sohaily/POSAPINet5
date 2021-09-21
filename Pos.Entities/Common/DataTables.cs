using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Pos.Entities.Common
{
    public class DataTables
    {
        public class PagingRequest
        {
            public int Draw { get; set; }
            public IList<Column> Columns { get; set; }
            public IList<Order> Order { get; set; }
            public int Start { get; set; }
            public int Length { get; set; }
            public Search Search { get; set; }
            public IList<ExtFilter> ExtFilters { get; set; }
            public SearchCriteria SearchCriteria { get; set; }
        }
        public class Column
        {
            public string Data { get; set; }
            public string Name { get; set; }
            public bool Searchable { get; set; }
            public bool Orderable { get; set; }
            public Search Search { get; set; }
        }
        public class Order
        {
            public int Column { get; set; }
            public string Dir { get; set; }
        }
        public class SearchCriteria
        {

            public string Filter { get; set; }
            public bool IsPageLoad { get; set; }
        }
        public class Search
        {

            public string Value { get; set; }
            public bool Regex { get; set; }
        }
        public class PagingResponse
        {
            public int Draw { get; set; }
            public int RecordsFiltered { get; set; }
            public int RecordsTotal { get; set; }
            public object Data { get; set; }
        }
        public class Paging
        {
            public int Draw { get; set; }
            public int PageNo { get; set; }
            public int PageSize { get; set; }
            public string SortCol { get; set; }
            public string SortOrder { get; set; }
            public string SortParam { get; set; }
            public string SearchParam { get; set; }
            public List<ExtFilter> ExtFilter { get; set; }
        }
        public class ExtFilter
        {

            public string Id { get; set; }
            public string FieldName { get; set; }
            public string From { get; set; }
            public string To { get; set; }
        }
    }
}