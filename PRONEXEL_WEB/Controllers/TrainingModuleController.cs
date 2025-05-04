using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using PRONEXEL_Business.Repositories;

namespace PRONEXEL_WEB.Controllers
{
    [Authorize(Roles ="ApplicationUser,SuperAdmin,Admin")]
    public class TrainingModuleController : Controller
    {
        private readonly MediaRepo mediaRepo;
        public TrainingModuleController(MediaRepo mediaRepo)
        {
            this.mediaRepo = mediaRepo;
        }
        public IActionResult Index()
        {
            return View();
        }
        [HttpGet]
        public async Task<IActionResult> AllMedia(string SubcatName,string Language)
        {
            var res = await mediaRepo.AllMedia();
            return View(res);
        }
    }
}
