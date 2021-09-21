using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;
using Newtonsoft.Json;
using Pos.BLL.User;
using Pos.Entities.Models;
using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
using static Pos.Entities.Common.DataTables;

namespace PosServices.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class UserController : ControllerBase
    {
        UserBLL userBAL = new();
        [HttpGet("GetAllUser")]
        [AllowAnonymous]
        public IActionResult GetAllUsers()
        {
          
            try
            {
                return Ok(userBAL.GetAllUser());
            }
            catch (Exception ex)
            {
                return Ok(ex.Message);
            }
          
        }
        [HttpGet("GetUserRoles")]
        [AllowAnonymous]
        public IActionResult Get()
        {
            PagingRequest paging = new PagingRequest();
            var pagingResponse = new PagingResponse();
            Paging page = new Paging();
            page.Draw = paging.Draw;
            pagingResponse = userBAL.GetUserRoles(page);
            return Ok(pagingResponse);
        }
        
        [HttpPost]
        [AllowAnonymous]
        public IActionResult SaveUser(User user)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    userBAL.SaveUser(user);
                    return Ok(user);
                }
                else
                {
                    return Ok(user);
                }
            }
            catch (Exception ex)
            {
                return Ok(user);
            }
        }
        [HttpPost("ValidateUser")]
        [AllowAnonymous]
        public IActionResult ValidateUser(User user)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    var userDto = userBAL.ValidateUser(user.Id,user.Password);// new LoginService().ValidateUser(vm.UserId, vm.Password);
                    var userRoles = userBAL.GetUserRoles(userDto.UserID);
                    var userMenus = userBAL.GetMenus(userDto.UserID);

                    if (userDto != null)
                    {
                        IdentityOptions _option = new IdentityOptions();
                        var tokenDescriptor = new SecurityTokenDescriptor
                        {
                            Subject = new ClaimsIdentity(new Claim[]
                           {
                                new Claim("UserID", user.Id.ToString()),
                           }),
                            Expires = DateTime.UtcNow.AddDays(30),
                            //SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_appSettings.JWT_Secret)), SecurityAlgorithms.HmacSha256Signature)
                            SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(Encoding.UTF8.GetBytes("1234567890123456")), SecurityAlgorithms.HmacSha256Signature)
                        };
                        var tokenHandler = new JwtSecurityTokenHandler();
                        var securityToken = tokenHandler.CreateToken(tokenDescriptor);
                        var token = tokenHandler.WriteToken(securityToken);
                        return Ok(new { token= token,roles= JsonConvert.SerializeObject(userRoles),menu= JsonConvert.SerializeObject(userMenus),result=true,msg="Logged in successfully" });
                    }
                    else
                    {
                        return Ok(new { result = false, msg = "Something went wrong, plesase try again!" ,exception=false});
                    }
                }
                else
                {
                    return Ok(new { result = false, msg = "User Name or Password is Invalid!", exception = false });
                }
            }
            catch (Exception ex)
            {
                return Ok(new { result = false, msg = ex.Message, exception = true });
            }
           
        }
    }
}
