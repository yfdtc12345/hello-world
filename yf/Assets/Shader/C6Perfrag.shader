﻿// Upgrade NOTE: replaced '_World2Object' with 'unity_WorldToObject'

Shader "Unity Shader Book/Chapter 6/Diffuse2" {
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
			float3 worldNormal:TEXCOORD0;
		};

		v2f vert(a2v v){
			v2f o;
			o.pos = mul(UNITY_MATRIX_MVP,v.vertex);
			o.worldNormal = mul(v.normal,(float3x3)unity_WorldToObject);
			return o;
		}

		fixed4 frag(v2f i):SV_Target{
			fixed3 am = UNITY_LIGHTMODEL_AMBIENT.xyz;
			fixed3 worldNormal = normalize(i.worldNormal);
			fixed3 worldLightDir = normalize(_WorldSpaceLightPos0.xyz);
			fixed3 diff = _LightColor0.rgb*_Diffuse.rgb*saturate(dot(worldNormal,worldLightDir)*0.5+0.5);
			fixed3 col = diff+am;
			return fixed4(col,1.0);			
		}
		ENDCG
		}
	}
	FallBack "Diffuse"
}
