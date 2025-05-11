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
        [HttpPost]
        public async Task<IActionResult> Login(UserDto userDto)
        {

           var res=await _userRepo.AuthinticateUser(userDto);
            if(res==null)
            {
                ViewBag.res = "Incorrect UserName or Password";
                return View();
            }

            return RedirectToAction("Index","Home");
        }
        [AllowAnonymous]
        public async Task<IActionResult> CreateRoles()
        {
           await _userRepo.CreateRoles();
            return View("Login");
        }
        [Authorize(Roles ="SuperAdmin,Admin")]
        [HttpGet]
        public async Task<IActionResult> AddUser()
        {
            ViewBag.rlist = _userRepo.AllRoles();
            return View();
        }
        [HttpGet]
        public async Task<IActionResult> EditUsers(string id)
        {
            var data = await _userRepo.GetUser(id);
            ViewBag.rlist = _userRepo.AllRoles();
            return View(data);
        }
        [HttpPost]
        public async Task<IActionResult> EditUsers(UserDto userDto)
        {
            var data=await _userRepo.UpdateUser(userDto);
            return RedirectToAction("AllUsers","Account");
        }
        [Authorize(Roles = "SuperAdmin")]
        [HttpPost]
        public async Task<IActionResult> AddUser(UserDto userDto)
        {
            var res = await _userRepo.AddUser(userDto);
            ViewBag.rlist = _userRepo.AllRoles();
            return View();
        }
        public async Task<IActionResult> Logout()
        {
            await _userRepo.Logout();
            return View("Login");
        } 
        public async Task<IActionResult> AllUsers()
        {
            var res= await _userRepo.GetUserswithRoles();
            return View(res);
        }
        [HttpGet]
        public async Task<JsonResult> DeleteUser(string userid)
        {
            var data = await _userRepo.DeleteUser(userid);
          
            return Json(data);
        }

    }
}
