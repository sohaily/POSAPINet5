using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Mvc;
using Pos.BLL;
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
    [Produces("application/json")]
    [Authorize]
    public class CategoryController : ControllerBase
    {
        CategoryBLL categoryBLL = new();
        // GET: api/<Category>
        [HttpPost("GetAll")]
       
        public IActionResult Get([FromBody] PagingRequest paging)
        {
            var pagingResponse = new PagingResponse();
            //if (paging.SearchCriteria?.IsPageLoad)
            //{
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
            // page.ExtFilter = paging.ExtFilters.ToList();
            pagingResponse = categoryBLL.GetCategories(page);// cashbookBAL.GetAll(page); 
                                                              //  }
            return Ok(pagingResponse);
          //  return categoryBLL.GetCategories();
        }
        [HttpGet("GetCategoryNames")]
        public IActionResult Get()
        {
            return Ok(categoryBLL.GetCategoryNames());
        }

      //  GET api/<Category>/5
        [HttpGet("{id}")]
        public Pos.Entities.Models.Category Get(int id)
        {
            return categoryBLL.GetCategoryById(id);
        }

        // POST api/<Category>
        [HttpPost]
        public int Post([FromBody] Pos.Entities.Models.Category category)
        {
            return categoryBLL.SaveCategory(category);
        }

        // DELETE api/<Category>/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
            categoryBLL.DeleteCategory(id);
        }
    }
}
