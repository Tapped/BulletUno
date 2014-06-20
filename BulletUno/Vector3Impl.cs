using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BulletUno
{
    public class Vector3Handler
    {
        public float X, Y, Z;

        public Vector3Handler(float x, float y, float z)
        {
            X = x;
            Y = y;
            Z = z;
        }
    }

    public static class Vector3Impl
    {
        public static Vector3Handler Create(float x, float y, float z)
        {
            return new Vector3Handler(x, y, z);
        }

        public static float GetX(Vector3Handler handler)
        {
            return handler.X;
        }

        public static float GetY(Vector3Handler handler)
        {
            return handler.Y;
        }

        public static float GetZ(Vector3Handler handler)
        {
            return handler.Z;
        }
    }
}
