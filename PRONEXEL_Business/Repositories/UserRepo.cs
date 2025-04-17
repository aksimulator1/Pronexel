using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
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
    }
}
