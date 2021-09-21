using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Pos.Entities.Models
{
    public class Image
    {
        [Description("ignore")]
        public int ImageId { get; set; }
        [Required]
        public string Name { get; set; }
        public string Email { get; set; }
        public int ComponentId { get; set; }
        public string Path { get; set; }
        [Description("ignore")]
        [Required]
        public IFormFile Picture { get; set; }
        public int SectionId { get; set; }
    }
}
