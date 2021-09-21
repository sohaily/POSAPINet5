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
    public class SupplierBLL
    {
        SupplierDAL objDL;
        public SupplierBLL()
        {
            objDL = new SupplierDAL();
        }

        public PagingResponse GetSuppliers(Paging paging)
        {
            try
            {
                IEnumerable<Supplier> res = objDL.GetAllWithPagination(paging);
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
        public IEnumerable<Supplier> GetSuppliers()
        {
            try
            {
                return objDL.GetAllSuppliers();
            }
            catch (Exception)
            {
                throw;
            }
        }
        public int SaveSupplier(Supplier supplier)
        {
            if (supplier.SupplierId > 0)
            {
                return objDL.UpdateSupplier(supplier);
            }
            else
            {
                return objDL.SaveSupplier(supplier);
            }
        }

        public Supplier GetSupplierById(int id)
        {
            return objDL.GetSupplierById(id);
        }

        public int DeleteSupplier(int supplierID)
        {
            return objDL.DeleteSupplier(supplierID);
        }
    }
}
