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
    public class UomController : ControllerBase
    {
        UomBLL uomBLL = new();
        // GET: api/<UomController>
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
            pagingResponse = uomBLL.GetSuppliers(page);
            return Ok(pagingResponse);
        }

        // GET api/<UomController>/5
        [HttpGet("{id}")]
        public Uom Get(int id)
        {
            return uomBLL.GetUomById(id);
        }

        // POST api/<UomController>
        [HttpPost]
        public int Post([FromBody] Uom uom)
        {
            return uomBLL.SaveUom(uom);
        }

        // DELETE api/<UomController>/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
            uomBLL.DeleteUom(id);
        }
    }
}
