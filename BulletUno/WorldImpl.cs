using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BulletSharp;

namespace Experimental.Bullet
{
    public class WorldHandle : DiscreteDynamicsWorld
    {
        public readonly AlignedCollisionShapeArray CollisionShapes = new AlignedCollisionShapeArray();

        CollisionConfiguration collisionConf;

        public WorldHandle(Dispatcher dispatcher, BroadphaseInterface pairCache, ConstraintSolver constraintSolver, CollisionConfiguration collisionConfiguration) : 
            base(dispatcher, pairCache, constraintSolver, collisionConfiguration)
        {
            collisionConf = collisionConfiguration;
        }

        public void Cleanup()
        {
            for (int i = NumCollisionObjects - 1; i >= 0; i--)
            {
                CollisionObject obj = CollisionObjectArray[i];
                RigidBody body = obj as RigidBody;
                if (body != null && body.MotionState != null)
                {
                    body.MotionState.Dispose();
                }

                RemoveCollisionObject(obj);
                obj.Dispose();
            }

            for(int i = 0;i < CollisionShapes.Count;++i)
            {
                CollisionShapes[i].Dispose();
            }

            CollisionShapes.Clear();
            Dispatcher.Dispose();
            Broadphase.Dispose();
            collisionConf.Dispose();
        }
    }

    public static class WorldImpl
    {
        public static WorldHandle Create()
        {
            Dispatcher dispatcher = new CollisionDispatcher();
            BroadphaseInterface broadphaseInterface = new DbvtBroadphase();
            CollisionConfiguration collisionConf = new DefaultCollisionConfiguration();

            return new WorldHandle(dispatcher, broadphaseInterface, null, collisionConf);
        }

        public static void SetGravity(WorldHandle handler, Vector3Handle vectorHandler)
        {
            handler.Gravity = vectorHandler.handle;
        }

        public static Vector3Handle GetGravity(WorldHandle handler)
        {
            return new Vector3Handle(handler.Gravity.X, handler.Gravity.Y, handler.Gravity.Z);
        }

        public static void AddCollisionShape(WorldHandle handler, BoxShapeHandle shapeHandler)
        {
            handler.CollisionShapes.Add(shapeHandler);
        }

        public static void StepSimulation(WorldHandle handler, float deltaTime)
        {
            handler.StepSimulation(deltaTime);
        }

        public static RigidBodyHandle CreateRigidBody(WorldHandle handler, float mass, MatrixHandle startTransform, BoxShapeHandle shapeHandler)
        {
            bool isDynamic = (mass != 0.0f);

            Vector3 localInertia = Vector3.Zero;
            if (isDynamic)
                shapeHandler.CalculateLocalInertia(mass, out localInertia);

            DefaultMotionState defaultMotionState = new DefaultMotionState(startTransform.handle);

            RigidBodyConstructionInfo rbInfo = new RigidBodyConstructionInfo(mass, defaultMotionState, shapeHandler, localInertia);
            RigidBodyHandle body = new RigidBodyHandle(rbInfo);
            rbInfo.Dispose();

            handler.AddRigidBody(body);

            return body;
        }

        public static void Dispose(WorldHandle handler)
        {
            handler.Cleanup();
            handler.Dispose();
        }
    }
}
