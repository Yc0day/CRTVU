using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Linq.Expressions;

namespace Crtvu.Dal
{
    public class scDAL
    {
        DataClasses1DataContext db = new DataClasses1DataContext();
        public List<tb_sc> GetSc(Expression<Func<tb_sc, bool>> predicate)
        {
            return db.tb_sc.Where(predicate).ToList();
        }
    }
}
