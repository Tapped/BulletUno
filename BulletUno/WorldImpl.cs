using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BulletSharp;

namespace BulletUno
{
    public class WorldHandler : DiscreteDynamicsWorld
    {
        public WorldHandler(Dispatcher dispatcher, BroadphaseInterface pairCache, ConstraintSolver constraintSolver, CollisionConfiguration collisionConfiguration) : 
            base(dispatcher, pairCache, constraintSolver, collisionConfiguration)
        {
        }
    }

    public static class WorldImpl
    {
        public static WorldHandler Create()
        {
            Dispatcher dispatcher = new CollisionDispatcher();
            BroadphaseInterface broadphaseInterface = new DbvtBroadphase();
            CollisionConfiguration collisionConf = new DefaultCollisionConfiguration();

            return new WorldHandler(dispatcher, broadphaseInterface, null, collisionConf);
        }

        public static void SetGravity(WorldHandler handler, float x, float y, float z)
        {
            handler.Gravity = new Vector3(x, y, z);
        }

        //public static GetGravity(WorldHandler handler)
    }
}
