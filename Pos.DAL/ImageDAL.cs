using Dapper;
using Pos.DAL.Core;
using Pos.Entities.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Pos.DAL
{
   
        public class ImageDAL : DapperContext
        {
            public int SaveImage(Image Image)
            {
                return Insert<Image>(Image);
            }

            public int UpdateImage(Image Image)
            {
                return Update<Image>(Image, $" WHERE ImageId = {Image.ImageId}");
            }

            public int DeleteImage(int ImageId)
            {
                return Delete<Image>($" WHERE ImageId = {ImageId}");
            }


            public IEnumerable<Image> GetAllImages()
            {
                var values = new DynamicParameters();
                values.AddDynamicParams(new { Action = "getAll" });
                return GetAllWithPagination<Image>("SP_GetImages", values);
            }
        public IEnumerable<Image> GetMultipleImagesById(int componentId)
        {
            var values = new DynamicParameters();
            values.AddDynamicParams(new { componentId = componentId });
            return GetAllWithPagination<Image>("SP_GetImages", values);
        }
        public Image GetImageById(int ImageId)
            {
                return SingleOrDefault<Image>($" WHERE ImageId = {ImageId} ");
            }
        }
}
