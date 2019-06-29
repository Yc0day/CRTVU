using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using redisconn;
using StackExchange.Redis;
using Md5.Salt;
using Newtonsoft.Json;
using Crtvu.Dal;
using Crtvu.Bll;

namespace CRTVU.Controllers
{
    public class HomeController : Controller
    {
        crtvubll bll = new crtvubll();
        ConnectionMultiplexer getredis = conn.GetManager();
        // GET: Home
        [HttpGet]
        public ActionResult Index()
        {
                return View();
        }
        [HttpPost]
        public ActionResult Index(string account, string password, string Role)
        {
            try
            {
                Int64 user = Convert.ToInt64(account);

                if (password == null || password == null || Role == null)
                {
                    return View();
                }
                else
                {
                    if (Role == "1")
                    {
                        tb_teacher tea = bll.Selfin(user);
                        if (user == tea.id && password == tea.password)
                        {
                            object a = account;
                            string jiami = md5slt.MD5Encoding(password, a);
                            var data1 = getredis.GetDatabase(2);
                            getredis.GetDatabase(1).StringSet(account, jiami, TimeSpan.FromMinutes(20));
                            getredis.GetDatabase(2).StringSet(account, Role, TimeSpan.FromMinutes(20));
                            Response.AddHeader("Set-Cookie", "ASPSESSION=" + jiami + "; HttpOnly");
                            Response.AddHeader("Set-Cookie", "username=" + account + ";HttpOnly");
                            Response.AddHeader("Set-Cookie", "name=" + tea.name);
                            Response.Write("OK");
                            return RedirectToRoute("Default", new { controller = "Home", action = "First" });
                        }
                        else
                        {
                            return View();
                        }
                    }
                    else
                    {
                        if (Role == "0")
                        {
                            tb_student stu = bll.StuSelf(user);
                            if (user == stu.id && password == stu.password)
                            {
                                object a = account;
                                string jiami = md5slt.MD5Encoding(password, a);
                                var data1 = getredis.GetDatabase(2);
                                getredis.GetDatabase(1).StringSet(account, jiami, TimeSpan.FromMinutes(20));
                                getredis.GetDatabase(2).StringSet(account, Role, TimeSpan.FromMinutes(20));
                                Response.AddHeader("Set-Cookie", "ASPSESSION=" + jiami + "; HttpOnly");
                                Response.AddHeader("Set-Cookie", "username=" + account + ";HttpOnly");
                                Response.AddHeader("Set-Cookie", "name=" + stu.name);
                                Response.Write("OK");
                                return RedirectToRoute("Default", new { controller = "StudentD", action = "Student", stuID = Convert.ToInt64(account), stuPwd = password });
                            }
                            else
                            {
                                return View();
                            }
                        }
                        return View();
                    }
                }
            }
            catch
            {
                return RedirectToRoute("Default", new { controller = "Home", action = "Index" });
            }
        }
        [HttpGet]
        public ActionResult First()
        {
            try
            {
                var data = getredis.GetDatabase(1);
                string cookie = Request.Headers.Get("Cookie");
                string useID = Request.Cookies["username"].Value.ToString();
                string useSESSION = Request.Cookies["ASPSESSION"].Value.ToString();
                if (cookie == null)
                {
                    return RedirectToRoute("Default", new { controller = "Home", action = "Index" });
                }
                if (useSESSION != null)
                {
                    if (useSESSION == data.StringGet(useID))
                    {
                        return View();
                    }
                    else
                    {
                        return RedirectToRoute("Default", new { controller = "Home", action = "Index" });
                    }
                }
                return RedirectToRoute("Default", new { controller = "Home", action = "Index" });
            }
            catch
            {
                return RedirectToRoute("Default", new { controller = "Home", action = "Index" });
            }
      }
        //string demojson = JsonConvert.SerializeObject(demo);
        //database.StringSet("model", demojson);
        //string model = database.StringGet("model");
        //demo = JsonConvert.DeserializeObject<Demo>(model);
    }
}