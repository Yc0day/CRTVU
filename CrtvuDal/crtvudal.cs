using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using StackExchange.Redis;

namespace Crtvu.Dal
{
    public class crtvudal
    {
        DataClasses1DataContext DB = new DataClasses1DataContext();

        public List<tb_student> getdal()
        {
           return DB.tb_student.ToList();
        }
        public bool Del(Int64 id)
        {
         try
          {
            tb_sc stusc = DB.tb_sc.FirstOrDefault(a => a.id == id);
                if (stusc == null)
                {
                    return false;
                }
                else
                {
                    DB.tb_sc.DeleteOnSubmit(stusc);
                    DB.SubmitChanges();
                    return true;
                }     
           }
            catch (Exception)
            {
                return false;
            }
        }
        public bool Update(string db,string id,tb_student newstu)
        {
            if (db=="student")
            {
                try
                {
                   tb_student stu = DB.tb_student.FirstOrDefault(a => a.id ==Convert.ToInt64(id));
                   
                }
                catch (Exception)
                {
                    return false;
                }
            }
            return true;
        }
        public bool SCupdate(Int64 id, string grade)
        {
            bool b = false;
            //查找出修改前的数据
            tb_sc uu = DB.tb_sc.Where(a => a.id == id).FirstOrDefault();
            if (uu != null)
            {
                try
                {
                    uu.grade = grade;
                    DB.SubmitChanges();
                    b = true;
                }
                catch { }
            }
            return b;

        }
        //public bool Insert()
        //{
        //    return true;
        //}
        public tb_teacher search(string id)
        {
            tb_teacher stu = DB.tb_teacher.FirstOrDefault(a => a.id ==Convert.ToInt64(id));
            return stu;
        }
        public List <tb_course> Csearch(string id)
        {
          return  DB.tb_course.Where(a=>a.tid==Convert.ToInt64(id)).ToList();
        }
        public List<tb_sc> CSshow(string id,string tid)
        {
            tb_course Sou = DB.tb_course.FirstOrDefault(a => a.tid ==Convert.ToInt64(tid) &&a.id==Convert.ToInt64(id));
            return DB.tb_sc.Where(a => a.cid == Sou.id).ToList();
        }
        public tb_teacher Selfin(Int64 id)
        {
            tb_teacher Self = DB.tb_teacher.FirstOrDefault(a => a.id ==id);
            return Self;
        }
        public tb_student StuSelf(Int64 id)
        {
            tb_student StuS = DB.tb_student.FirstOrDefault(a => a.id == id);
            return StuS;
        }
        public bool Teaupdata(Int64 id, string name, string nplace,string phone)
        {
            bool b = false;
            //查找出修改前的数据
            tb_teacher uu = DB.tb_teacher.Where(a => a.id == id).FirstOrDefault();
            if (uu != null)
            {
                try
                {
                    uu.name = name;
                    uu.nplace = nplace;
                    uu.phone = phone;
                    DB.SubmitChanges();
                    b = true;
                }
                catch { }
            }
            return b;
        }
        public bool UPpass(Int64 id,string oldpass,string newpass)
        {
            bool b = false;
            //查找出修改前的数据
            tb_teacher uu = DB.tb_teacher.Where(a => a.id == id&&a.password==oldpass).FirstOrDefault();
            if (uu != null)
            {
                try
                {
                    uu.password = newpass;
                    DB.SubmitChanges();
                    b = true;
                }
                catch { }
            }
            return b;
        }
    }
}
