namespace ExcellenceQuest.Repository.Implementation
{
    using AutoMapper;
    using ExcellenceQuest.Models.Employee;
    using ExcellenceQuest.Models.KPI;
    using ExcellenceQuest.Repository.Common;
    using ExcellenceQuest.Repository.Contracts;
    using ExcellenceQuest.Repository.Models;
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Text;
    using System.Threading.Tasks;

    public class KPISuccessCriteriaRepository : GenericRepository<KPISuccessCriterion, KPISuccessCriteriaModel>, IKPISuccessCriteriaRepository
    {
        private readonly ExcellenceQuestContext _context;
        private readonly IMapper Mapper;
        public KPISuccessCriteriaRepository(ExcellenceQuestContext context, IMapper mapper) : base(context, mapper)
        {
            _context = context;
            Mapper = mapper;

        }
    }
}
