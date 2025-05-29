using BooksApi.Models;
using BooksApi.Services;
using Microsoft.AspNetCore.Mvc;

namespace BooksApi.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class BookController : Controller
    {
        private readonly BookService bookService;

        public BookController(BookService book) 
        {
            this.bookService = book;
        }

        [HttpPost]
        [Route("Add")]
        public ActionResult AddBook(Book book)
        {
            this.bookService.AddBook(book);
            return Ok("Book created !");
        }

        [HttpGet]
        [Route("GetAll")]
        public ActionResult GetAll()
        {
            return Ok(this.bookService.GetAll());
        }

        [HttpGet]
        [Route("GetById")]
        public ActionResult GetById(int id)
        {
            var res = this.bookService.GetBookById(id);

            if (res != null) { return Ok(res); }

            return NotFound("Book not found!");
        }

        // To Update Book

        [HttpPut]
        [Route("Update")]
        public ActionResult UpdateBook(int id, Book updatedBook)
        {
            var result = this.bookService.UpdateBook(id, updatedBook);
            if (!result)
                return NotFound("Book not found to update!");

            return Ok("Book updated successfully.");
        }

        // To Delete Book

        [HttpDelete]
        [Route("Delete")]
        public ActionResult DeleteBook(int id)
        {
            var result = this.bookService.DeleteBook(id);
            if (!result)
                return NotFound("Book not found to delete!");

            return Ok("Book deleted successfully.");
        }
    }
}
