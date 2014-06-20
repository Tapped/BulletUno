using Uno.Compiler.ExportTargetInterop;

namespace Experimental_Bullet
{	
	[TargetSpecificType]
	public class WorldHandler {}
	
	[TargetSpecificImplementation]
	public static class WorldImpl
	{
		[TargetSpecificImplementation]
		public static WorldHandler Create();
	}
	
	public class World
	{
		WorldHandler instance;
		
		public World()
		{
			instance = WorldImpl.Create();
		}
	}
}