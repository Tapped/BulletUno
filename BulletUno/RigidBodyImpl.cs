using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BulletSharp;

namespace Experimental.Bullet
{
    public class RigidBodyHandle : RigidBody
    {
        public RigidBodyHandle(RigidBodyConstructionInfo rbInfo) : base(rbInfo)
        {
        }
    }

    public static class RigidBodyImpl
    {
        public static MatrixHandle GetTransform(RigidBodyHandle handler)
        {
            MatrixHandle result = new MatrixHandle();
            handler.GetWorldTransform(out result.handle);
            return result;
        }
    }
}
