using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EASModel
{
    public class Pager
    {
        public int PageIndex { get; set; }
        public int PageSize { get; set; }
        public int RecordCount { get; set; }

        public Dictionary<String, Object> condition { get; set; }
        public Pager(int pageindex, int pagesize, int recordCount)
        {
            this.PageIndex = pageindex;
            this.PageSize = pagesize;
            this.RecordCount = recordCount;
            condition = new Dictionary<string, object>();
        }
        public int PageCount
        {
            get
            {
                return (int)Math.Ceiling(1.0 * RecordCount / PageSize);
            }
        }

        public int LinkStart
        {
            get
            {
                int p = PageIndex - 4;
                if (p + 8 > PageCount)
                {
                    p = PageCount - 8;
                }
                if (p <= 0)
                {
                    p = 1;
                }
                return p;
            }
        }

        public int LinkEnd
        {
            get
            {
                int p = LinkStart + 8;
                if (p > PageCount)
                {
                    p = PageCount;
                }
                return p;
            }
        }

        public int Prev
        {
            get
            {
                if (PageIndex > 1)
                {
                    return PageIndex - 1;
                }
                else
                {
                    return 1;
                }
            }
        }

        public int Next
        {
            get
            {
                if (PageIndex < PageCount)
                {
                    return PageIndex + 1;
                }
                else
                {
                    return PageCount;
                }
            }
        }
    }
}
