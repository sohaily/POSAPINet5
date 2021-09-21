using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Pos.Entities.Models
{
   public class UserRole
    {
        public int UserID { get; set; }
        public int RoleID { get; set; }
        public Nullable<int> CreatedBy { get; set; }
        public Nullable<System.DateTime> CreatedOn { get; set; }
        public Nullable<int> ModifiedBy { get; set; }
        public Nullable<System.DateTime> ModifiedOn { get; set; }

        [Description("ignore")]
        public virtual Role Role { get; set; }
        [Description("ignore")]
        public virtual User User { get; set; }
    }
}
