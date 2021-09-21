using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Pos.Entities.Models
{
    public class Category
    {
        [Description("ignore")]
        public int CategoryID { get; set; }
        public string CategoryName { get; set; }
        public string Description { get; set; }
        public int? ParentCategoryID { get; set; }
        public bool IsActive { get; set; }
        [Description("ignore")]
        public bool IsDeleted { get; set; }
        public DateTime CreatedAt { get; set; }
        public int CreatedBy { get; set; }
        public DateTime UpdatedAt { get; set; }
        public int UpdatedBy { get; set; }

        [Description("ignore")]
        public int Count { get; set; }
    }
}
