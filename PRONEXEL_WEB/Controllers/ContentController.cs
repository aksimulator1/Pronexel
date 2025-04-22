using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using PRONEXEL_Business.Repositories;
using System.Threading.Tasks;

namespace PRONEXEL_WEB.Controllers
{

    [Authorize(Roles = "SuperAdmin,Admin")]
    public class ContentController : Controller
    {
        private readonly ContentRepo _contentRepo;
        public ContentController(ContentRepo contentRepo)
        {
                this._contentRepo = contentRepo;
        }
        [HttpGet]
        public IActionResult AddCategory()
        {
            return View();
        }
        [HttpPost]
        public async Task<IActionResult> AddCategory(string TopicName,string TopicDescription)
        {
            var res= await _contentRepo.AddTopic(TopicName, TopicDescription);
            return View();
        }
        [HttpGet]
        public async Task<IActionResult> AllCategory()
        {
            var res = await _contentRepo.GetTopic();
            return View(res);
        }
    }
}
