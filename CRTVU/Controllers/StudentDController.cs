using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Crtvu.Dal;
using Crtvu.Bll;
using EASModel;

namespace CRTVU.Controllers
{
    public class StudentDController : Controller
    {
        // GET: StudentD
        studentBLL stuBll = new studentBLL();
        CourseBLL bll = new CourseBLL();
        public ActionResult Index()
        {
            return View();
        }


        public ActionResult Student(Int64 stuID = 0, string stuPwd = "")
        {

            //ViewBag.stuName = stuName;
            stuID = Convert.ToInt64(stuID);
            ViewBag.id = stuID;
            ViewBag.stuPwd = stuPwd;
            return View();
        }
        /// <summary>
        /// 修改密码
        /// </summary>
        /// <param name="stuId"></param>
        /// <returns></returns>
        [HttpGet]
        public ActionResult ModifyPwd(Int64 stuId)
        {
            ViewBag.stuid = stuId;
            tb_student stu = stuBll.GetStudentInfo(stuId);
            return View();
        }
        [HttpPost]
        public ActionResult ModifyPwd(Int64 stuid = -1, string pwd = "", string rePwd = "")
        {
            if (pwd != null && rePwd != null && pwd == rePwd)
            {
                stuBll.ModifyPwd(stuid, pwd);
                Console.WriteLine("修改成功");
            }
            else
            {
                Console.WriteLine("密码有误，请重新输入：");
            }
            return RedirectToAction("ModifyPwd", "Home", new { stuId = stuid });
        }
        /// <summary>
        /// 选修课程
        /// </summary>
        /// <returns></returns>
        public ActionResult Elective(int pageindex = 1, int pagesize = 6, string name = "")
        {
            List<SelectListItem> listItem = new List<SelectListItem>
            {
                new SelectListItem{Text="校公选课",Value="1"},
            };
            List<SelectListItem> listItem2 = new List<SelectListItem>
            {
                new SelectListItem{Text="有",Value="1"},
                new SelectListItem{ Text="无",Value="0"},
            };
            List<SelectListItem> listItem3 = new List<SelectListItem>
            {
                new SelectListItem{Text="科技发展与生态文明",Value="1"},
                new SelectListItem{Text="文化传承于世界文明",Value="0"},
                new SelectListItem{Text="艺术体验与审美鉴赏",Value="0"},
                new SelectListItem{Text="职场技能与个人发展",Value="0"},
            };
            List<SelectListItem> listItem4 = new List<SelectListItem>
            {
                new SelectListItem{Text="东校区",Value="1"},
            };
            ViewBag.list = new SelectList(listItem, "Value", "Text", "");
            ViewBag.list2 = new SelectList(listItem2, "Value", "Text", "");
            ViewBag.list3 = new SelectList(listItem3, "Value", "Text", "");
            ViewBag.list4 = new SelectList(listItem4, "Value", "Text", "");
            List<tb_course> listiten = new CourseBLL().GetTb_Course();

            int recordCount;
            List<tb_course> listCourse = bll.GetPagedCourse(pageindex, pagesize, out recordCount, name);
            Pager pager = new Pager(pageindex, pagesize, recordCount);
            pager.condition.Add("name", name);
            ViewBag.pager = pager;
            return View(listCourse);
        }
        /// <summary>
        /// 个人信息
        /// </summary>
        /// <param name="stuid"></param>
        /// <returns></returns>
        //[HttpGet]
        public ActionResult info(Int64 stuid)
        {
            ViewBag.id = stuid;
            tb_student stu = stuBll.GetStudentInfo(stuid);
            return View(stu);
        }
        //[HttpPost]
        [HttpGet]
        public ActionResult ModifyInfo(Int64 stuid)
        {
            tb_student stu = stuBll.GetStudentInfo(stuid);
            return View(stu);
        }
        [HttpPost]
        public ActionResult ModifyInfo(tb_student stu)
        {
            stuBll.ModifyStuInfo(stu);
            return RedirectToAction("info", new { stuid = stu.id });
        }
        public ActionResult Score(Int64 stuID = 0)
        {
            scBLL scbll = new scBLL();
            List<tb_sc> sc = scbll.GetSc(stuID);
            return View(sc);
        }


        public ActionResult Schedule(Int64 stuid = 0)
        {
            scBLL scbll = new scBLL();
            List<tb_sc> sc = scbll.GetSc(stuid);
            return View(sc);
        }



        //public ActionResult Situation(int stuid)
        //{
        //    return View();
        //}
        //public ActionResult Search(string name)
        //{
        //    //List<tb_course> listCourse = new CourseBLL().GetTb_Course();
        //    //listCourse.Insert(0, new tb_course() {id=-1, name = "---全部---" });
        //    //ViewBag.listCourse = listCourse.Select(a => new SelectListItem() { Text = a.name,Value=a.name+"" });
        //    List<tb_course> list =bll.GetCourse(name);
        //    return View("Elective", list);
        //}


        //public ActionResult test(int pageindex = 1, int pagesize = 6,string name)
        //{
        //    int recordCount;
        //    List<tb_course> listCourse = new CourseBLL().GetPagedCourse(pageindex, pagesize, out recordCount, name);
        //    Pager pager = new Pager(pageindex, pagesize, recordCount);
        //    pager.condition.Add("name", name);
        //    ViewBag.pager = pager;
        //    List<tb_course> list = bll.GetCourse(name);
        //    return View("test", list);
        //}
    }
}