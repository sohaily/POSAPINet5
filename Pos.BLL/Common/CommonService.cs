using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace Pos.BLL
{
    public static class CommonService
    {
        #region Password Hash + Salt
        private static int saltLengthLimit = 32;
        private static byte[] GetSalt(int maximumSaltLength)
        {
            var salt = new byte[maximumSaltLength];
            using (var random = new RNGCryptoServiceProvider())
            {
                random.GetBytes(salt);
            }
            return salt;
        }

        public static string GetSaltString()
        {
            return System.Text.Encoding.Unicode.GetString(GetSalt(saltLengthLimit));
        }

        public static byte[] GetSaltByteArray(string txt)
        {
            return System.Text.Encoding.Unicode.GetBytes(txt);
        }

        public static string GetHashSha256(string password, byte[] saltByteArray)
        {
            byte[] passwordBytes = Encoding.Unicode.GetBytes(password);

            Byte[] hashBytes;
            using (var ms = new MemoryStream())
            {
                using (var br = new BinaryWriter(ms))
                {
                    br.Write(passwordBytes);
                    br.Write(saltByteArray);
                }
                hashBytes = ms.ToArray();
            }

            var sha256Managed = new SHA256Managed();
            byte[] hash = sha256Managed.ComputeHash(hashBytes);

            return ConvertByteArrayToString(hash);
        }

        private static string ConvertByteArrayToString(byte[] byteArray)
        {
            return System.Text.Encoding.Default.GetString(byteArray);
        }
        #endregion
      
    }
}
