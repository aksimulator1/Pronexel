using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PRONEXEL_Data.Models.Dto
{
    public class TopicSubcategoryModel
    {
        public string SubTopicID { get; set; }
        public string TopicName { get; set; }
        public string SubTopicName { get; set; }
        public string Description { get; set; }
        public DateTime CreatedOn { get; set; }
        public Boolean IsDeleted  { get; set; }

    }
}
