using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Crtvu.Dal
{
    public class studentDAL
    {
        DataClasses1DataContext db = new DataClasses1DataContext();
        public List<tb_student> GetStudent()
        {
            return db.tb_student.ToList();
        }
        public tb_student GetStudentInfo(Int64 id)
        {
            return db.tb_student.FirstOrDefault(a => a.id == id);
        }
        public void UpdateStuInfo(tb_student stu)
        {
            tb_student s = db.tb_student.FirstOrDefault(a => a.id == stu.id);
            s.id_card = stu.id_card;
            s.image = stu.image;
            s.name = stu.name;
            s.nplace = stu.nplace;
            s.othertwo = stu.othertwo;
            s.phone = stu.phone;
            s.sex = stu.sex;
            s.education = stu.education;
            s.stu_class = stu.stu_class;
            s.bid = stu.bid;
            s.bname = stu.bname;
            db.SubmitChanges();
        }

        public void ModifyPwd(Int64 stuId, string pwd)
        {
            tb_student result = db.tb_student.FirstOrDefault(a => a.id == stuId);
            result.password = pwd;
            db.SubmitChanges();
        }
    }
}
