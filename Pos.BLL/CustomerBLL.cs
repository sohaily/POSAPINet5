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
    public class CustomerBLL
    {
        CustomerDAL objDL;
        public CustomerBLL()
        {
            objDL = new CustomerDAL();
        }

        public PagingResponse GetCustomers(Paging paging)
        {
            try
            {
                IEnumerable<Customer> res = objDL.GetAllWithPagination(paging);
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
        public IEnumerable<Customer> GetCustomers()
        {
            try
            {
                return objDL.GetAllCustomers();
            }
            catch (Exception)
            {
                throw;
            }
        }
        public int SaveCustomer(Customer customer)
        {
            if (customer.CustomerID > 0)
            {
                return objDL.UpdateCustomer(customer);
            }
            else
            {
                return objDL.SaveCustomer(customer);
            }
        }

        public Customer GetCustomerById(int id)
        {
            return objDL.GetCustomerById(id);
        }

        public int DeleteCustomer(int customerID)
        {
            return objDL.DeleteCustomer(customerID);
        }
    }
}
