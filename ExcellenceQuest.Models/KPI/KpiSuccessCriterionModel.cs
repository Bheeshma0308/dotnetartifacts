namespace ExcellenceQuest.Models.KPI
{
    using ExcellenceQuest.Models.Common;
    using ExcellenceQuest.Models.Employee;

    public class KPISuccessCriteriaModel : BaseObject
    {
        public int GradeId { get; set; }
        public int KpiId { get; set; }
        public long Weightage { get; set; }
        public int Rating { get; set; }
        public int SubCompetencyId { get; set; }
        public int SuccessCriteria { get; set; }
        public string Description { get; set; }
        public bool IsDeleted { get; set; }

        public  GradeModel Grade { get; set; }
        public  KeyPerformanceIndexModel Kpi { get; set; }
        public  SubCompetencyModel SubCompetency { get; set; }
    }
}
