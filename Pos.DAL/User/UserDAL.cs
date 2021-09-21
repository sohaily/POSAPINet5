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
    public class UserDAL : DapperContext
    {
        public int SaveUser(User user)
        {
            return Insert<User>(user);
        }

        public int UpdateUser(User user)
        {
            return Update<User>(user, $" WHERE UserID = {user.UserID}");
        }

        public int DeleteUser(int UserID)
        {
            return Delete<User>($" WHERE UserID = {UserID}");
        }

        public IEnumerable<User> GetAllUser()
        {
            return GetAll<User>("SP_GetAllUsers", null);
        }

        public User GetUserById(int UserID)
        {
            return SingleOrDefault<User>($" WHERE UserID ={UserID} ");
        }
        public User ValidateUser(string UserID)
        {
            return SingleOrDefault<User>($" WHERE Id = {"'"}{UserID}{"'"} ");
        }
        public IEnumerable<RolePermission> GetUserRoles(Paging paging)
        {
            return GetAll<RolePermission>("SP_GetUserRoles", null);
        }
        public IEnumerable<UserRole> GetUserRolesById(int Id)
        {

            var values = new DynamicParameters();
             values.AddDynamicParams(new { userId = Id});
            return GetAll<UserRole>("SP_GetUserRolesById", values);
        }
        public IEnumerable<Menu> GetMenus(int Id)
        {

            var values = new DynamicParameters();
            values.AddDynamicParams(new { userId = Id });
            return GetAll<Menu>("SP_GetMenus", null);
        }


    }
}
