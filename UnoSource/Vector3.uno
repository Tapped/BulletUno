using Uno.Compiler.ExportTargetInterop;

namespace Experimental.Bullet
{
	[TargetSpecificType]
	public class Vector3Handle {}

	[TargetSpecificImplementation]
	static class Vector3Impl
	{
		[TargetSpecificImplementation]
		public static extern Vector3Handle Create(float x, float y, float z);

		[TargetSpecificImplementation]
		public static extern float GetX(Vector3Handle handler);

		[TargetSpecificImplementation]
		public static extern float GetY(Vector3Handle handler);

		[TargetSpecificImplementation]
		public static extern float GetZ(Vector3Handle handler);
	}

	public class Vector3
	{
		public Vector3Handle handle;

		public Vector3()
		{
			handle = Vector3Impl.Create(0, 0, 0);
		}

		public Vector3(Vector3Handle handler)
		{
			handle = handler;
		}

		public Vector3(float3 a)
		{
			handle = Vector3Impl.Create(a.X, a.Y, a.Z);
		}

		public void Set(float3 a)
		{
			handle = Vector3Impl.Create(a.X, a.Y, a.Z);
		}

		public float3 Get()
		{
			return float3(Vector3Impl.GetX(handle), Vector3Impl.GetY(handle), Vector3Impl.GetZ(handle));
		}
	}
}