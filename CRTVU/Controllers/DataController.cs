using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Crtvu.Bll;
using Crtvu.Dal;
using redisconn;
using View_model;
using StackExchange.Redis;
using System.IO;
using System.Text;
using Newtonsoft.Json;

namespace CRTVU.Controllers
{
    public class DataController : Controller
    {
        ConnectionMultiplexer getredis = conn.GetManager();
        conn con = new conn();
        crtvubll bll = new crtvubll();
        // GET: Data
        public ActionResult Index()
        {

            return View();
        }
        public ActionResult SCShow(string id)
        {
            ViewBag.id = id;
            return View();
        }
        public ActionResult Show(string id)
        {
            Object datas = new Object();
            string useID = Request.Cookies["username"].Value.ToString();
            string useSESSION = Request.Cookies["ASPSESSION"].Value.ToString();
            if (useID == null || useSESSION == null)
            {
                return RedirectToRoute("Default", new { controller = "Home", action = "Index" });
            }
            else
            {
                string re = con.yanzheng(useID);
                if (re != "false")
                {
                    if (re != "1")
                    {
                        return RedirectToRoute("Default", new { controller = "Home", action = "Index" });
                    }
                    else
                    {
                        List<View_model.Student> data = new List<Student>();
                        foreach (var c in bll.CSshow(id, useID))
                        {
                            data.Add(new Student { id = c.id, sid = c.sid, grade = c.grade, s_spec = c.s_spec, c_spec = c.c_spec });
                        }
                        datas = new { data, grade = new List<string> { "学号", "姓名", "课程名称", "课程成绩" } };
                        return Json(datas, JsonRequestBehavior.AllowGet);
                    }
                }
                else
                {
                    return RedirectToRoute("Default", new { controller = "Home", action = "Index" });
                }
            }
        }
        public ActionResult TSJSON()
        {
            return View();
        }
        public ActionResult Cjson(int? id)
        {
            try
            {
                Object datas = new Object();
                string useID = Request.Cookies["username"].Value.ToString();
                string useSESSION = Request.Cookies["ASPSESSION"].Value.ToString();
                if (useID == null || useSESSION == null)
                {
                    return RedirectToRoute("Default", new { controller = "Home", action = "Index" });
                }
                else
                {
                    string re = con.yanzheng(useID);
                    if (re != "false")
                    {
                        if (re != "1")
                        {
                            return RedirectToRoute("Default", new { controller = "Home", action = "Index" });
                        }
                        else
                        {
                            List<View_model.Couse> data = new List<Couse>();
                            foreach (var c in bll.Csearch(useID))
                            {
                                data.Add(new Couse { id = c.id, name = c.name, credit = c.credit, tname = c.tname });
                            }
                            datas = new { data, grade = new List<string> { "课程编号", "课程名称", "学分", "授课老师" } };
                            return Json(datas, JsonRequestBehavior.AllowGet);
                        }
                    }
                    else
                    {
                        return RedirectToRoute("Default", new { controller = "Home", action = "Index" });
                    }
                }
            }
            catch
            {
                return RedirectToRoute("Default", new { controller = "Home", action = "Index" });
            }
        }
        public ActionResult Delet(string id)
        {
            if (bll.Desc(Convert.ToInt64(id)))
            {
                return Content("OK");
            }
            else
            {
                return Content("false");
            }
        }
        public ActionResult SCUpdate(string id)
        {
            Stream s = System.Web.HttpContext.Current.Request.InputStream;
            byte[] b = new byte[s.Length];
            s.Read(b, 0, (int)s.Length);
            string a = Encoding.UTF8.GetString(b);
            a = a.Substring(0, a.Length - 1);
            string[] sp = a.Split('=');
            a = sp[1];
            if (bll.SCupdate(Convert.ToInt64(id), a))
            {
                return Content("ok");
            }
            else
            {
                return Content("false");
            }
        }
        public ActionResult Inset()
        {
            return View();
        }
        [HttpPost]
        public ActionResult search()
        {
            try
            {
                string useID = Request.Cookies["username"].Value.ToString();
                tb_teacher teacher = bll.search(useID);
                return Json(teacher, JsonRequestBehavior.AllowGet);
            }
            catch
            {
                return RedirectToRoute("Default", new { controller = "Home", action = "Index" });
            }
        }
        [HttpGet]
        public ActionResult SC(string id)
        {
            return View();
        }
        public ActionResult Self(string inform)
        {
            try
            {
                Object datas = new Object();
                string useID = Request.Cookies["username"].Value.ToString();
                string useSESSION = Request.Cookies["ASPSESSION"].Value.ToString();
                if (useID == null || useSESSION == null)
                {
                    return RedirectToRoute("Default", new { controller = "Home", action = "Index" });
                }
                else
                {
                    string re = con.yanzheng(useID);
                    if (re != "false")
                    {
                        if (re != "1")
                        {
                            return RedirectToRoute("Default", new { controller = "Home", action = "Index" });
                        }
                        else
                        {
                            if (Request.RequestType == "GET")
                            {
                                return View();
                            }
                            else
                            {
                                tb_teacher tea = bll.Selfin(Convert.ToInt64(useID));
                                Selfinfom teaSelf = new Selfinfom { id = tea.id, name = tea.name, nplace = tea.nplace, sex = tea.sex, phone = tea.phone, education = tea.education, id_card = tea.id_card, position = tea.position, image = tea.image, bname = tea.bname };
                                return Json(teaSelf, JsonRequestBehavior.AllowGet);
                            }
                        }
                    }
                    else
                    {
                        return RedirectToRoute("Default", new { controller = "Home", action = "Index" });
                    }
                }
            }
            catch
            {
                return RedirectToRoute("Default", new { controller = "Home", action = "Index" });

            }
        }
        public ActionResult Self1(string inform)
        {
            string useID = Request.Cookies["username"].Value.ToString();
            string useSESSION = Request.Cookies["ASPSESSION"].Value.ToString();
            if (useID == null || useSESSION == null)
            {
                return RedirectToRoute("Default", new { controller = "Home", action = "Index" });
            }
            else
            {
                string re = con.yanzheng(useID);
                if (re != "false")
                {
                    if (re != "1")
                    {
                        return RedirectToRoute("Default", new { controller = "Home", action = "Index" });
                    }
                    else
                    {
                        if (inform == null)
                        {
                            return Content("false");
                        }
                        else
                        {
                            Teaupdate Tea = JsonConvert.DeserializeObject<Teaupdate>(inform);
                            return Content(bll.Teaupdata(Convert.ToInt64(useID), Tea.name, Tea.nplace, Tea.phone).ToString());
                        }
                    }
                }
                else
                {
                    return RedirectToRoute("Default", new { controller = "Home", action = "Index" });
                }
            }
        }
        public ActionResult UPpass(string newpass, string oldpass)
        {
            if (Request.RequestType == "GET")
            {
                return View();
            }
            else
            {
                string useID = Request.Cookies["username"].Value.ToString();
                string useSESSION = Request.Cookies["ASPSESSION"].Value.ToString();
                if (useID == null || useSESSION == null)
                {
                    return RedirectToRoute("Default", new { controller = "Home", action = "Index" });
                }
                else
                {
                    string re = con.yanzheng(useID);
                    if (re != "false")
                    {
                        if (re != "1")
                        {
                            return RedirectToRoute("Default", new { controller = "Home", action = "Index" });
                        }
                        else
                        {
                            if (Request.RequestType == "GET")
                            {
                                return View();
                            }
                            else
                            {
                                if (newpass == null || oldpass == null)
                                {
                                    return Content("false");
                                }
                                else
                                {
                                    getredis.GetDatabase(1).KeyDelete(useID);
                                    getredis.GetDatabase(2).KeyDelete(useID);
                                    return Content(bll.UPpass(Convert.ToInt64(useID), oldpass, newpass).ToString());
                                }
                            }
                        }
                    }
                    else
                    {
                        return RedirectToRoute("Default", new { controller = "Home", action = "Index" });
                    }
                }
            }
        }
    }
}