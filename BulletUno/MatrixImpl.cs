using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BulletSharp;

namespace Experimental.Bullet
{
    public class MatrixHandle
    {
        public Matrix handle;

        public MatrixHandle() { }

        public MatrixHandle(float m11, float m12, float m13, float m14,
                            float m21, float m22, float m23, float m24,
                            float m31, float m32, float m33, float m34,
                            float m41, float m42, float m43, float m44) 
        {
            handle.M11 = m11;
            handle.M12 = m12;
            handle.M13 = m13;
            handle.M14 = m14;
            handle.M21 = m21;
            handle.M22 = m22;
            handle.M23 = m23;
            handle.M24 = m24;
            handle.M31 = m31;
            handle.M32 = m32;
            handle.M33 = m33;
            handle.M34 = m34;
            handle.M41 = m41;
            handle.M42 = m42;
            handle.M43 = m43;
            handle.M44 = m44;
        }
    }

    public static class MatrixImpl
    {
        public static MatrixHandle Create(float m11, float m12, float m13, float m14,
                            float m21, float m22, float m23, float m24,
                            float m31, float m32, float m33, float m34,
                            float m41, float m42, float m43, float m44)
        {
            return new MatrixHandle(m11, m12, m13, m14, m21, m22, m23, m24, m31, m32, m33, m34, m41, m42, m43, m44);
        }

        public static float[] Get(MatrixHandle handler)
        {
            return new float[16] {handler.handle.M11, handler.handle.M12, handler.handle.M13, handler.handle.M14,
                                  handler.handle.M21, handler.handle.M22, handler.handle.M23, handler.handle.M24,
                                  handler.handle.M31, handler.handle.M32, handler.handle.M33, handler.handle.M34,
                                  handler.handle.M41, handler.handle.M42, handler.handle.M43, handler.handle.M44};
        }
    }
}
