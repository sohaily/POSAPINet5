using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Pos.Entities.Models
{
    public class RolePermission
    {
        public int RoleID { get; set; }
        [Description("ignore")]
        public string Role { get; set; }
        public int MenuID { get; set; }
        [Description("ignore")]
        public string Menu { get; set; }
        public Nullable<bool> CanView { get; set; }
        public Nullable<bool> CanAdd { get; set; }
        public Nullable<bool> CanEdit { get; set; }
        public Nullable<bool> CanDelete { get; set; }
        public Nullable<bool> CanApprove { get; set; }
        public Nullable<int> CreatedBy { get; set; }
        public Nullable<System.DateTime> CreatedOn { get; set; }
        public Nullable<int> ModifiedBy { get; set; }
        public Nullable<System.DateTime> ModifiedOn { get; set; }
        [Description("ignore")]
        public virtual UserRole UserRole { get; set; }

    }
}
