namespace ExcellenceQuest.Business.Implementation
{
    using AutoMapper;
    using ExcellenceQuest.Business.Contracts;
    using ExcellenceQuest.Models;
    using ExcellenceQuest.Models.Employee;
    using ExcellenceQuest.Repository.Contracts;
    using ExcellenceQuest.Repository.Models;
    using System.Collections.Generic;
    using System.Threading.Tasks;

    public class EmployeeService: IEmployeeService
    {
        private readonly IEmployeeRespository _employeeRepository;
        private readonly IEmployeeAchievementRepository _employeeAchievementRepository;
        private readonly IMapper Mapper;
        public EmployeeService(IEmployeeRespository employeeRepository, IEmployeeAchievementRepository employeeAchievementRepository, IMapper mapper)
        {
            _employeeAchievementRepository = employeeAchievementRepository;
            _employeeRepository = employeeRepository;
            Mapper = mapper;
        }
        public async Task<UserModel> GetRole(string email, string pass)
        {
            var res= await _employeeRepository.GetRole(email, pass);
            return Mapper.Map<UserModel>(res);
        }

        public async Task<EmployeeModel> GetEmployeeDetails(int employeeId)
        {
            var result = await _employeeRepository.GetEmployeeDetails(employeeId);
            return Mapper.Map<EmployeeModel>(result);
        }

       
    }
}

