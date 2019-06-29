using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Crtvu.Dal;

namespace Crtvu.Bll
{
    public class CourseBLL
    {
        CourseDAL dal = new CourseDAL();
        public List<tb_course> GetTb_Course()
        {
            return dal.GetTb_Course();
        }

        public List<tb_course> GetCourse(string name)
        {
            return dal.GetCourse(a => (!string.IsNullOrEmpty(name) ? a.name.Contains(name) : true));
        }
        public List<tb_course> GetPagedCourse(int pageindex, int pagesize, out int recordCount)
        {
            return dal.GetPagedCourse(pageindex, pagesize, out recordCount);
        }

        public List<tb_course> GetPagedCourse(int pageindex, int pagesize, out int recordCount, string name)
        {
            return dal.GetPagedCourse(a => (!string.IsNullOrEmpty(name) ? a.name.Contains(name) : true), pageindex, pagesize, out recordCount);
        }
    }
}
