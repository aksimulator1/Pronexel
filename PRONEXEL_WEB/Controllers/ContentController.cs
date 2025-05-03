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
        private readonly MediaRepo mediaRepo;
        public ContentController(ContentRepo contentRepo,MediaRepo mediaRepo)
        {
                this._contentRepo = contentRepo;
            this.mediaRepo = mediaRepo;
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


        [HttpPost]
        public async Task<IActionResult> AddSubTopic(string CatID, string SubTopicName, string Description)
        {
            if (string.IsNullOrEmpty(CatID))
            {
                ModelState.AddModelError("", "Category ID is required.");
                return View();
            }

            var result = await _contentRepo.AddSubTopic(SubTopicName, Description, CatID);

          
            var categories = await _contentRepo.GetTopic();
            ViewBag.SubTopic = categories;
            return RedirectToAction("AllSubTopics", new { catID = CatID });
        }
        [HttpGet]
        public async Task<IActionResult> SubTopicDetails(string id)
        {
            if (string.IsNullOrEmpty(id))
            {
                return BadRequest("Subcategory ID is required.");
            }

            var Subcategories = await _contentRepo.GetSubTopics();
            var Subcategory = Subcategories.FirstOrDefault(c => c.SubTopicID == id);

            if (Subcategory == null)
            {
                return NotFound("Subcategory not found.");
            }

            return View(Subcategory);
        }

        [HttpGet]
        public async Task<IActionResult> EditSubTopic(string id)
        {
            if (string.IsNullOrEmpty(id))
            {
                return BadRequest("SubTopic ID is required.");
            }

            var subTopics = await _contentRepo.GetSubTopics(); // Fetch all subtopics
            var subTopic = subTopics.FirstOrDefault(s => s.SubTopicID == id);

            if (subTopic == null)
            {
                return NotFound("SubTopic not found.");
            }

            var categories = await _contentRepo.GetTopic();
            ViewBag.Categories = categories; // Pass categories for selection
            return View(subTopic);
        }

        [HttpPost]
        public async Task<IActionResult> EditSubTopic(TopicSubcategoryModel model,string CatID)
        {
            if (string.IsNullOrEmpty(model.SubTopicID))
            {
                return BadRequest("SubTopic ID is required.");
            }

            var result = await _contentRepo.UpdateSubTopic(model.SubTopicID, model.SubTopicName, model.Description, CatID);

            if (result != "Success")
            {
                ModelState.AddModelError("", "Failed to update the sub-topic.");
                return View(model);
            }

            return RedirectToAction("AllSubTopics");
        }

        [HttpGet]
        public async Task<IActionResult> AllSubTopics()
        {
          

            var subTopics = await _contentRepo.GetSubTopics();
            return View(subTopics);
        }

        [HttpGet]
        public async Task<IActionResult> DeleteSubTopic(string id)
        {
            if (string.IsNullOrEmpty(id))
            {
                return BadRequest("SubTopic ID is required.");
            }

            var result = await _contentRepo.DeleteSubTopic(id);

            if (result != "Success")
            {
                return BadRequest("Failed to delete the sub-topic.");
            }

            return RedirectToAction("AllSubTopics");
        }
        
        [HttpGet]
        public async Task<IActionResult> AddQuiz()
        {
            var cat =await _contentRepo.GetTopic();
            ViewBag.cat = cat;
            return View();
        }
        [HttpPost]
        public async Task<IActionResult> AddQuiz(Quiz quiz,IFormFile formFile)
        {
            var cat = await _contentRepo.GetTopic();
            ViewBag.cat = cat;
            if(formFile!=null)
            {
                quiz.QuestionMedia = mediaRepo.Addfilesinserver(formFile, "Quiz");
            }
            var res = await _contentRepo.AddQuestion(quiz);
            return View();
        }
        [HttpGet]
        public async Task<IActionResult> AllQuiz()
        {
            var res =await _contentRepo.AllQuestionwithAnswer();
            return View(res);
        }
        [HttpGet]
        public async Task<IActionResult> AddAnswer()
        {
            var Quest = await _contentRepo.AllQuestion();
            ViewBag.Quest = Quest;
            return View();
        }  
        [HttpPost]
        public async Task<IActionResult> AddAnswer(QuizAnswer quizAnswer,IFormFile formFile)
        {
            var Quest = await _contentRepo.AllQuestion();
            ViewBag.Quest = Quest;
            quizAnswer.AnswerMedia=mediaRepo.Addfilesinserver(formFile,"Answer");
            var res = await _contentRepo.AddAnswer(quizAnswer);
            if(res!= "Success")
            {
                ViewBag.res = res;
            }
         
            return View();
        }

    }
}
