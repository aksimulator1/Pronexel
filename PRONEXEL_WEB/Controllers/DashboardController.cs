using Microsoft.AspNetCore.Mvc;
using PRONEXEL_Data.Models.Dto;

namespace PRONEXEL_WEB.Controllers
{
    public class DashboardController : Controller
    {
    
        public IActionResult Index()
        {
            // Sample data - replace with DB call
            var categories = new List<TopicCategoryModel>
        {
            new TopicCategoryModel
            {
                ID = "1",
                TopicName = "Smart Watch",
                CategoryType = "Electronics",
                TopicDescription = "Classy Modern Smart watch",
                CreatedBy = "admin",
                CreatedByName = "Admin User",
                CreatedOn = DateTime.Now,
                IsDeleted = false,
                Status = "New"
            },
            // Add more as needed
        };

            return View(categories);
        }
    }
}
