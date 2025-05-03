using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PRONEXEL_Data.Models.Dto
{
    public class QuestionViewModel
    {
        public Quiz Quiz { get; set; }
        public List<QuizAnswer> Answers { get; set; }
    }
}
