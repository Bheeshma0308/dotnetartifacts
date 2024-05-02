namespace ExcellenceQuest.Business.Implementation
{
    using ExcellenceQuest.Business.Contracts;
    using ExcellenceQuest.Models.Employee;
    using ExcellenceQuest.Models.KPI;
    using ExcellenceQuest.Repository.Contracts;
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Text;
    using System.Threading.Tasks;

    public class KPISuccessCriteriaService : IKPISuccessCriteriaService
    {
        private readonly IKPISuccessCriteriaRepository _kPISuccessCriteriaRepository;
        public KPISuccessCriteriaService(IKPISuccessCriteriaRepository kPISuccessCriteriaRepository)
        {
            _kPISuccessCriteriaRepository = kPISuccessCriteriaRepository;
                
        }

        public async Task Delete(int id)
        {
            await _kPISuccessCriteriaRepository.DeleteAsync(id);
        }

        public async Task<KPISuccessCriteriaModel> SaveKpiSuccessCriteria(KPISuccessCriteriaModel obj)
        {
            if (obj.Id > 0)
            {
                return await _kPISuccessCriteriaRepository.UpdateAsync(obj);
            }
            else
            {
                return await _kPISuccessCriteriaRepository.AddAsync(obj);
            }
            
        }
    }
}
