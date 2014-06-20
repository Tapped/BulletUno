using Uno.Compiler.ExportTargetInterop;

namespace Experimental.Bullet
{
	[TargetSpecificType]
	public class MatrixHandle {}

	[TargetSpecificImplementation]
	static class MatrixImpl
	{
		[TargetSpecificImplementation]
        public static extern MatrixHandle Create(float m11, float m12, float m13, float m14,
									float m21, float m22, float m23, float m24,
									float m31, float m32, float m33, float m34,
									float m41, float m42, float m43, float m44);

        [TargetSpecificImplementation]
        public static extern float[] Get(MatrixHandle handler);
	}

	public class Matrix
	{
		public MatrixHandle handle;
		public Matrix(float4x4 a)
		{
			handle = MatrixImpl.Create(a.M11, a.M12, a.M13, a.M14,
									   a.M21, a.M22, a.M23, a.M24,
									   a.M31, a.M32, a.M33, a.M34,
									   a.M41, a.M42, a.M43, a.M44);
		}

		public Matrix(MatrixHandle handler)
		{
			handle = handler;
		}

		public float4x4 Get()
		{
			float []data = MatrixImpl.Get(handle);
			return float4x4(data[0], data[1], data[2], data[3],
							data[4], data[5], data[6], data[7],
							data[8], data[9], data[10], data[11],
							data[12], data[13], data[14], data[15]);
		} 
	}
}