namespace ExcellenceQuest.Repository.Implementation
{
    using ExcellenceQuest.Repository.Contracts;
    using ExcellenceQuest.Repository.Models;
    using Microsoft.EntityFrameworkCore;
    using System.Linq;
    using System.Threading.Tasks;

    public class EmployeeRepository : IEmployeeRespository
    {
        private readonly ExcellenceQuestContext _context;
        public EmployeeRepository(ExcellenceQuestContext context)
        {
            _context = context;
        }
        public async Task<Employee> GetEmployeeDetails(int employeeId)
        {

            var response = await _context.Employees.Include(s => s.Competency).Include(t => t.Grade)
                                  .Include(x => x.SubCompetency)
                                  .Include(x=>x.EmployeeAchievements)
                                   .Where(i => i.Id == employeeId).FirstOrDefaultAsync();
            return response;
        }

        public async Task<User> GetRole(string email, string pass)
        {
            var user = await _context.Users.Where(x => x.UserName == email && x.Password == pass).FirstOrDefaultAsync();
            return user;
        }
    }
}

