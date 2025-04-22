using Microsoft.AspNetCore.Http.HttpResults;
using PRONEXEL_Business.Services;
using PRONEXEL_Data.Models.Dto;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PRONEXEL_Business.Repositories
{
    
    public class ContentRepo
    {
        private readonly DatabaseService databaseService;
        private readonly UserRepo userRepo;
        public ContentRepo(DatabaseService databaseService,UserRepo userRepo)
        {
                this.databaseService = databaseService;
                this.userRepo = userRepo;
        }
        public async Task<string> AddTopic(string TopicName,string TopicDescription)
        {
            try
            {
                var pram = new {
                    TopicName = TopicName,
                    TopicDescription = TopicDescription,
                    CreatedBy = await userRepo.ActiveUserId()
                };
                var res = await databaseService.ExecuteStoredProcedureAsync<string>("sp_InsertTopicCategory", pram);
                return res.FirstOrDefault();

            }
            catch (Exception)
            {

                throw;
            }
        } 
        public async Task<List<TopicCategoryModel>> GetTopic()
        {
            try
            {
             
                var res = await databaseService.ExecuteStoredProcedureAsync<TopicCategoryModel>("sp_GetActiveTopicCategories");
                return res.ToList();

            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}
