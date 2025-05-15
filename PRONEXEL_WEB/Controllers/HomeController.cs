using System.Diagnostics;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using PRONEXEL_Business.Repositories;
using PRONEXEL_WEB.Models;

namespace PRONEXEL_WEB.Controllers;

[Authorize]
public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;
    private readonly ContentRepo contentRepo;

    public HomeController(ILogger<HomeController> logger, ContentRepo contentRepo)
    {
        _logger = logger;
        this.contentRepo = contentRepo;
    }

    public async Task<IActionResult> Index()
    {
        ViewBag.topic = await contentRepo.GetTopic();
        ViewBag.subtopic = await contentRepo.GetSubTopics();
        return View();
      
    }
    public async Task<IActionResult> AdminIndex()
    {
        return View();

    }

    public IActionResult Privacy()
    {
        return View();
    }

    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
    public IActionResult Accessdenied(string ReturnUrl)
    {
        return View();
    }
}
