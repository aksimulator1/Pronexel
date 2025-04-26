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
        public async Task<string> AddTopic(string TopicName,string TopicDescription,string CategoryType)
        {
            try
            {
                var pram = new {
                    TopicName = TopicName,
                    TopicDescription = TopicDescription,
                    CategoryType= CategoryType,
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
        public async Task<string> UpdateTopicCategory(string topicId, string topicName, string topicDescription,string CategoryType)
        {
            try
            {
                var pram = new
                {
                    ID = topicId,
                    TopicName = topicName,
                    TopicDescription = topicDescription,
                    UpdatedBy = await userRepo.ActiveUserId(),
                    CategoryType= CategoryType
                };
                var res = await databaseService.ExecuteStoredProcedureAsync<string>("sp_UpdateTopicCategory", pram);
                return res.FirstOrDefault() ;
            }
            catch (Exception)
            {
                throw;
            }
        }
        public async Task<string> DeleteTopicCategory(string topicId)
        {
            try
            {
                var pram = new
                {
                    ID = topicId
                };
                var res = await databaseService.ExecuteStoredProcedureAsync<string>("sp_UpdateDeleteCategory", pram);
                return res.FirstOrDefault() ;
            }
            catch (Exception)
            {
                throw;
            }
        }
        
    }
}
