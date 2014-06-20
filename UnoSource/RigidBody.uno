using Uno.Compiler.ExportTargetInterop;

namespace Experimental.Bullet
{
	[TargetSpecificType]
	public class RigidBodyHandle {}

	[TargetSpecificImplementation]
	static class RigidBodyImpl
	{
		[TargetSpecificImplementation]
		public static extern MatrixHandle GetTransform(RigidBodyHandle handler);
	}

	public class RigidBody
	{
		public RigidBodyHandle handle;
		
		public RigidBody(RigidBodyHandle handler)
		{
			handle = handler;
		}

		public float4x4 GetTransform()
		{
			var mat = new Matrix(RigidBodyImpl.GetTransform(handle));

			return mat.Get();
		}
	}
}