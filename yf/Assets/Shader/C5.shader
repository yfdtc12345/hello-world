﻿Shader "Unity Shader Book/Chapter 5/Simple Shader"{
	SubShader {
	Pass{
		CGPROGRAM
		#pragma vertex vert
		#pragma fragment frag

		struct a2v{
			float4 vertex:POSITION;
			float3 normal:NORMAL;
			float4 texcoord:TEXCOORD0;
		};

		struct v2f{
			float4 pos:SV_POSITION;
			fixed3 color:COLOR0;
		};


		v2f vert (a2v v) : POSITION{
			v2f o;
			o.pos = mul(UNITY_MATRIX_MVP,v.vertex);
			o.color = v.normal*0.5+fixed3(0.5,0.5,0.5);
			return o;
		}

		fixed4 frag(v2f i):SV_Target{
			return fixed4(i.color,1);
		}
		ENDCG
}
}
}