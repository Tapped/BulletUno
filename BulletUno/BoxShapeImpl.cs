using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BulletSharp;

namespace Experimental.Bullet
{
    public class BoxShapeHandle : BoxShape
    {
        public BoxShapeHandle(float boxHalfExtentsX, float boxHalfExtentsY, float boxHalfExtentsZ)
            : base(boxHalfExtentsX, boxHalfExtentsY, boxHalfExtentsZ)
        {}
    }

    public static class BoxShapeImpl
    {
        public static BoxShapeHandle Create(float boxHalfExtentsX, float boxHalfExtentsY, float boxHalfExtentsZ)
        {
            return new BoxShapeHandle(boxHalfExtentsX, boxHalfExtentsY, boxHalfExtentsZ);
        }
    }
}
