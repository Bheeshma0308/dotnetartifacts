namespace ExcellenceQuest.API.Controllers
{
    using ExcellenceQuest.Business.Contracts;
    using ExcellenceQuest.Business.Implementation;
    using ExcellenceQuest.Models.Badge;
    using ExcellenceQuest.Models.Employee;
    using Microsoft.AspNetCore.Http;
    using Microsoft.AspNetCore.Mvc;
    using System.Threading.Tasks;

    [Route("api/[controller]")]
    [ApiController]
    public class BadgeController : ControllerBase
    {
        private IBadgeService _badgeService;
        private IBadgeConfigurationService _badgeConfigurationService;
        public BadgeController(IBadgeService badgeService, IBadgeConfigurationService badgeConfigurationService)
        {
            _badgeService = badgeService;
            _badgeConfigurationService = badgeConfigurationService;
        }
        [HttpPost("Save")]
        public async Task<IActionResult> Save(BadgeModel obj)
        {
            var res = await _badgeService.Save(obj);
            return Ok(res);
        }
        [HttpDelete("Delete")]
        public async Task<IActionResult> Delete(int badgeId)
        {
             await _badgeService.Delete(badgeId);
            return Ok();
        }
        [HttpPost("SaveBadgeConfig")]
        public async Task<IActionResult> SaveBadgeConfig(BadgeConfigurationModel obj)
        {
            var res = await _badgeConfigurationService.Save(obj);
            return Ok(res);
        }
        [HttpDelete("DeleteBadgeConfig")]
        public async Task<IActionResult> DeleteBadgeConfig(int badgeConfigId)
        {
            await _badgeConfigurationService.Delete(badgeConfigId);
            return Ok();
        }
    }
}
