using Microsoft.AspNetCore.Mvc;

namespace PRONEXEL_WEB.Controllers
{
	public class AccountController : Controller
	{
		public IActionResult Index()
		{
			return View();
		}
	}
}
