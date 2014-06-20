namespace Experimental.Bullet
{
	public class Box
	{
		RigidBody body;

		public Box(World world, float mass, float3 position, float3 size, float3 color)
		{
			BoxShape box = new BoxShape(size.X, size.Y, size.Z);
			world.AddCollisionShape(box);

			Size = size;
			Color = color;

			body = world.CreateRigidBody(mass, Uno.Matrix.Translation(position), box);
		}

		public float3 Size;
		public float3 Color;

		public float4x4 WorldTransform
		{
			get
			{
				return body.GetTransform();
			}
		}
	}
}