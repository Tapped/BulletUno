using Uno;
using Uno.Collections;
using Uno.Graphics;
using Uno.Scenes;
using Uno.Scenes.Primitives;
using Uno.Content;
using Uno.Content.Models;

namespace BulletTest
{
    public class App : Uno.Application
    {
		public App()
		{
		}

		public override void Update()
		{
		}

        public override void Draw()
        {
			draw DefaultShading, Cube,
			{
			};
        }
    }
}