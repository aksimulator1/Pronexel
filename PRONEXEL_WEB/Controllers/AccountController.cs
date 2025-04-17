using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using PRONEXEL_Business.Repositories;
using PRONEXEL_Data.Models.Dto;
using System.Threading.Tasks;

namespace PRONEXEL_WEB.Controllers
{
	public class AccountController : Controller
	{
		private readonly UserRepo _userRepo;
        public AccountController(UserRepo userRepo)
        {
            this._userRepo = userRepo;
        }
        [AllowAnonymous]
		public IActionResult Login()
		{
			return View();
		}
        [AllowAnonymous]
        public async Task<IActionResult> CreateRoles()
        {
           await _userRepo.CreateRoles();
            return View("Login");
        }
        [AllowAnonymous]
        [HttpGet]
        public async Task<IActionResult> AddUser()
        {
            ViewBag.rlist = _userRepo.AllRoles();
            return View();
        }
        [AllowAnonymous]
        [HttpPost]
        public async Task<IActionResult> AddUser(UserDto userDto)
        {
            var res = await _userRepo.AddUser(userDto);
            ViewBag.rlist = _userRepo.AllRoles();
            return View();
        }

    }
}
