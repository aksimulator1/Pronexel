using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PRONEXEL_Data.Models.Dto
{
    public class Quiz
    {
        public string ID { get; set; }

        public string CatId { get; set; }

        public string Title { get; set; }

        public string QuestionMedia { get; set; }

        public bool IsDelete { get; set; } = false;

        public DateTime CreatedOn { get; set; } = DateTime.Now;
        public string Qstatus { get; set; } = "Active";
    }
}
