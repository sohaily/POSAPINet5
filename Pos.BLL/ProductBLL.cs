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
    public class ProductBLL
    {
        ProductDAL objDL;
        public ProductBLL()
        {
            objDL = new ProductDAL();
        }

        public PagingResponse GetProducts(Paging paging)
        {
            try
            {
                IEnumerable<Product> res = objDL.GetAllWithPagination(paging);
                int totalRecord = res.Count();

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
        public IEnumerable<Product> GetProducts()
        {
            try
            {
                return objDL.GetAllProducts();
            }
            catch (Exception)
            {
                throw;
            }
        }
        public int SaveProduct(Product product)
        {
            if (product.ProductId > 0)
            {
                return objDL.UpdateProduct(product);
            }
            else
            {
                return objDL.SaveProduct(product);
            }
        }

        public Product GetProductById(string id)
        {
            return objDL.GetProductById(id);
        }

        public int DeleteProduct(int productID)
        {
            return objDL.DeleteProduct(productID);
        }
    }
}
