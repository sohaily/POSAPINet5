using Pos.DAL;
using Pos.Entities.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static Pos.Entities.Common.DataTables;

namespace Pos.BLL.User
{
   public class UserBLL
    {
        UserDAL userDAL = new();
        public int SaveUser(Pos.Entities.Models.User user)
        {
            //if (user.UserID > 0)
            //{
            //    return userDAL.UpdateUser(user);
            //}
            //else
            //{
                var salt = CommonService.GetSaltString();
                var saltBA = CommonService.GetSaltByteArray(salt);
                var hash = CommonService.GetHashSha256(user.Password, saltBA);
                user.Salt = salt;
                user.Password = hash;
                return userDAL.SaveUser(user);
           // }
        }
        public PagingResponse GetUserRoles(Paging paging)
        {
            try
            {
                var res = userDAL.GetUserRoles(paging);
                int totalRecord = res.Count();

                PagingResponse pagingResponse = new PagingResponse
                {
                    Draw = paging.Draw,
                    Data = res,
                    RecordsFiltered = totalRecord,
                    RecordsTotal = totalRecord
                };
                return pagingResponse;
            }
            catch (Exception)
            {
                throw;
            }
            
        }
        public  Pos.Entities.Models.User ValidateUser(string userId, string password)
        {
            Pos.Entities.Models.User user = new Entities.Models.User();
            try
            {
                 user = userDAL.ValidateUser(userId);
                // GetUserById
                // var user = new GenericOperations<Data.User>(context).Get(uzr => uzr.Id == userId).SingleOrDefault();
                if (user == null)
                {
                    // throw new UserExceptions.UserNotFoundException("Exception: User not found");
                }

                //  user = new GenericOperations<Data.User>(context).Get(uzr => uzr.Id == userId && uzr.IsActive).SingleOrDefault();
                if (user == null)
                {
                    // throw new UserDisabledException("Exception: Login disabled");
                }

                var saltByteArray = CommonService.GetSaltByteArray(user.Salt);
                var passwordString = CommonService.GetHashSha256(password, saltByteArray);//create hash for password entered by user

                if (user != null && user.Id == userId && user.Password == passwordString)//compare computed hash password with db password
                {
                   return user;
                }
                else
                {
                    // throw new InvalidUserIdOrPasswordException("Invalid user id or password");//for security reason, both user id or password not found exception is thrown, as, only password is incorrect at this point
                }
                return user;
                // }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public IEnumerable<UserRole> GetUserRoles(int Id)
        {
            try
            {
                return userDAL.GetUserRolesById(Id);
            }
            catch (Exception)
            {
                throw;
            }

        }
        public IEnumerable<Pos.Entities.Models.User> GetAllUser()
        {
            try
            {
                return userDAL.GetAllUser();
            }
            catch (Exception)
            {
                throw;
            }

        }
        public IEnumerable<Menu> GetMenus(int Id)
        {
            try
            {
                return userDAL.GetMenus(Id);
            }
            catch (Exception)
            {
                throw;
            }

        }
    }
}
