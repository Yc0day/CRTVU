using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Crtvu.Dal;

namespace Crtvu.Bll
{
    public class scBLL
    {
        scDAL dal = new scDAL();

        public List<tb_sc> GetSc(Int64 stuid)
        {
            return dal.GetSc(a => (stuid != -1 ? a.sid == stuid : true));
        }

    }
}
