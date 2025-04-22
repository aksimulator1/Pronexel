using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Authorization;
using Microsoft.EntityFrameworkCore;
using PRONEXEL_Business.Repositories;
using PRONEXEL_Business.Services;
using PRONEXEL_Data.Models.CodeFirst;
using System.Configuration;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddControllersWithViews();
builder.Services.AddDbContext<AppDbContext>(options =>
    options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection")));

builder.Services.AddIdentity<ApplicationUser, IdentityRole>().

                AddDefaultTokenProviders().
             AddEntityFrameworkStores<AppDbContext>();
builder.Services.AddControllersWithViews(opt => {

    var policy = new AuthorizationPolicyBuilder()
               .RequireAuthenticatedUser().Build();
    opt.Filters.Add(new AuthorizeFilter(policy));
    opt.Filters.Add(new RequestSizeLimitAttribute(100 * 1024 * 1024)); // 100MB

});
builder.Services.AddRazorPages()
    .AddRazorRuntimeCompilation();


builder.Services.AddTransient<UserRepo>();
builder.Services.AddHttpContextAccessor();
builder.Services.ConfigureApplicationCookie(options =>
{
    options.AccessDeniedPath = new PathString("/Home/Accessdenied");
});
builder.Services.AddControllersWithViews(opt => {

    var policy = new AuthorizationPolicyBuilder()
               .RequireAuthenticatedUser().Build();
    opt.Filters.Add(new AuthorizeFilter(policy));
});
builder.Services.AddTransient<DatabaseService>();
var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();

app.UseAuthorization();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Account}/{action=Login}/{id?}");

app.Run();
