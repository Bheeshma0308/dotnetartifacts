namespace ExcellenceQuest.Models.Employee
{
    using ExcellenceQuest.Models.Common;
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Text;
    using System.Threading.Tasks;

    public class EmployeeAchievementModel :BaseObject
    {
       
        public long EmployeeId { get; set; }
        public int KpiId { get; set; }
        public string Description { get; set; }
        public DateTime AchievedOn { get; set; }
        public virtual KeyPerformanceIndexModel Kpi { get; set; }
    }
}
