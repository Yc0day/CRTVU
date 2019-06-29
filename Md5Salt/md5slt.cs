using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Security.Cryptography;

namespace Md5.Salt
{
   public class md5slt
    {
            private static string MD5Encoding(string rawPass)
            {
                MD5 md5 = MD5CryptoServiceProvider.Create();
                byte[] bs = Encoding.UTF8.GetBytes(rawPass);
                byte[] hs = md5.ComputeHash(bs);
                StringBuilder sb = new StringBuilder();
                foreach (byte b in hs)
                {
                    sb.Append(b.ToString("x2"));
                }
                return sb.ToString();
            }
            public static string MD5Encoding(string rawPass, object salt)
            {
                if (salt == null) return rawPass;
                return MD5Encoding(rawPass + "{" + salt.ToString() + "}");
            }
    }
}
