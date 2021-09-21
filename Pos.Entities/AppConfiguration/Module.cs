using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Pos.Entities.Models
{
   public class Module
    {
        public Module()
        {
            this.Menus = new HashSet<Menu>();
        }

        public int ModuleID { get; set; }
        public string Name { get; set; }
        public bool IsActive { get; set; }
        public Nullable<int> CreatedBy { get; set; }
        public Nullable<System.DateTime> CreatedOn { get; set; }
        public Nullable<int> ModifiedBy { get; set; }
        public Nullable<System.DateTime> ModifiedOn { get; set; }

        public virtual ICollection<Menu> Menus { get; set; }
    }
}
