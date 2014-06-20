using Uno.Compiler.ExportTargetInterop;

namespace Experimental_Bullet
{	
	[TargetSpecificType]
	public class Vector3Handler {}
	
	[TargetSpecificImplementation]
	public static class Vector3Impl
	{
		[TargetSpecificImplementation]
		public static Vector3Handler Create(float x, float y, float z);
		
		[TargetSpecificImplementation]
		public static float GetX(Vector3Handler handler);
		
		[TargetSpecificImplementation]
		public static float GetY(Vector3Handler handler);
		
		[TargetSpecificImplementation]
		public static float GetZ(Vector3Handler handler);
	}
	
	public class Vector3
	{
		Vector3Handler instance;
		
		public Vector3()
		{
			instance = Vector3Impl.Create(0, 0, 0);
		}
		
		public Vector3(Vector3Handler handler)
		{
			instance = handler;
		}

		public Vector3(float3 a)
		{
			instance = Vector3Impl.Create(a.X, a.Y, a.Z);
		}
		
		public void Set(float3 a)
		{
			instance = Vector3Impl.Create(a.X, a.Y, a.Z);
		}
		
		public float3 Get()
		{
			if(instance != null)
			return float3(Vector3Impl.GetX(instance), Vector3Impl.GetY(instance), Vector3Impl.GetZ(instance));
		}
	}
}