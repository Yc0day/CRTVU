using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace View_model
{
    public class Student
    {
        public Int64 id { get; set; }
        public Int64? cid { get; set; }
        public Int64? sid { get; set; }
        public string grade { get; set; }
        public string s_spec { get; set; }
        public string c_spec { get; set; }

    }
}
