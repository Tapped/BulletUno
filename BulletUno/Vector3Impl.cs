using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BulletSharp;

namespace Experimental.Bullet
{
    public class Vector3Handle
    {
        public Vector3 handle;
        public Vector3Handle(float x, float y, float z)
        {
            handle = new Vector3(x, y, z);
        }
    }

    public static class Vector3Impl
    {
        public static Vector3Handle Create(float x, float y, float z)
        {
            return new Vector3Handle(x, y, z);
        }

        public static float GetX(Vector3Handle handler)
        {
            return handler.handle.X;
        }

        public static float GetY(Vector3Handle handler)
        {
            return handler.handle.Y;
        }

        public static float GetZ(Vector3Handle handler)
        {
            return handler.handle.Z;
        }
    }
}
