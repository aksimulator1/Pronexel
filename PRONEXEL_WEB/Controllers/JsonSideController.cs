using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using PRONEXEL_Business.Repositories;

namespace PRONEXEL_WEB.Controllers
{
    public class JsonSideController : Controller
    {
        private readonly ContentRepo _contentRepo;
        public JsonSideController(ContentRepo contentRepo)
        {
            _contentRepo = contentRepo;
        }
        [HttpGet]
        public async Task<JsonResult> AllCategroy()
        {
            var data = await _contentRepo.GetTopic();
            return Json(data);
        }
        [HttpGet]
        public async Task<JsonResult> AllSubCategroy(string categoryId)
        {
            var cat = await _contentRepo.GetTopic();
            var cid = cat.Where(x => x.ID == categoryId).FirstOrDefault();
            var data = await _contentRepo.GetSubTopics();
            if(data!=null)
            {
                data=data.Where(x=>x.TopicName== cid.TopicName).ToList();
            }
            return Json(data);
        }
    }
}
