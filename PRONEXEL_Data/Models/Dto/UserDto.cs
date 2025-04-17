using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PRONEXEL_Data.Models.Dto
{
    public class UserDto
    {
        public string Userid { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string UserName { get; set; }
        public string UserEmails { get; set; }
        public string Userrole { get; set; }
        public string Password { get; set; }
    }
}
