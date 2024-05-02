namespace ExcellenceQuest.Repository.Implementation
{
    using AutoMapper;
    using ExcellenceQuest.Models;
    using ExcellenceQuest.Models.Employee;
    using ExcellenceQuest.Repository.Common;
    using ExcellenceQuest.Repository.Contracts;
    using ExcellenceQuest.Repository.Models;
    using Microsoft.EntityFrameworkCore;
    using System.Collections.Generic;
    using System.Linq;
    using System.Threading.Tasks;
    public class KeyPerformanceIndexRepository : GenericRepository<KeyPerformanceIndex, KeyPerformanceIndexModel>, IKeyPerformanceIndexRepository
    {
        private readonly ExcellenceQuestContext _context;
        private readonly IMapper Mapper;
        public KeyPerformanceIndexRepository(ExcellenceQuestContext context, IMapper mapper) : base(context, mapper)
        {
            _context = context;
            Mapper = mapper;
        }
        public async Task<List<TopScorerModel>> GetTopAchieversByKpiId(int kpiId)
        {
            var topAchieversWithNamesAndKPI = await _context.EmployeeAchievements
                                                                      .AsNoTracking()
                                                                      .Where(e => e.KpiId == kpiId)
                                                                      .GroupBy(e => e.EmployeeId)
                                                                       .Select(g => new
                                                                       {
                                                                           EmployeeId = g.Key,
                                                                           AchievementDate = g.Max(e => e.AchievedOn),
                                                                           Score = g.Count()
                                                                       })
                                                                      .OrderByDescending(a => a.Score)
                                                                       .Select(a => new TopScorerModel
                                                                       {
                                                                           EmployeeId = a.EmployeeId,
                                                                           EmployeeName = _context.Employees.FirstOrDefault(emp => emp.Id == a.EmployeeId).Name,
                                                                           KpiId = kpiId,
                                                                           KpiName = _context.KeyPerformanceIndices.Include(k => k.Stream)
                                                                                    .FirstOrDefault(k => k.Id == kpiId).Name,
                                                                           StreamId = _context.KeyPerformanceIndices.Include(k => k.Stream)
                                                                                            .FirstOrDefault(k => k.Id == kpiId).StreamId,
                                                                           StreamName = _context.KeyPerformanceIndices.Include(k => k.Stream)
                                                                                                      .FirstOrDefault(k => k.Id == kpiId).Stream.Name,
                                                                           AchievementDate = a.AchievementDate,
                                                                           Score = a.Score
                                                                       })
                                                                              .ToListAsync();

            return topAchieversWithNamesAndKPI;


        }

        public async Task<List<TopScorerModel>> GetTopAchieversBySubCompetencyId(int subCompetencyId)
        {
            var topAchievers = await _context.EmployeeAchievements
                       .Where(e => e.Kpi.SubCompetencyId == subCompetencyId)
                      .GroupBy(e => e.EmployeeId)
                       .Select(g => new
                       {
                           EmployeeId = g.Key,
                           AchievementDate = g.Max(e => e.AchievedOn),
                           Score = g.Count()
                       })
                       .OrderByDescending(a => a.Score)
                          .Select(a => new TopScorerModel
                          {
                              EmployeeId = a.EmployeeId,
                              EmployeeName = _context.Employees.FirstOrDefault(emp => emp.Id == a.EmployeeId).Name,
                              KpiId = _context.KeyPerformanceIndices.FirstOrDefault(k => k.SubCompetencyId == subCompetencyId).Id,
                              KpiName = _context.KeyPerformanceIndices.FirstOrDefault(k => k.SubCompetencyId == subCompetencyId).Name,
                              SubCompetencyId = subCompetencyId,
                              SubCompetencyName = _context.SubCompetencies.FirstOrDefault(x => x.Id == subCompetencyId).Name,
                              AchievementDate = a.AchievementDate,
                              Score = a.Score
                          })
                             .ToListAsync();
            return topAchievers;
        }
    }
}
