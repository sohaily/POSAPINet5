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
    public class ProductController : ControllerBase
    {
        ProductBLL productBLL = new();
        // GET: api/<ProductController>
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
            pagingResponse = productBLL.GetProducts(page);
            return Ok(pagingResponse);
        }

        // GET api/<ProductController>/5
        [HttpGet("{id}")]
        public Product Get(string id)
        {
            return productBLL.GetProductById(id);
        }

        // POST api/<ProductController>
        [HttpPost]
        public int Post([FromBody] Product product)
        {
            return productBLL.SaveProduct(product);
        }

        // DELETE api/<ProductController>/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
            productBLL.DeleteProduct(id);
        }
    }
}
