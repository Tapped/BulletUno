using Uno.Compiler.ExportTargetInterop;

namespace Experimental.Bullet
{
	[TargetSpecificType]
	class WorldHandle {}

	[TargetSpecificImplementation]
	static class WorldImpl
	{
		[TargetSpecificImplementation]
		public static extern WorldHandle Create();

		[TargetSpecificImplementation]
		public static extern void SetGravity(WorldHandle handler, Vector3Handle vectorHandler);

		[TargetSpecificImplementation]
		public static extern Vector3Handle GetGravity(WorldHandle handler);

		[TargetSpecificImplementation]
		public static extern void StepSimulation(WorldHandle handler, float deltaTime);

		[TargetSpecificImplementation]
		public static extern void AddCollisionShape(WorldHandle handler, BoxShapeHandle shape);

		[TargetSpecificImplementation]
		public static extern RigidBodyHandle CreateRigidBody(WorldHandle handler, float mass, MatrixHandle startTransform, BoxShapeHandle shapeHandler);
		
		[TargetSpecificImplementation]
		public static extern void Dispose(WorldHandle handler);
	}

	public class World
	{
		WorldHandle handle;

		public World()
		{
			handle = WorldImpl.Create();
		}

		public float3 Gravity
		{
			get
			{
				return new Vector3(WorldImpl.GetGravity(handle)).Get();
			}
			set
			{
				WorldImpl.SetGravity(handle, new Vector3(value).handle);
			}
		}

		public void StepSimulation(float deltaTime)
		{
			WorldImpl.StepSimulation(handle, deltaTime);
		}

		public void AddCollisionShape(BoxShape shape)
		{
			WorldImpl.AddCollisionShape(handle, shape.handle);
		}

		public RigidBody CreateRigidBody(float mass, float4x4 startTransform, BoxShape shape)
		{
			return new RigidBody(WorldImpl.CreateRigidBody(handle, mass, new Matrix(startTransform).handle, shape.handle));
		}

		public void Dispose()
		{
			WorldImpl.Dispose(handle);
		}
	}
}