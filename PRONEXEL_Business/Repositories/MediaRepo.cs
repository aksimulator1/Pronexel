using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc.Formatters;
using PRONEXEL_Business.Services;
using PRONEXEL_Data.Models.Dto;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PRONEXEL_Business.Repositories
{
    public class MediaRepo
    {
        private readonly DatabaseService databaseService;

        public MediaRepo(DatabaseService databaseService)
        {
                this.databaseService = databaseService;
        }
        public string Addfilesinserver(IFormFile Files, string FileType)
        {
            // Generate unique filename
            string fileName = Guid.NewGuid().ToString();
            string fileExtension = Path.GetExtension(Files.FileName);
            fileName = fileName + fileExtension;

            // Decide folder based on FileType
            string folderName = "Others"; // default if needed
            if (FileType.ToLower() == "video")
            {
                folderName = "Video";
            }
            else if (FileType.ToLower() == "images" || FileType.ToLower() == "image")
            {
                folderName = "Images";
            }
            else if (FileType.ToLower() == "documents" || FileType.ToLower() == "document")
            {
                folderName = "Documents";
            }
            else if (FileType.ToLower() == "Quiz" || FileType.ToLower() == "quiz")
            {
                folderName = "Quiz";
            }  
            else if (FileType.ToLower() == "Answer" || FileType.ToLower() == "answer")
            {
                folderName = "Answer";
            }

            // Combine path
            var folderPath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot\\Media", folderName);

            // Create folder if not exists
            if (!Directory.Exists(folderPath))
            {
                Directory.CreateDirectory(folderPath);
            }

            var filePath = Path.Combine(folderPath, fileName);

            // Save the file
            using (FileStream stream = new FileStream(filePath, FileMode.Create))
            {
                Files.CopyTo(stream);
            }

            return "/Media/"+ folderName + "/" + fileName;
        }
        public async Task<string> AddMediaIntoDbAsync(Media media)
        {
            var pram = new
            {
                SubTopicID=media.SubTopicID,
                MediaType=media.MediaType,
                MediaURL=media.MediaURL,
                Title="New isnsert"
            };
            var res = await databaseService.ExecuteStoredProcedureAsync<string>("InsertMedia", pram);
            return res.FirstOrDefault();
            
          
        }
        public async Task<List<Media>> AllMedia()
        {
            var res = await databaseService.ExecuteStoredProcedureAsync<Media>("GetAllMedia");
            return res.ToList();
          
        }

    }
}
