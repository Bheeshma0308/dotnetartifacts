﻿namespace ExcellenceQuest.Business.Implementation
{
    using AutoMapper;
    using ExcellenceQuest.Business.Contracts;
    using ExcellenceQuest.Models.Employee;
    using ExcellenceQuest.Repository.Contracts;
    using ExcellenceQuest.Repository.Implementation;
    using System.Threading.Tasks;

    public class EmployeeAchievementService : IEmployeeAchievementService
    {
        private readonly IEmployeeAchievementRepository _employeeAchievementRepository;
        private readonly IMapper Mapper;
        public EmployeeAchievementService(IEmployeeAchievementRepository employeeAchievementRepository, IMapper mapper)
        {
            _employeeAchievementRepository = employeeAchievementRepository;
            Mapper = mapper;
        }
        public async Task<EmployeeAchievementModel> Save(EmployeeAchievementModel model)
        {
            if (model.Id != null & model.Id > 0)
            {
                return await _employeeAchievementRepository.UpdateAsync(model);
            }
            else
            {
                return await _employeeAchievementRepository.AddAsync(model);
            }
        }
    }
}
