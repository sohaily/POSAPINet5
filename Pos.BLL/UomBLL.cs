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
    public class UomBLL
    {
        UomDAL objDL;
        public UomBLL()
        {
            objDL = new UomDAL();
        }

        public PagingResponse GetSuppliers(Paging paging)
        {
            try
            {
                IEnumerable<Uom> res = objDL.GetAllWithPagination(paging);
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
        public IEnumerable<Uom> GetUoms()
        {
            try
            {
                return objDL.GetAllUoms();
            }
            catch (Exception)
            {
                throw;
            }
        }
        public int SaveUom(Uom uom)
        {
            if (uom.UomId > 0)
            {
                return objDL.UpdateUom(uom);
            }
            else
            {
                return objDL.SaveUom(uom);
            }
        }

        public Uom GetUomById(int id)
        {
            return objDL.GetUomById(id);
        }

        public int DeleteUom(int uomID)
        {
            return objDL.DeleteUom(uomID);
        }
    }
}
