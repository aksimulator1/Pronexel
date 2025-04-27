using Microsoft.AspNetCore.Mvc;
using PRONEXEL_Business.Repositories;
using PRONEXEL_Data.Models.Dto;
using System.Threading.Tasks;

namespace PRONEXEL_WEB.Controllers
{
    public class MediaManagementController : Controller
    {
        private readonly ContentRepo contentRepo;
        private readonly MediaRepo mediaRepo;
        public MediaManagementController(ContentRepo contentRepo,MediaRepo mediaRepo)
        {
            this.contentRepo = contentRepo;
            this.mediaRepo = mediaRepo;
        }
        [HttpGet]
        public async Task<IActionResult> AddMedia()
        {
            ViewBag.AllsubTopics = await contentRepo.GetSubTopics();
            return View();
        }
        [HttpPost]
        public async Task<IActionResult> AddMedia(string ID,string MediaType,string Path)
        {
            Media media = new Media();
            media.MediaURL = Path;
            media.SubTopicID = ID;
            media.MediaType = MediaType;
            var res = await mediaRepo.AddMediaIntoDbAsync(media);

            ViewBag.AllsubTopics = await contentRepo.GetSubTopics();
            return View();
        }
        [HttpPost]
        public async Task<JsonResult> UploadMedia(IFormFile file,string FileType)
        {
            var res = mediaRepo.Addfilesinserver(file, FileType);
          
            return Json(res);
        }

    }

}
