namespace ExcellenceQuest.API.Controllers
{
    using ExcellenceQuest.Business.Contracts;
    using ExcellenceQuest.Business.Implementation;
    using ExcellenceQuest.Models.Employee;
    using Microsoft.AspNetCore.Mvc;
    using System.Threading.Tasks;

    [Route("api/[controller]")]
    [ApiController]
    public class KeyPerformanceIndexController : ControllerBase
    {
        private IKeyPerformanceIndexService _keyPerformanceIndexService;
        public KeyPerformanceIndexController(IKeyPerformanceIndexService keyPerformanceIndexService)
        {
            _keyPerformanceIndexService = keyPerformanceIndexService;
        }
        [HttpGet("GetAll")]
        public async Task<IActionResult> GetKPIList()
        {
            var res = await _keyPerformanceIndexService.GetKPIList();
            return Ok(res);
        }
        [HttpPost("SaveKpi")]
        public async Task<IActionResult> SaveKPI(KeyPerformanceIndexModel obj)
        {
            var res = await _keyPerformanceIndexService.SaveKPI(obj);
            return Ok(res);
        }
        [HttpGet("GetAchieversListByKpiId")]
        public async Task<IActionResult> GetAchieverListByKpiId(int kpiId)
        {
            var res = await _keyPerformanceIndexService.GetTopAchieverByKpiId(kpiId);
            return Ok(res);
        }
        [HttpGet("GetAchieversListBySubCompetencyId")]
        public async Task<IActionResult> GetAchieverListBySubCompetencyId(int kpiId)
        {
            var res = await _keyPerformanceIndexService.GetTopAchieversBySubCompetencyId(kpiId);
            return Ok(res);
        }
        [HttpDelete("Delete")]
        public async Task<IActionResult> Delete(int kpiId)
        {
            await _keyPerformanceIndexService.Delete(kpiId);
            return Ok();
        }
    }
}
