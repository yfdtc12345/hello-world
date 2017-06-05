// Upgrade NOTE: replaced '_World2Object' with 'unity_WorldToObject'

Shader "Unity Shader Book/Chapter 6/Diffuse" {
	Properties {
		_Diffuse ("Diffuse", Color) = (1,1,1,1)
	}
	SubShader
	{
	Pass{
		Tags{"LightMode"="ForwardBase"}
		CGPROGRAM
		#pragma vertex vert
		#pragma fragment frag
		#include "Lighting.cginc"

		fixed4 _Diffuse;

		struct a2v{
			float4 vertex:POSITION;
			float3 normal:NORMAL;
		};

		struct v2f{
			float4 pos:SV_POSITION;
			fixed3 color:COLOR;
		};

		v2f vert(a2v v){
			v2f o;
		//将定点从模型空间转换至裁剪空间
			o.pos = mul(UNITY_MATRIX_MVP,v.vertex);
		//环境光
			fixed3 am = UNITY_LIGHTMODEL_AMBIENT.xyz;
		//转换法线坐标
			fixed3 worldNormal = normalize(mul(v.normal,(float3x3)unity_WorldToObject));
		//转换入射光方向
			fixed3 worldLight = normalize(_WorldSpaceLightPos0.xyz);

			fixed3 diff = _LightColor0.rgb*_Diffuse.rgb*saturate(dot(worldNormal,worldLight));
			o.color = am+diff;
			return o;
		}

		fixed4 frag(v2f i):SV_Target{
			return fixed4(i.color,1.0);
		}
		ENDCG
		}
	}
	FallBack "Diffuse"
}
