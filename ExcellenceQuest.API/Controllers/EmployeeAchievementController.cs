namespace ExcellenceQuest.API.Controllers
{
    using ExcellenceQuest.Business.Contracts;
    using ExcellenceQuest.Models.Employee;
    using Microsoft.AspNetCore.Mvc;
    using System.Threading.Tasks;

    [Route("api/[controller]")]
    [ApiController]
    public class EmployeeAchievementController : ControllerBase
    {
        private IEmployeeAchievementService _employeeAchievementService;
        public EmployeeAchievementController( IEmployeeAchievementService employeeAchievementService)
        {
             _employeeAchievementService = employeeAchievementService;
                
        }
        [HttpPost("SaveSelfReport")]
        public async Task<IActionResult> SaveSelfReport(EmployeeAchievementModel obj)
        {
            var res = await _employeeAchievementService.Save(obj);
            return Ok(res);
        }
    }
}
