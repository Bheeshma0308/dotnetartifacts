namespace ExcellenceQuest.Models.Employee
{
    using ExcellenceQuest.Models.Common;
    using System.Collections.Generic;

    public class EmployeeModel :BaseObject
    {
        public string Name { get; set; }
        public string Designation { get; set; }
        public int GradeId { get; set; }
        public int CompetencyId { get; set; }
        public int SubCompetencyId { get; set; }
        public int StreamId { get; set; }

        public CompetencyModel Competency { get; set; }
        public GradeModel Grade { get; set; }
        public SubCompetencyModel SubCompetency { get; set; }
        public List<EmployeeAchievementModel> EmployeeAchievementEmployees { get; set; }
    }
}
