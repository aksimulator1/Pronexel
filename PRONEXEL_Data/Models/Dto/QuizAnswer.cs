using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PRONEXEL_Data.Models.Dto
{
    public class QuizAnswer
    {
        public string AnswerID { get; set; }

        public string QuestionID { get; set; }

        public string AnswerText { get; set; }

        public string AnswerMedia { get; set; }

        public bool IsCorrect { get; set; }

        public bool IsDelete { get; set; } = false;

        public DateTime CreatedOn { get; set; } = DateTime.Now;

    }
}
