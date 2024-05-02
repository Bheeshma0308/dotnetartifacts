namespace ExcellenceQuest.Models.Employee
{
    using ExcellenceQuest.Models.Common;
    using System.IO;

    public class KeyPerformanceIndexModel :BaseObject
    {
        
        public string Name { get; set; }
        public string Description { get; set; }
        public int StreamId { get; set; }
        public StreamModel Stream { get; set; }
        public int SubCompetencyId { get; set; }
        public SubCompetencyModel SubCompetency { get; set; }
    }
}
