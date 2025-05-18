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
        public async Task<string> AddSubTopic(string subTopicName, string description, string catID)
        {
            try
            {
                var pram = new
                {
                    SubTopicName = subTopicName,
                    Description = description,
                    CatID = catID
                };
                var res = await databaseService.ExecuteStoredProcedureAsync<string>("sp_InsertSubTopic", pram);
                return res.FirstOrDefault();
            }
            catch (Exception)
            {
                throw;
            }
        }

        public async Task<List<TopicSubcategoryModel>> GetSubTopics()
        {
            try
            {
                var pram = new
                {
                    UserId = await userRepo.ActiveUserId()
                };
                var res = await databaseService.ExecuteStoredProcedureAsync<TopicSubcategoryModel>("sp_GetSubTopics",pram);
                return res.ToList();
            }
            catch (Exception)
            {
                throw;
            }
        }

        public async Task<string> UpdateSubTopic(string subTopicID, string subTopicName, string description, string catID)
        {
            try
            {
                var pram = new
                {
                    SubTopicID = subTopicID,
                    SubTopicName = subTopicName,
                    Description = description,
                    CatID = catID
                };
                var res = await databaseService.ExecuteStoredProcedureAsync<string>("sp_UpdateSubTopic", pram);
                return res.FirstOrDefault();
            }
            catch (Exception)
            {
                throw;
            }
        }

        public async Task<string> DeleteSubTopic(string subTopicID)
        {
            try
            {
                var pram = new { ID = subTopicID };
                var res = await databaseService.ExecuteStoredProcedureAsync<string>("sp_DeleteSubTopic", pram);
                return res.FirstOrDefault();
            }
            catch (Exception)
            {
                throw;
            }
        }
        public async Task<string> AddQuestion(Quiz quiz)
        {
            try
            {
                var pram = new { 
                    CatId = quiz.CatId,
                    Title= quiz.Title,
                    QuestionMedia= quiz.QuestionMedia,

                };
                var res = await databaseService.ExecuteStoredProcedureAsync<string>("InsertQuestion", pram);
                return res.FirstOrDefault();
            }
            catch (Exception)
            {
                throw;
            }
        }
        public async Task<List<Quiz>> AllQuestion()
        {
            try
            {
               
                var res = await databaseService.ExecuteStoredProcedureAsync<Quiz>("AllQuizQuestion");
                return res.ToList();
            }
            catch (Exception)
            {
                throw;
            }
        }
        public async Task<List<string>> AllChapter()
        {
            try
            {
               
                var res = await databaseService.ExecuteStoredProcedureAsync<string>("GetAllChapterType");
                return res.ToList();
            }
            catch (Exception)
            {
                throw;
            }
        }

        public async Task<List<QuizAnswer>> AllAnswers()
        {
            try
            {

                var res = await databaseService.ExecuteStoredProcedureAsync<QuizAnswer>("AllQuizAnswers");
                return res.ToList();
            }
            catch (Exception)
            {
                throw;
            }
        }
        public async Task<string> AddAnswer(QuizAnswer quizAnswer)
        {
            try
            {
                var pram = new
                {
                    QuestionID = quizAnswer.QuestionID,
                    AnswerMedia= quizAnswer.AnswerMedia,
                    IsCorrect= quizAnswer.IsCorrect,
                    AnswerText= quizAnswer.AnswerText,

                };
                var res = await databaseService.ExecuteStoredProcedureAsync<string>("InsertQuizAnswer", pram);
                return res.FirstOrDefault();
            }
            catch (Exception)
            {
                throw;
            }
        }

        public async Task<List<QuestionViewModel>> AllQuestionwithAnswer()
        {
            try
            {
                var questions = await AllQuestion(); // Prefer camelCase for local vars
                var answers = await AllAnswers();

                var questionViewModels = questions
                    .Where(q => !q.IsDelete)
                    .Select(q => new QuestionViewModel
                    {
                        Quiz = q,
                        Answers = answers
                            .Where(a => a.QuestionID == q.ID && !a.IsDelete)
                            .ToList()
                    })
                    .ToList();

                return questionViewModels;
            }
            catch (Exception)
            {
                throw; // Consider logging here
            }
        }
        public async Task<string> AddVideoViewHistory(string MediaID)
        {
            try
            {
                var pram = new
                {
                    UserID = await userRepo.ActiveUserId(),
                    MediaID = MediaID

                };
                var res = await databaseService.ExecuteStoredProcedureAsync<string>("InsertUserContentViewHistory", pram);
                return res.FirstOrDefault();
            }
            catch (Exception)
            {
                throw;
            }
        }



    }
}
