using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Pos.Entities.Models
{
   public class User
    {
        //public User()
        //{
        //    this.Roles = new HashSet<Role>();
        //    this.UserRoles = new HashSet<UserRole>();
        //}
        [Description("ignore")]
        public int UserID { get; set; }
        public Nullable<int> OrganizationID { get; set; }
        public Nullable<int> DepartmentID { get; set; }
        public Nullable<int> LocationID { get; set; }
        public Nullable<int> DesignationID { get; set; }
        public Nullable<int> EmployeeID { get; set; }
        public string FirstName { get; set; }
        public string MiddleName { get; set; }
        public string LastName { get; set; }
        public string Name { get; set; }
        public string Id { get; set; }
        public string Password { get; set; }
        public string Salt { get; set; }
        public bool IsActive { get; set; }
        public Nullable<int> CreatedBy { get; set; }
        public Nullable<System.DateTime> CreatedOn { get; set; }
        public Nullable<int> ModifiedBy { get; set; }
        public Nullable<System.DateTime> ModifiedOn { get; set; }
        //public virtual ICollection<Role> Roles { get; set; }
        //public virtual ICollection<UserRole> UserRoles { get; set; }
    }
}
