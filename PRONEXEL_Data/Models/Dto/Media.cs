using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PRONEXEL_Data.Models.Dto
{
    public class Media
    {
        public string MediaID { get; set; }
        public string SubTopicID { get; set; }
        public string MediaType { get; set; }
        public string MediaURL { get; set; }
        public string Title { get; set; }
        public DateTime UploadedOn { get; set; }
        public bool IsDeleted { get; set; }
    }
}
