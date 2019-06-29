using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using StackExchange.Redis;

namespace redisconn
{
  public  class conn
    {
        public static ConnectionMultiplexer GetManager(string connectionString=null)
        {
            if (string.IsNullOrEmpty(connectionString))
            {
                connectionString = "127.0.0.1:6379";
            }
            return ConnectionMultiplexer.Connect(connectionString);
        }
        public string yanzheng(string id)
        {
            ConnectionMultiplexer getredis = conn.GetManager();
            string mou = getredis.GetDatabase(1).StringGet(id);
            if (mou == null)
            {
                return "false";
            }
            else
            {
               return getredis.GetDatabase(2).StringGet(id);
            }
        }
    }
}
