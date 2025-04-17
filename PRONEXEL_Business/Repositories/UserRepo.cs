using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using PRONEXEL_Data.Models.Dto;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PRONEXEL_Business.Repositories
{
    public class UserRepo
    {
        private readonly UserManager<IdentityUser> _userManager;
        private readonly IHttpContextAccessor _httpContextAccessor;
        private readonly RoleManager<IdentityRole> _roleManager;
        private readonly AppDbContext _context;
        public UserRepo(AppDbContext context, UserManager<IdentityUser> _userManager, RoleManager<IdentityRole> _roleManager, IHttpContextAccessor httpContextAccessor)
        {

            this._context = context;
            this._userManager = _userManager;
            this._roleManager = _roleManager;
            _httpContextAccessor = httpContextAccessor;
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
            var roles = _roleManager.Roles.Where(X => X.Name != "Super Admin").Select(x => new { value = x.Id, Text = x.Name }).ToList();
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
                var data = new IdentityUser { UserName = userDto.UserName, Email = userDto.UserEmails, PasswordHash = userDto.Password, NormalizedUserName = userDto.FirstName + " " + userDto.LastName };
                var res = await _userManager.CreateAsync(data, userDto.Password);
                if (res.Succeeded)
                {
                    var defaultrole = _roleManager.FindByIdAsync(userDto.Userrole).Result;
                    var roleresult = await _userManager.AddToRoleAsync(data, defaultrole.Name);
                    return true;
                }
                return false;
            }
            catch (Exception e)
            {

                return false;
            }


           
        

          
        }
    }
}
