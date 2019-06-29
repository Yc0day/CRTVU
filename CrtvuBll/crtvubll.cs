using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Crtvu.Dal;

namespace Crtvu.Bll
{
  public  class crtvubll
    {
        crtvudal a = new crtvudal();
        public List<tb_student> getbll()
        {
            return a.getdal();
        }
        public tb_teacher search(string id)
        {
            return a.search(id);
        }
        public List <tb_course> Csearch(string id)
        {
            return a.Csearch(id);
        }
        public List<tb_sc> CSshow(string id, string tid)
        {
             return a.CSshow(id, tid);
        }
        public tb_teacher Selfin(Int64 id)
        {

            return a.Selfin(id);
        }
        public tb_student StuSelf(Int64 id)
        {
            return a.StuSelf(id);
        }
        public bool SCupdate(Int64 id,string grade)
        {
           return a.SCupdate(id,grade);
         }
        public bool Desc(Int64 id)
        {
           return a.Del(id);
        }
        public bool Teaupdata(Int64 id, string name,string nplace,string phone)
        {
         return   a.Teaupdata(id, name, nplace, phone);
        }
        public bool UPpass(Int64 id, string oldpass, string newpass)
        {
          return  a.UPpass(id,oldpass,newpass);
        }
    }
}
