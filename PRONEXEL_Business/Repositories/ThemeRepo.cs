using PRONEXEL_Business.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PRONEXEL_Business.Repositories
{
    public class ThemeRepo
    {

        private readonly DatabaseService databaseService;
        private readonly UserRepo userRepo;
        public ThemeRepo(DatabaseService databaseService, UserRepo userRepo)
        {
            this.databaseService = databaseService;
            this.userRepo = userRepo;
        }
         public async Task<string> GetActiveColor()
        {
            try
            {
                var res = await databaseService.ExecuteStoredProcedureAsync<string>("GetActiveColor");
                return res.FirstOrDefault();

            }
            catch (Exception)
            {

                throw;
            }
        }
        public async Task<string> UpdateThemeColor(string Color)
        {
            try
            {
                var pram = new
                {
                    Color = Color
                };
                var res = await databaseService.ExecuteStoredProcedureAsync<string>("UpdateThemeColor", pram);
                return res.FirstOrDefault();

            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}
