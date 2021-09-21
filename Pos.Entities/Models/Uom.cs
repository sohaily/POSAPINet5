using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Pos.Entities.Models
{
    public class Uom
    {
        [Description("ignore")]
        public int UomId { get; set; }

        public string UomType { get; set; }

        public int CreatedBy { get; set; }
        public DateTime CreatedAt { get; set; }

        public int UpdatedBy { get; set; }
        public DateTime UpdatedAt { get; set; }

    }
}
