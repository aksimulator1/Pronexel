using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using PRONEXEL_Business.Repositories;
using System.Threading.Tasks;

namespace PRONEXEL_WEB.Controllers
{

    [Authorize(Roles = "SuperAdmin")]
    public class ThemeManagementController : Controller
    {
        private readonly ThemeRepo _themeRepo;
        public ThemeManagementController(ThemeRepo themeRepo)
        {
            this._themeRepo = themeRepo;
        }
        [HttpGet]
        public async Task<IActionResult> DarkMood()
        {
            var res = await _themeRepo.GetActiveColor();
            ViewBag.res=res;
            return View();
        }
        [HttpPost]
        public async Task<IActionResult> DarkMood(string Color)
        {
            var res = await _themeRepo.UpdateThemeColor(Color);
            ViewBag.res=res;
            return View();
        }
        [HttpGet]
        public async Task<JsonResult> GetActiveColor()
        {
            var res = await _themeRepo.GetActiveColor();
            return Json(res);
        }
    }
}
