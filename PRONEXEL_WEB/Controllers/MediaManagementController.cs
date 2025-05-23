﻿using Microsoft.AspNetCore.Mvc;
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
            ViewBag.Topics = await contentRepo.GetTopic();
            ViewBag.AllsubTopics = await contentRepo.GetSubTopics();
            return View();
        }
        [HttpGet]
        public async Task<IActionResult> EditMedia(string ID)
        {
            ViewBag.AllsubTopics = await contentRepo.GetSubTopics();
            var res = await mediaRepo.AllMedia();
            return View(res.Where(x=>x.MediaID==ID).FirstOrDefault());
        }
        [HttpGet]
        public async Task<IActionResult> DeleteMedia(string ID)
        {
            var data = await mediaRepo.DeleteMediaIntoDbAsync(ID);

            return RedirectToAction("AllMedia");
        }
        [HttpPost]
        public async Task<IActionResult> EditMedia(string MediaID, string ID, string MediaType, string Path)
        {
            Media media = new Media();
            media.MediaURL = Path;
            media.SubTopicID = ID;
            media.MediaType = MediaType;
            media.MediaID = MediaID;
            var res = await mediaRepo.EditMediaIntoDbAsync(media);

            ViewBag.AllsubTopics = await contentRepo.GetSubTopics();
            return View();
        }

        [HttpGet]
        public async Task<IActionResult> AllMedia()
        {
            var res = await mediaRepo.AllMedia();
            return View(res);
        }
        [HttpPost]
        public async Task<IActionResult> AddMedia(string ID,string MediaType,string Path)
        {
            Media media = new Media();
            media.MediaURL = Path;
            media.SubTopicID = ID;
            media.MediaType = MediaType;
            var res = await mediaRepo.AddMediaIntoDbAsync(media);
            ViewBag.Topics = await contentRepo.GetTopic();
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
