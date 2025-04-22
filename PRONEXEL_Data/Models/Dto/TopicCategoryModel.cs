using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PRONEXEL_Data.Models.Dto
{
    public class TopicCategoryModel
    {
        public string ID { get; set; }
        public string TopicName { get; set; }
        public string TopicDescription { get; set; }
        public string CreatedBy { get; set; }
        public string CreatedByName { get; set; }
        public DateTime CreatedOn { get; set; }
        public bool IsDeleted { get; set; }
        public string Status { get; set; }
    }
}
