using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Linq.Expressions;

namespace Crtvu.Dal
{
    public class CourseDAL
    {
        DataClasses1DataContext db = new DataClasses1DataContext();
        /// <summary>
        /// 所有课程信息
        /// </summary>
        /// <returns></returns>
        public List<tb_course> GetTb_Course()
        {
            return db.tb_course.ToList();
        }
        /// <summary>
        /// 按条件查询输出list
        /// </summary>
        /// <param name="predicate"></param>
        /// <returns></returns>
        public List<tb_course> GetCourse(Expression<Func<tb_course, bool>> predicate)
        {
            return db.tb_course.Where(predicate).ToList();
        }

        public List<tb_course> GetPagedCourse(int pageindex, int pagesize, out int recordCount)
        {
            recordCount = db.tb_course.Count();
            return db.tb_course.Skip(pagesize * (pageindex - 1)).Take(pagesize).ToList();
        }

        public List<tb_course> GetPagedCourse(Expression<Func<tb_course, bool>> predicate, int pageindex, int pagesize, out int recordCount)
        {
            recordCount = db.tb_course.Where(predicate).Count();
            return db.tb_course.Where(predicate).Skip(pagesize * (pageindex - 1)).Take(pagesize).ToList();
        }
    }
}
