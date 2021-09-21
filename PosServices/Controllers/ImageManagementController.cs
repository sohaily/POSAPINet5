using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Myrmec;
using Pos.BLL;
using Pos.Entities.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

namespace PosServices.Controllers
{
    [Route("api/ImageManagement")]
    [ApiController]
    public class ImageManagementController : ControllerBase
    {
        ImageBLL bll = new();

        [HttpPost]
        [Route("upload")]
        public async Task<IActionResult> Upload([FromForm] Image profile)
        {
            Image image = new();
            var sniffer = new Sniffer();
            var supportedFiles = new List<Record>
            {
                new Record("jpg,jpeg", "ff,d8,ff,db"),
                new Record("png", "89,50,4e,47,0d,0a,1a,0a"),

            };
            sniffer.Populate(supportedFiles);

            var formCollection = await Request.ReadFormAsync();
            var files = formCollection.Files;
            foreach (var file in files)
            {
                var uniqueFileName = $"{Guid.NewGuid()}" + file.FileName;
                var filePath = Path.Combine(Directory.GetCurrentDirectory(), @"wwwroot\Products", uniqueFileName);
                using (var fileStream = new FileStream(filePath, FileMode.Create))
                {
                    await file.CopyToAsync(fileStream);
                }
                image.Name = profile.Name;
                image.Email = profile.Email;
                image.SectionId = 1;
                image.ComponentId = profile.ComponentId;
                image.Path = "Products/"+ uniqueFileName;
                bll.SaveImage(image);

                return Ok(new { msg = "Image saved successfully" });
            }

            return Ok();
        }

        private static byte[] ReadFileHead(IFormFile file)
        {
            using var fs = new BinaryReader(file.OpenReadStream());
            var bytes = new byte[20];
            fs.Read(bytes, 0, 20);
            return bytes;
        }

        [HttpPost]
        [Route("createprofile")]
        public async Task<IActionResult> CreateProfile([FromForm] Image profile)
        {
            if (ModelState.IsValid)
            {
                var tempProfile = profile;
                return Ok();
            }

            return BadRequest();
        }
        [HttpGet("{componentId}")]
        public IActionResult Get(int componentId)
        {
            return Ok(bll.GetImages(componentId));
        }
    }
}