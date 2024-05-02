namespace ExcellenceQuest.API.Controllers
{
    using ExcellenceQuest.Business.Contracts;
    using ExcellenceQuest.Business.Implementation;
    using ExcellenceQuest.Models.Employee;
    using ExcellenceQuest.Models.KPI;
    using Microsoft.AspNetCore.Http;
    using Microsoft.AspNetCore.Mvc;
    using System.Threading.Tasks;

    [Route("api/[controller]")]
    [ApiController]
    public class KPISuccessCriteriaController : ControllerBase
    {
        private IKPISuccessCriteriaService _kPISuccessCriteriaService;
        public KPISuccessCriteriaController(IKPISuccessCriteriaService kPISuccessCriteriaService)
        {
            _kPISuccessCriteriaService = kPISuccessCriteriaService;
        }
        [HttpPost("SaveSuccessCriteria")]
        public async Task<IActionResult> SaveKPI(KPISuccessCriteriaModel obj)
        {
            var res = await _kPISuccessCriteriaService.SaveKpiSuccessCriteria(obj);
            return Ok(res);
        }
        [HttpDelete("Delete")]
        public async Task<IActionResult> Delete(int kpiId)
        {
            await _kPISuccessCriteriaService.Delete(kpiId);
            return Ok();
        }
    }
}
