namespace ExcellenceQuest.Models.Badge
{
    using ExcellenceQuest.Models.Common;
    using ExcellenceQuest.Models.Employee;
    using System;
    using System.Collections.Generic;
    using System.Diagnostics;
    using System.Linq;
    using System.Text;
    using System.Threading.Tasks;

    public class BadgeConfigurationModel :BaseObject
    {
       
        public int BadgeId { get; set; }
        public int KpiId { get; set; }
        public int SubCompetencyId { get; set; }
        public int GradeId { get; set; }
        public int KpiCriteria { get; set; }
        public string Description { get; set; }

        public  BadgeModel Badge { get; set; }
        public  GradeModel Grade { get; set; }
        public  KeyPerformanceIndexModel Kpi { get; set; }
        public  SubCompetencyModel SubCompetency { get; set; }
    }
}
