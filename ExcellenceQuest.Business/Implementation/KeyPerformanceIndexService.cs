namespace ExcellenceQuest.Business.Implementation
{
    using AutoMapper;
    using ExcellenceQuest.Business.Contracts;
    using ExcellenceQuest.Models;
    using ExcellenceQuest.Models.Employee;
    using ExcellenceQuest.Repository.Common;
    using ExcellenceQuest.Repository.Contracts;
    using ExcellenceQuest.Repository.Implementation;
    using ExcellenceQuest.Repository.Models;
    using System.Collections.Generic;
    using System.Threading.Tasks;

    public class KeyPerformanceIndexService :IKeyPerformanceIndexService
    {
        private readonly IKeyPerformanceIndexRepository _keyPerformanceIndexRespository;
        private readonly IMapper Mapper;
        public KeyPerformanceIndexService(IKeyPerformanceIndexRepository employeeRepository, IMapper mapper)
        {
            _keyPerformanceIndexRespository = employeeRepository;
            Mapper = mapper;
        }
        public async Task<List<KeyPerformanceIndexModel>> GetKPIList()
        {
            var res = await _keyPerformanceIndexRespository.GetAllAsync();
            return res;
        }
        public async Task<KeyPerformanceIndexModel> SaveKPI(KeyPerformanceIndexModel keyPerformanceIndex)
        {
            if (keyPerformanceIndex.Id > 0)
            {
                return await _keyPerformanceIndexRespository.UpdateAsync(keyPerformanceIndex);
            }
            else
            {
                return await _keyPerformanceIndexRespository.AddAsync(keyPerformanceIndex);
            }
        }
        public async Task<List<TopScorerModel>> GetTopAchieverByKpiId(int kpiId)
        {
            var res = await _keyPerformanceIndexRespository.GetTopAchieversByKpiId(kpiId);
            return res;
        }

        public async Task<List<TopScorerModel>> GetTopAchieversBySubCompetencyId(int subCompetencyId)
        {
            var res = await _keyPerformanceIndexRespository.GetTopAchieversBySubCompetencyId(subCompetencyId);
            return res;
        }

        public async Task Delete(int id)
        {
            await _keyPerformanceIndexRespository.DeleteAsync(id);
        }
    }
}
