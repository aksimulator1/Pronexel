using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using PRONEXEL_Business.Repositories;

namespace PRONEXEL_WEB.Controllers
{
    [Authorize(Roles ="ApplicationUser")]
    public class QuizManagementController : Controller
    {
        private readonly ContentRepo _contentRepo;
        public QuizManagementController(ContentRepo contentRepo)
        {
            this._contentRepo = contentRepo;
        }
        public async Task<IActionResult> NewQuiz()
        {
            var res = await _contentRepo.AllQuestionwithAnswer();
            return View(res);
        }
    }
}
