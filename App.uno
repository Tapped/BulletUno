using Uno;
using Uno.Collections;
using Uno.Graphics;
using Uno.Scenes;
using Uno.Drawing.Primitives;
using Uno.Content;
using Uno.Content.Models;
using Experimental.Bullet;

namespace BulletTest
{
    public class App : Uno.Application
    {
		const int arraySize = 5;
		float3 startPos = float3(-5, -5, 20);

		World world = new World();
		Box[] boxes = new Box[arraySize * arraySize * arraySize + 1];

		public App()
		{
			Context.Camera.Transform.Position = new float3(10, 10, 15);
			world.Gravity = float3(0, 0, -10.0f);

			boxes[0] = new Box(world, 0, float3(0), float3(50, 50, 0), float3(1, 1, 0));

			for(int x = 0;x < arraySize;++x)
			{
				for(int y = 0;y < arraySize;++y)
				{
					for(int z = 0;z < arraySize;++z)
					{
						float3 pos = float3(2 * x + startPos.X, 2 * y + startPos.Y, 2 * z + startPos.Z);
						boxes[(x*arraySize*arraySize) + (y*arraySize) + z + 1] = new Box(world, 1, pos, float3(1), float3(1, 0, 0));
					}
				}
			}
		}

		~App()
		{
			world.Dispose();
		}

		public override void Update()
		{
			base.Update();
			world.StepSimulation((float)FrameInterval);
		}

        public override void Draw()
        {
        	for(int i = 0;i < boxes.Length;++i)
        	{
        		var box = boxes[i];
				draw DefaultShading, Cube
				{
					public float4x4 World: Uno.Matrix.Mul(Uno.Matrix.Scaling(box.Size*2.0f), box.WorldTransform);
					PixelColor: float4(box.Color, 1);
				};
			}
        }
    }
}