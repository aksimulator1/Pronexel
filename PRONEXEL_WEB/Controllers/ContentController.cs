using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using PRONEXEL_Business.Repositories;
using PRONEXEL_Data.Models.Dto;
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
        public async Task<IActionResult> AddCategory(string TopicName,string TopicDescription, string CategoryType)
        {
            var res= await _contentRepo.AddTopic(TopicName, TopicDescription, CategoryType);
            return View();
        }
        [HttpGet]
        public async Task<IActionResult> EditCategory(string id)
        {
            if (string.IsNullOrEmpty(id))
            {
                return BadRequest("Category ID is required.");
            }

            var categories = await _contentRepo.GetTopic();
            var category = categories.FirstOrDefault(c => c.ID == id);

            if (category == null)
            {
                return NotFound("Category not found.");
            }

            return View(category);
        }

        [HttpPost]
        public async Task<IActionResult> EditCategory(TopicCategoryModel model)
        {
           

            var categories = await _contentRepo.GetTopic();
            var category = categories.FirstOrDefault(c => c.ID == model.ID);

            if (category == null)
            {
                return NotFound("Category not found.");
            }

            category.TopicName = model.TopicName;
            category.TopicDescription = model.TopicDescription;

            // Assuming _contentRepo has a method to update the category in the database
            var result = await _contentRepo.UpdateTopicCategory(category.ID,category.TopicName,category.TopicDescription,model.CategoryType);

            if (result!= "Success")
            {
                ModelState.AddModelError("", "Failed to update the category.");
                return View(model);
            }

            return RedirectToAction("AllCategory");
        }
        [HttpGet]
        public async Task<IActionResult> AllCategory()
        {
            var categories = await _contentRepo.GetTopic();
            return View(categories);
        }
        [HttpGet]
        public async Task<IActionResult> CategoryDetails(string id)
        {
            if (string.IsNullOrEmpty(id))
            {
                return BadRequest("Category ID is required.");
            }

            var categories = await _contentRepo.GetTopic();
            var category = categories.FirstOrDefault(c => c.ID == id);

            if (category == null)
            {
                return NotFound("Category not found.");
            }

            return View(category);
        }
        [HttpGet]
        public async Task<IActionResult> DeleteTopic(string id)
        {
            var data = await _contentRepo.DeleteTopicCategory(id);

            return RedirectToAction("AllCategory");
        }
        [HttpGet]
        public async Task<IActionResult> AddSubTopic()
        {
            var categories = await _contentRepo.GetTopic();
            ViewBag.SubTopic = categories;
            return View();
        }

        //[HttpPost]
        //public async Task<IActionResult> AddSubTopic(string TopicId, string SubTopicName, string SubTopicDescription)
        //{
        //    if (string.IsNullOrEmpty(TopicId))
        //    {
        //        ModelState.AddModelError("", "Topic ID is required.");
        //        return View();
        //    }

        //    var result = await _contentRepo.AddSubTopic(TopicId, SubTopicName, SubTopicDescription);

        //    if (result != "Success")
        //    {
        //        ModelState.AddModelError("", "Failed to add the sub-topic.");
        //        return View();
        //    }

        //    return RedirectToAction("AllCategory");
        //}

    }
}
