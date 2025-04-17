using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace PRONEXEL_WEB.Controllers
{
	public class AccountController : Controller
	{
		[AllowAnonymous]
		public IActionResult Login()
		{
			return View();
		}
        public IActionResult CreateRoles()
        {
            return View();
        }

    }
}
