using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using PRONEXEL_Data.Models.CodeFirst;
using PRONEXEL_Data.Models.Dto;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;

namespace PRONEXEL_Business.Repositories
{
    public class UserRepo
    {
        private readonly UserManager<ApplicationUser> _userManager;
        private readonly IHttpContextAccessor _httpContextAccessor;
        private readonly RoleManager<IdentityRole> _roleManager;
        private readonly SignInManager<ApplicationUser> _signInManager;
        private readonly AppDbContext _context;
        public UserRepo(SignInManager<ApplicationUser> _signInManager, AppDbContext context, UserManager<ApplicationUser> _userManager, RoleManager<IdentityRole> _roleManager, IHttpContextAccessor httpContextAccessor)
        {

            this._context = context;
            this._userManager = _userManager;
            this._roleManager = _roleManager;
            _httpContextAccessor = httpContextAccessor;
            this._signInManager = _signInManager;
        }
        public async Task CreateRoles()
        {
            string[] roles = { "ApplicationUser", "Admin","SuperAdmin" }; // Add more roles as needed
            foreach (var role in roles)
            {
                bool roleExists = await _roleManager.RoleExistsAsync(role);
                if (!roleExists)
                {
                    await _roleManager.CreateAsync(new IdentityRole(role));
                }
            }
        }
        public List<RolesDto> AllRoles()
        {
            List<RolesDto> rlist = new List<RolesDto>();
            var roles = _roleManager.Roles.Where(X => X.Name != "SuperAdmin").Select(x => new { value = x.Id, Text = x.Name }).ToList();
            foreach (var item in roles)
            {
                RolesDto rd = new RolesDto();
                rd.RoleName = item.Text;
                rd.Rid = item.value;
                rlist.Add(rd);
            }
            return rlist;
        }
        public async Task<bool> AddUser(UserDto userDto)
        {
            try
            {
                var data = new ApplicationUser {DisplayName=userDto.FirstName+" "+userDto.LastName, UserName = userDto.UserName, Email = userDto.UserEmails, PasswordHash = userDto.Password, NormalizedUserName = userDto.FirstName + " " + userDto.LastName };
                var res = await _userManager.CreateAsync(data, userDto.Password);
                if (res.Succeeded)
                {
                    var defaultrole = _roleManager.FindByIdAsync(userDto.Userrole).Result;
                    var roleresult = await _userManager.AddToRoleAsync(data, defaultrole.Name);
                    return true;
                }
                else
                {
                    string errormsg = string.Join(", ", res);
                }
                return false;
            }
            catch (Exception e)
            {

                return false;
            }


           
        

          
        }
        public async Task<UserDto> AuthinticateUser(UserDto userDto)
        {

            var result = await _signInManager.PasswordSignInAsync(userName: userDto.UserName, userDto.Password, true, lockoutOnFailure: false);
            if (result.Succeeded)
            {
                var Userinfo = await _userManager.FindByNameAsync(userDto.UserName);
                var roles = await _userManager.GetRolesAsync(Userinfo);
                return userDto;
            }
            return null;
        }
        public List<UserDto> GetUserswithRoles()
        {
            List<ApplicationUser> userData = _userManager.Users.ToList();
            List<UserDto> usertd = new List<UserDto>();
            foreach (var item in userData)
            {
                UserDto userDto = new UserDto();
                userDto.UserName = item.UserName;
                userDto.UserEmails = item.Email;
                userDto.Userid = item.Id;
                var dat = _userManager.GetRolesAsync(item).Result;
                userDto.Userrole = dat[0];
                if (userDto.Userrole != "Super Admin")
                {
                    usertd.Add(userDto);
                }
            }
            return usertd;
        }
        public async Task<bool> Logout()
        {
            await _signInManager.SignOutAsync();
            return true;
        }
        [HttpGet]
        public async Task<string> DeleteUser(string userid)
        {
            var data = await _userManager.FindByIdAsync(userid);
            if (data != null)
            {
                var res = await _userManager.DeleteAsync(data);
                return ("Deleted");
            }
            return ("Not Delete");
        }
        public async Task<string> GetUserName(string userid)
        {
            try
            {
                //return "Not Found";
                var user = await _userManager.FindByIdAsync(userid);
                if (user != null)
                {
                    return user.UserName;
                }
                return "Anonymous User";
            }
            catch (Exception)
            {

                return "Not Found";
            }

        }
        public async Task<string> GetUserEmailById(string userId)
        {
            try
            {
                //return "Not Found";
                var user = await _userManager.FindByIdAsync(userId);
                if (user != null)
                {
                    return user.Email;
                }
                return "Anonymous User";
            }
            catch (Exception)
            {

                return "Not Found";
            }
        }
        public async Task<string> ActiveUserId()
        {
            var userId = _httpContextAccessor.HttpContext.User.FindFirst(ClaimTypes.Email)?.Value;
            if (userId != null)
            {
                var res = await _userManager.FindByEmailAsync(userId);
                return res.Id;
            }
            else
            {
                return "Anonymous User";
            }
        }
        public async Task<ApplicationUser> getUser(string id)
        {
            var dt = await _userManager.FindByIdAsync(id);
            return dt;
        }
        public async Task<IEnumerable<string>> GetUserRolesAsync(string id)
        {
            var Userinfo = await _userManager.FindByIdAsync(id);

            if (Userinfo == null)
            {
                // Handle the case where the user doesn't exist
                return null;
            }

            var userRoles = await _userManager.GetRolesAsync(Userinfo);

            return userRoles;
        }
    }
}
