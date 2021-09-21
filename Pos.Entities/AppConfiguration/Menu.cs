using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Pos.Entities.Models
{
    public class Menu
    {
        public Menu()
        {
            this.Menu1 = new HashSet<Menu>();
            this.RolePermissions = new HashSet<RolePermission>();
        }

        public int MenuID { get; set; }
        public Nullable<int> ParentMenuID { get; set; }
        public Nullable<int> ModuleID { get; set; }
        public string Name { get; set; }
        public string Area { get; set; }
        public string Controller { get; set; }
        public string Action { get; set; }
        public string Class { get; set; }
        public string Url { get; set; }
        public string Icon { get; set; }
        public Nullable<int> MenulLevel { get; set; }
        public Nullable<int> SortOrder { get; set; }
        public bool IsActive { get; set; }
        public Nullable<int> CreatedBy { get; set; }
        public Nullable<System.DateTime> CreatedOn { get; set; }
        public Nullable<int> ModifiedBy { get; set; }
        public Nullable<System.DateTime> ModifiedOn { get; set; }

        public virtual ICollection<Menu> Menu1 { get; set; }
        public virtual Menu Menu2 { get; set; }
        public virtual Module Module { get; set; }
        public virtual ICollection<RolePermission> RolePermissions { get; set; }
    }
}
