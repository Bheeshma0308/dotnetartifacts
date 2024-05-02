namespace ExcellenceQuest.API.Controllers
{
    using ExcellenceQuest.Business.Contracts;
    using Microsoft.AspNetCore.Mvc;
    using System.Threading.Tasks;

    [Route("api/[controller]")]
    [ApiController]
    public class EmployeeController : ControllerBase
    {
        private IEmployeeService _employeeService;
        public EmployeeController(IEmployeeService employeeService)
        {
            _employeeService = employeeService;
        }
        [HttpGet("GetEmployee")]
        public async Task<IActionResult> GetEmployeeDetails(int empId)
        {
            var res = await _employeeService.GetEmployeeDetails(empId);
            return Ok(res);
        }
       
    }
}
