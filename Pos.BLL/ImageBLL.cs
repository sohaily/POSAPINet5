using Pos.DAL;
using Pos.Entities.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Pos.BLL
{
   public class ImageBLL
    {
        ImageDAL objDL;
        public ImageBLL()
        {
            objDL = new ImageDAL();
        }

       
        public IEnumerable<Image> GetImages()
        {
            try
            {
                return objDL.GetAllImages();
            }
            catch (Exception)
            {
                throw;
            }
        }
        public IEnumerable<Image> GetImages(int componentId)
        {
            try
            {
                return objDL.GetMultipleImagesById(componentId);
            }
            catch (Exception)
            {
                throw;
            }
        }
        public int SaveImage(Image Image)
        {
            try
            {
                if (Image.ImageId > 0)
                {
                    return objDL.UpdateImage(Image);
                }
                else
                {
                    return objDL.SaveImage(Image);
                }
            }
            catch (Exception ex)
            {

                throw ex;
            }
            
        }

        public Image GetImageById(int id)
        {
            return objDL.GetImageById(id);
        }

        public int DeleteImage(int ImageID)
        {
            return objDL.DeleteImage(ImageID);
        }
    }
}

