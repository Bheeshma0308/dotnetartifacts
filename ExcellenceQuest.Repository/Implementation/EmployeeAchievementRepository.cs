﻿namespace ExcellenceQuest.Repository.Implementation
{
    using AutoMapper;
    using ExcellenceQuest.Models;
    using ExcellenceQuest.Models.Employee;
    using ExcellenceQuest.Repository.Common;
    using ExcellenceQuest.Repository.Contracts;
    using ExcellenceQuest.Repository.Models;
    using Microsoft.EntityFrameworkCore;
    using Nest;
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Threading.Tasks;
   
    public class EmployeeAchievementRepository : GenericRepository<EmployeeAchievement, EmployeeAchievementModel>, IEmployeeAchievementRepository
    {
        private readonly ExcellenceQuestContext _context;
        private readonly IMapper Mapper;
        public EmployeeAchievementRepository(ExcellenceQuestContext context, IMapper mapper) : base(context, mapper)
        {
           _context = context;
            Mapper= mapper;

        }
        public async Task<List<EmployeeAchievement>> GetEmployeeAchievement(int empId)
        {
            var user = await _context.EmployeeAchievements.Include(x => x.Kpi).Where(x => x.EmployeeId == empId).ToListAsync();
            return user;
        }
      
    }
}
