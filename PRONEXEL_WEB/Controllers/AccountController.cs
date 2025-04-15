using Microsoft.AspNetCore.Mvc;

namespace PRONEXEL_WEB.Controllers
{
	public class AccountController : Controller
	{
		public IActionResult Login()
		{
			return View();
		}
	}
}
