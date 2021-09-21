using Pos.DAL;
using Pos.Entities.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static Pos.Entities.Common.DataTables;

namespace Pos.BLL
{
    public class CategoryBLL
    {
        CategoryDAL objDL;
        public CategoryBLL()
        {
            objDL = new CategoryDAL();
        }

        public PagingResponse GetCategories(Paging paging)
        {
            try
            {
               var res = objDL.GetAllWithPagination(paging);
                int totalRecord = res.Select(x => x.Count).FirstOrDefault();

                PagingResponse pagingResponse = new PagingResponse
                {
                    Draw = paging.Draw,
                    Data = res,
                    RecordsFiltered = totalRecord,
                    RecordsTotal = totalRecord
                };
                return pagingResponse;
            }
            catch (Exception)
            {
                throw;
            }
        }
        public IEnumerable<Pos.Entities.Models.Category> GetCategoryNames()
        {
            try
            {
                return objDL.GetAllCategories();
            }
            catch (Exception)
            {
                throw;
            }
        }
        public int SaveCategory(Category category)
        {
            if (category.CategoryID > 0)
            {
                return objDL.UpdateCategory(category);
            }
            else
            {
                return objDL.SaveCategory(category);
            }
        }

        public Category GetCategoryById(int id)
        {
            return objDL.GetCategoryById(id);
        }

        public int DeleteCategory(int categoryID)
        {
            return objDL.DeleteCategory(categoryID);
        }
    }
}
