using Microsoft.AspNetCore.Mvc;
using Pos.BLL;
using Pos.Entities.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using static Pos.Entities.Common.DataTables;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace PosServices.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CustomerController : ControllerBase
    {
        CustomerBLL customerBLL = new();
        // GET: api/<CustomerController>
        [HttpPost("GetAll")]
        public IActionResult Get([FromBody] PagingRequest paging)
        {
            var pagingResponse = new PagingResponse();

            Paging page = new Paging();
            if (paging.Order.Count > 0)
            {
                var colOrder = paging.Order[0];
                page.SortCol = paging.Columns[colOrder.Column].Data;
                page.SortOrder = colOrder.Dir;
            }
            page.PageSize = paging.Length;
            page.Draw = paging.Draw;
            page.PageNo = (paging.Start / paging.Length) + 1;
            page.SearchParam = !string.IsNullOrEmpty(paging.Search.Value) ? paging.Search.Value.Trim() : null;
            pagingResponse = customerBLL.GetCustomers(page);
            return Ok(pagingResponse);
        }

        // GET api/<CustomerController>/5
        [HttpGet("{id}")]
        public Customer Get(int id)
        {
            return customerBLL.GetCustomerById(id);
        }

        // POST api/<CustomerController>
        [HttpPost]
        public int Post([FromBody] Customer customer)
        {
            return customerBLL.SaveCustomer(customer);
        }

        // DELETE api/<CustomerController>/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
            customerBLL.DeleteCustomer(id);
        }
    }
}
