using Uno.Compiler.ExportTargetInterop;

namespace Experimental.Bullet
{
	[TargetSpecificType]
	public class BoxShapeHandle {}

	[TargetSpecificImplementation]
	static class BoxShapeImpl
	{
		[TargetSpecificImplementation]
		public static extern BoxShapeHandle Create(float boxHalfExtentsX, float boxHalfExtentsY, float boxHalfExtentsZ);
	}

	public class BoxShape
	{
		public BoxShapeHandle handle;
		
		public BoxShape(float boxHalfExtentsX, float boxHalfExtentsY, float boxHalfExtentsZ)
		{
			handle = BoxShapeImpl.Create(boxHalfExtentsX, boxHalfExtentsY, boxHalfExtentsZ); 
		}
	}
}