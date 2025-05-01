using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using PRONEXEL_Data.Models.Dto;

namespace PRONEXEL_WEB.Views.Dashbaord
{
    public class IndexModel : PageModel
    {
        public List<TopicCategoryModel> TopicCategories { get; set; }

        public void OnGet()
        {
            // Replace this with your actual data fetching logic
            TopicCategories = new List<TopicCategoryModel>
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
                }
                // Add more categories as needed
            };
        }
    }
}
