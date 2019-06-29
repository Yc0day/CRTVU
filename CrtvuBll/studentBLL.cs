using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Crtvu.Dal;


namespace Crtvu.Bll
{
    public class studentBLL
    {
        studentDAL dal = new studentDAL();
        public List<tb_student> GetStudent()
        {
            return dal.GetStudent();
        }
        public tb_student GetStudentInfo(Int64 id)
        {
            return dal.GetStudentInfo(id);
        }
        public void ModifyStuInfo(tb_student stu)
        {
            dal.UpdateStuInfo(stu);
        }
        public void ModifyPwd(Int64 id, string pwd)
        {
            dal.ModifyPwd(id, pwd);
        }
    }
}
