using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using PRONEXEL_Business.Repositories;
using PRONEXEL_Data.Models.Dto;
using System.Threading.Tasks;

namespace PRONEXEL_WEB.Controllers
{
    // [Authorize(Roles ="ApplicationUser,SuperAdmin,Admin")]
    [AllowAnonymous]
    public class TrainingModuleController : Controller
    {
        private readonly MediaRepo mediaRepo;
        private readonly ContentRepo contentRepo;
        public TrainingModuleController(MediaRepo mediaRepo,ContentRepo contentRepo)
        {
            this.mediaRepo = mediaRepo;
            this.contentRepo = contentRepo;
        }
        public async Task<IActionResult> Index()
        {
            ViewBag.topic = await contentRepo.GetTopic();
            ViewBag.subtopic = await contentRepo.GetSubTopics();
            return View();
        }
        [HttpGet]
        public async Task<IActionResult> AllMedia(string TopicID, string SubTopicID,string Language="Eng")
        {
            var catIDList = await contentRepo.GetSubTopics();

            if (catIDList == null || !catIDList.Any())
            {
                // Handle the case where no subtopics are returned
                return View(new List<Media>()); // Or return an appropriate message/view
            }

            var selectedSubTopic = catIDList.FirstOrDefault(x => x.SubTopicName == SubcatName);

            if (selectedSubTopic == null || string.IsNullOrEmpty(selectedSubTopic.SubTopicID))
            {
                // Handle the case where the subtopic was not found
                return View(new List<Media>());
            }

            string catid = selectedSubTopic.SubTopicID;

            var res = await mediaRepo.AllMedia();

            if (res == null || !res.Any())
            {
                // Handle the case where no media is returned
                return View(new List<Media>());
            }

            var filteredMedia = res.Where(x => x.SubTopicID == catid).ToList();

            return View(filteredMedia);

        }
       
    }
}
